format_intensity(i) = uconvert(u"W/m^2", i)

"""
    intensity(p::Unitful.Pressure, M::Medium)
p is expected to be a single number in units of pascal.
Output unit is W/m².
"""
function intensity(p::Unitful.Pressure, M::Medium)
    return format_intensity(p^2 / (M.density * M.c))
end

"""
    intensity_sppa(p::Unitful.Pressure, M::Medium, E::Excitation)
Spatial Peak, Pulse Averaged Intensity.
Spatial Peak, Pulse Averaged Intensity.
p is expected to be a vector/time series containing only the measured pressure from the excitation pulse.
Output unit is W/cm².
"""
function intensity_sppa(pressure, medium, excitation)
    # account for sampling frequency by multiplying pressure values with dt
    dt = 1/excitation.fs
    intensities = mapreduce(
        p -> intensity(p, medium) * dt, +, pressure; dims=1
    ) 
    return uconvert.(u"W/cm^2", squeeze(intensities / excitation.pulse_duration))
end


"""
    intensity_spta(p::Unitful.Pressure, M::Medium, E::Excitation)
Spatial Peak, Time Averaged Intensity.
p is expected to be a vector/time series containing only the measured pressure from the excitation pulse.
Output unit is W/cm².
"""
intensity_spta(p, M, E) = intensity_sppa(p, M, E) * E.duty_cycle # W/cm²


"""
energy_spta(p::Unitful.Pressure, M::Medium, E::Excitation)
This is the intensity_spta() times the total duration.
Output unit is J/cm2.
"""
function energy_spta(p::Vector{T}, M::Medium, E::Excitation) where {T<:Unitful.Pressure}
    return intensity_spta(p, M, E) * E.total_duration # J/cm2
end

"""
    mechanical_index(p::Unitful.Pressure, E::Excitation)
p is expected to be a vector/time series containing the measured pressure from the excitation pulse.
Output is dimensionless.
"""
function mechanical_index(p::Vector{T}, E::Excitation) where {T<:Unitful.Pressure}
    peak_rarefaction_pressure = peak_np(uconvert.(u"MPa", p))
    center_frequency = sqrt(uconvert(u"MHz", E.f0))
    return ustrip(peak_rarefaction_pressure / center_frequency)
end


"""
    peak_np(p)
    Peak Negative Pressure.
"""
peak_np(p::Vector{T}) where {T<:Unitful.Pressure}= abs(minimum(p)) # Pa

"""
    peak_pp(p)
    Peak Positive Pressure.
    Output unit is unchanged, Pa.
"""
peak_pp(p::Vector{T}) where {T<:Unitful.Pressure} = abs(maximum(p)) # Pa

"""
    peak_ptp(p)
    peak pressure measured in peak-to-peak.
    Output unit is unchanged, Pa.
"""
peak_ptp(p::Vector{T}) where {T<:Unitful.Pressure} =
    peak_pp(p) + peak_np(p)  #Pa

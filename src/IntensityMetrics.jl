module IntensityMetrics

using Unitful

export Medium, Excitation
export intensity, intensity_sppa, intensity_spta, mechanical_index
export peak_np, peak_pp, peak_ptp

const PressureArray{x} = Array{T, x} where T <: Union{Unitful.Pressure, Number}

squeeze(A::PressureArray{2}) = A[1, :]
squeeze(A::PressureArray{3}) = A[1, :, :]
squeeze(A::PressureArray{4}) = A[1, :, :, :]



const volt = typeof(1.0u"V")
const kg_per_m3 = typeof(1.0u"kg/m^3")
const m_per_s = typeof(1.0u"m" / 1.0u"s")
const seconds = typeof(1.0u"s")
const herz = typeof(1.0u"Hz")
const pascal = typeof(1.0u"Pa")

"""
struct Medium
    density: Density in kg/m³
          c: Speed of sound in m/s
end
"""
struct Medium
    density::kg_per_m3 # density in kg/m³
    c::m_per_s # speed of sound in m/s
end
Medium() = Medium(1000.0u"kg/m^3", 1480.0u"m/s")
#TODO: make a selector for 20C water and standard human tissue.

"""
struct Excitation
    pulse_duration: On-time / duration of the excitation pulse in seconds.
        duty_cycle: [0, 1]
                f0: Center frequency in Hz
end
"""
struct Excitation
    f0::herz                # Center frequency in Hz
    pulse_duration::seconds # seconds
    duty_cycle::Float64     # [0,1]
    total_duration::seconds
end

Excitation() = Excitation(5e6u"Hz", 0.1u"s", 1.0, 10u"s")
Excitation(f0, pd::Number, dc) = Excitation(f0, Float64(pd), dc, 10)

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
intensity(p_vec::Vector{T}, M::Medium) where {T <: Unitful.Pressure} =
    map(p -> intensity(p, M), p_vec)  # W/m²
"""
# Unitless version
#intensity(p::T, M::Medium) where {T :< Number} = p^2 / ustrip(M.ρ * M.c)
#intensity(p_vec::Vector{T}, M::Medium) where {T :< Number} = map(p_vec->intensity(p_vec,M),p_vec)  # W/m²


"""
    intensity_sppa(p::Unitful.Pressure, M::Medium, E::Excitation)
    Spatial Peak, Pulse Averaged Intensity.
    Spatial Peak, Pulse Averaged Intensity.
    p is expected to be a vector/time series containing only the measured pressure from the excitation pulse.
    Output unit is W/cm².

function intensity_sppa(p::Vector{T}, M::Medium, E::Excitation) where {T<:Unitful.Pressure}
    scaling = 1u"s"/(E.pulse_duration * 10_000u"cm^2/m^2");
    integrated = mapreduce(p -> intensity(p, M), +, p);  # W/cm²
    return integrated * scaling  # W/cm²
end
"""

function intensity_sppa(pressure, medium, excitation)
    intensities = u"s" * mapreduce(
        p -> intensity(p, medium), +, pressure; dims=1
    ) 
    return squeeze(intensities / (excitation.pulse_duration * 10_000u"cm^2/m^2"))
end


"""
    intensity_spta(p::Unitful.Pressure, M::Medium, E::Excitation)
    Spatial Peak, Time Averaged Intensity.
    p is expected to be a vector/time series containing only the measured pressure from the excitation pulse.
    Output unit is W/cm².
function intensity_spta(p::Vector{T}, M::Medium, E::Excitation) where {T<:Union{Unitful.Pressure,Number}}
    return intensity_sppa(p, M, E) * E.duty_cycle # W/cm²
end
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
mechanical_index(p::Vector{T}, E::Excitation) where {T<:Unitful.Pressure} =
    peak_np(p / 1u"MPa") / sqrt(E.f0 / 1u"MHz")
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


end

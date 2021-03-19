module IntensityMetrics

export Medium, Excitation
export intensity, intensity_sppa, intensity_spta, mechanical_index, peak_np, peak_pp, peak_ptp

"""
struct Medium
    ρ: Density in kg/m³
    c: Speed of sound in m/s
end
"""
struct Medium{T <: AbstractFloat}
    ρ::T # density in kg/m³
    c::T # speed of sound in m/s
end

"""
struct Excitation
    pulse_duration: On-time / duration of the excitation pulse in seconds.
        duty_cycle: [0, 1]
                f0: Center frequency in Hz
end
"""
struct Excitation{T <: AbstractFloat}
    pulse_duration::T # seconds
    duty_cycle::T     # [0,1]
    f0::T             # Center frequency in Hz
end

"""
    intensity(p, M::Medium)
    p is expected to be a single number in units of pascal.
    Output unit is W/m².

"""
intensity(p, M::Medium) = p^2 / (M.ρ * M.c)    # W/m²

"""
    intensity_sppa(p, M::Medium, E::Excitation)
    Spatial Peak, Pulse Averaged Intensity.
    p is expected to be a vector/time series containing only the measured pressure from the excitation pulse.
    Output unit is W/cm².
"""
intensity_sppa(p, M::Medium, E::Excitation) = mapreduce(p -> intensity(p, M), +, p) / (E.pulse_duration * 10_000) # W/cm²

"""
    intensity_spta(p, M::Medium, E::Excitation)
    Spatial Peak, Time Averaged Intensity.
    p is expected to be a vector/time series containing only the measured pressure from the excitation pulse.
    Output unit is W/cm².
"""
intensity_spta(p, M::Medium, E::Excitation) = intensity_sppa(p, M, E) * E.duty_cycle # W/cm²


"""
    mechanical_index(p, E::Excitation)
    p is expected to be a vector/time series containing the measured pressure from the excitation pulse.
    Output is dimensionless.
"""
mechanical_index(p,E::Excitation) = peak_np(p) / sqrt(E.f0 / 1_000_000)

"""
    peak_np(p)
    Peak Negative Pressure.
"""
peak_np(p) = abs(minimum(p))            # Pa

"""
    peak_pp(p)
    Peak Positive Pressure.
"""
peak_pp(p) = abs(maximum(p))            # Pa

"""
    peak_ptp(p)
    peak pressure measured in peak-to-peak.
"""
peak_ptp(p) = peak_pp(p) - peak_np(p)

end

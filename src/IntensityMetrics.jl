module IntensityMetrics

export Medium, Excitation
export intensity, Isppa, Ispta, MI

"""
struct Medium
    ρ: Density in kg/m³
    c: Speed of sound in m/s
end
"""
struct Medium
    ρ::Float64 # density in kg/m³
    c::Float64 # speed of sound in m/s
end

"""
struct Excitation
    pulse_duration: Seconds
        duty_cycle: [0,1]
                f0: Center frequency in Hz
end
"""
struct Excitation
    pulse_duration::Float64 # seconds
    duty_cycle::Float64     # [0,1]
    f0::Float64             # Center frequency in Hz
end

"""
    intensity(p, M::Medium)
    p is expected to be a single number in units of pascal.
    Output unit is W/m².

"""
intensity(p, M::Medium) = p^2/(M.ρ × M.c)                                              # W/m²

"""
    Isppa(p, M::Medium, E::Excitation)
    Spatial Peak, Pulse Averaged Intensity.
    p is expected to be a vector/time series containing only the measured pressure from the excitation pulse.
    Output unit is W/cm².
"""
Isppa(p, M::Medium, E::Excitation) = sum(intensity.(p)) / (E.pulse_duration × 10e4)    # W/cm²

"""
    Ispta(p, M::Medium, E::Excitation)
    Spatial Peak, Time Averaged Intensity.
    p is expected to be a vector/time series containing only the measured pressure from the excitation pulse.
    Output unit is W/cm².
"""
Ispta(p, M::Medium, E::Excitation) = Isppa(p, M::Medium, E::Excitation) × E.duty_cycle # W/cm²
PNP(p) = abs(minimum(p))                                                               # Pa

"""
    MI(p, E::Excitation)
    Mechanical Index.
    p is expected to be a vector/time series containing the measured pressure from the excitation pulse.
    Output is dimensionless.
"""
MI(p,E::Excitation) = PNP(p)/√(E.f0/1e6)

end

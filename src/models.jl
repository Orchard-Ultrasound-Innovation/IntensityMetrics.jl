const W_per_cm2 = typeof(1.0u"W/cm^2")
const kg_per_m3 = typeof(1.0u"kg/m^3")
const m_per_s = typeof(1.0u"m" / 1.0u"s")
const hertz = typeof(1.0u"Hz")
const seconds = typeof(1.0u"s")

const PressureArray{x} = Array{T, x} where T <: Union{Unitful.Pressure, Number, W_per_cm2}


squeeze(A::PressureArray{1}) = A[:]
squeeze(A::PressureArray{2}) = A[1, :]
squeeze(A::PressureArray{3}) = A[1, :, :]
squeeze(A::PressureArray{4}) = A[1, :, :, :]



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
    total_duration: Total duration of waveform in seconds
end
"""
struct Excitation
    f0::hertz                   # Center frequency in Hz
    pulse_duration::seconds     # seconds
    duty_cycle::Float64         # [0,1]
    total_duration::seconds     # seconds
    fs::hertz                   # Sampling frequency of the received signal in Hz
end

Excitation() = Excitation(5e6u"Hz", 0.1u"s", 1.0, 10.0u"s", 1.0u"Hz")
Excitation(f0, pulse_duration::Number, duty_cycle) = Excitation(f0, Float64(pulse_duration), Float64(duty_cycle), 10u"s", 1.0u"Hz")

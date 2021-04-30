const W_per_cm2 = typeof(1.0u"W/cm^2")
const kg_per_m3 = typeof(1.0u"kg/m^3")
const m_per_s = typeof(1.0u"m" / 1.0u"s")
const herz = typeof(1.0u"Hz")
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

using Test
using TestSetExtensions
using IntensityMetrics
using IntensityMetrics.Unitful

# ultrasound parameters
center_freq = 5e6u"Hz"
pulse_duration = 10u"µs"
pressure_amplitude = 1u"MPa"

# waveform parameters
sampling_freq = 40e6u"Hz"
dt = promote(1/sampling_freq, 1u"s")[1]
num_samples = ceil(pulse_duration/dt)
time = collect(range(0,num_samples-1,step=1))*dt
data = sin.(2*pi*center_freq*time)*pressure_amplitude

# setup 
M = Medium();
E = Excitation(center_freq, pulse_duration, 1);

@testset ExtendedTestSet "intensity calculations" begin
    @test intensity_sppa(data, M, E)[1] ≈ 337837.837u"W/m^2" atol=0.001u"W/m^2"
end

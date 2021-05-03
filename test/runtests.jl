using Test
using TestSetExtensions
using IntensityMetrics
using IntensityMetrics.Unitful

@testset "perfect sinusoid" begin
    # ultrasound parameters
    center_freq = 5e6u"Hz"
    pulse_duration = 10u"µs"
    pressure_amplitude = 1u"MPa"
    duty_cycle = 1.0
    M = Medium();
    E = Excitation(center_freq, pulse_duration, duty_cycle);

    # waveform parameters
    sampling_freq = 40e6u"Hz"
    dt = 1/sampling_freq
    num_samples = ceil(pulse_duration/dt)
    time = collect((0:num_samples-1)*dt)
    data = sin.(2*pi*center_freq*time)*pressure_amplitude
    
    # intensity tests
    intensity_expected = uconvert(u"W/m^2", pressure_amplitude^2 / (M.density*M.c))
    @test intensity(pressure_amplitude, M) ≈ intensity_expected atol=0.001u"W/m^2"
    @test intensity(uconvert(u"Pa", pressure_amplitude), M) ≈ intensity_expected atol=0.001u"W/m^2"   

    # intensity_sppa tests
    intensity_sppa_expected = uconvert(u"W/m^2", pressure_amplitude^2 / (2*M.density*M.c))
    @test intensity_sppa(data, M, E) ≈ intensity_sppa_expected atol=0.001u"W/m^2"

    # mechanical_index tests
    mechanical_index_expected = ustrip(uconvert(u"MPa", pressure_amplitude) / sqrt(uconvert(u"MHz", center_freq)))
    @test mechanical_index(data, E) ≈ mechanical_index_expected atol=0.001
    @test mechanical_index(uconvert.(u"Pa", data), E) ≈ mechanical_index_expected atol=0.001
end

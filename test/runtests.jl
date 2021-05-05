using Test
using TestSetExtensions
using IntensityMetrics
using IntensityMetrics.Unitful

@testset "perfect sinusoid" begin
    # ultrasound parameters
    f0 = 5e6u"Hz"                           # center frequency
    pressure_amplitude = 1u"MPa"
    duty_cycle = 1.0
    pulse_duration = 10u"µs"
    total_duration = pulse_duration
    fs = 40e6u"Hz"                          # sampling frequency of received signal
    M = Medium();
    E = Excitation(f0, pulse_duration, duty_cycle, total_duration, fs);

    # waveform parameters
    dt = 1/fs
    num_samples = ceil(pulse_duration/dt)
    time = collect((0:num_samples-1)*dt)
    data = sin.(2*pi*f0*time)*pressure_amplitude
    
    # intensity tests
    intensity_expected = uconvert(u"W/m^2", pressure_amplitude^2 / (M.density*M.c))
    @test intensity(pressure_amplitude, M) ≈ intensity_expected atol=0.001u"W/m^2"
    @test intensity(uconvert(u"Pa", pressure_amplitude), M) ≈ intensity_expected atol=0.001u"W/m^2"   

    # intensity_sppa tests. output is expected to be a vector
    intensity_sppa_expected = uconvert(u"W/cm^2", pressure_amplitude^2 / (2*M.density*M.c))
    @test intensity_sppa(data, M, E) ≈ [intensity_sppa_expected] atol=0.001u"W/cm^2"

    # mechanical_index tests
    mechanical_index_expected = ustrip(uconvert(u"MPa", pressure_amplitude) / sqrt(uconvert(u"MHz", f0)))
    @test mechanical_index(data, E) ≈ mechanical_index_expected atol=0.001
    @test mechanical_index(uconvert.(u"Pa", data), E) ≈ mechanical_index_expected atol=0.001
end

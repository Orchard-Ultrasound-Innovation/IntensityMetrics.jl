using Test
using SafeTestsets
using TestSetExtensions



@testset "IntensityMetrics.jl" begin
    @testset ExtendedTestSet "intensity tests" begin
            using ..IntensityMetrics
            using Unitful

            f0 = 5e6u"Hz";
            fs = 40e6u"Hz";
            pulse_duration = 10u"µs";
            dt = promote(1/fs, 1u"s")[1];
            num_samples = ceil(pulse_duration/dt)
            M = Medium();
            E = Excitation();

            t = collect(range(0,num_samples-1) *dt)
            data = sin.(2*pi*f0*t)u"MPa";

            I = intensity(data, M)
            sppa = intensity_sppa(data, M, E)
            spta = intensity_spta(data, M, E)
    end

end

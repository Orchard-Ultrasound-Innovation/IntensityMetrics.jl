var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = IntensityMetrics","category":"page"},{"location":"#IntensityMetrics","page":"Home","title":"IntensityMetrics","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [IntensityMetrics]","category":"page"},{"location":"#IntensityMetrics.Excitation","page":"Home","title":"IntensityMetrics.Excitation","text":"struct Excitation     pulseduration: On-time / duration of the excitation pulse in seconds.         dutycycle: [0, 1]                 f0: Center frequency in Hz end\n\n\n\n\n\n","category":"type"},{"location":"#IntensityMetrics.Medium","page":"Home","title":"IntensityMetrics.Medium","text":"struct Medium     density: Density in kg/m³           c: Speed of sound in m/s end\n\n\n\n\n\n","category":"type"},{"location":"#IntensityMetrics.energy_spta-Union{Tuple{T}, Tuple{Array{T,1},Medium,Excitation}} where T<:(Union{Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}, Unitful.Level{L,S,Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}} where S where L} where U where T)","page":"Home","title":"IntensityMetrics.energy_spta","text":"energy_spta(p::Unitful.Pressure, M::Medium, E::Excitation)\nThis is the intensity_spta() times the total duration.\nOutput unit is J/cm2.\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.intensity-Tuple{Union{Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}, Unitful.Level{L,S,Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}} where S where L} where U where T,Medium}","page":"Home","title":"IntensityMetrics.intensity","text":"intensity(p::Unitful.Pressure, M::Medium)\np is expected to be a single number in units of pascal.\nOutput unit is W/m².\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.intensity_sppa-Union{Tuple{T}, Tuple{Array{T,2},Medium,Excitation}} where T<:(Union{Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}, Unitful.Level{L,S,Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}} where S where L} where U where T)","page":"Home","title":"IntensityMetrics.intensity_sppa","text":"intensity_sppa(p::Unitful.Pressure, M::Medium, E::Excitation)\nSpatial Peak, Pulse Averaged Intensity.\nSpatial Peak, Pulse Averaged Intensity.\np is expected to be a vector/time series containing only the measured pressure from the excitation pulse.\nOutput unit is W/cm².\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.intensity_sppa-Union{Tuple{T}, Tuple{Array{T,3},Medium,Excitation}} where T<:(Union{Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}, Unitful.Level{L,S,Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}} where S where L} where U where T)","page":"Home","title":"IntensityMetrics.intensity_sppa","text":"intensity_sppa(p::Unitful.Pressure, M::Medium, E::Excitation)\nSpatial Peak, Pulse Averaged Intensity.\nSpatial Peak, Pulse Averaged Intensity.\np is expected to be a vector/time series containing only the measured pressure from the excitation pulse.\nOutput unit is W/cm².\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.intensity_sppa-Union{Tuple{T}, Tuple{Array{T,4},Medium,Excitation}} where T<:(Union{Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}, Unitful.Level{L,S,Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}} where S where L} where U where T)","page":"Home","title":"IntensityMetrics.intensity_sppa","text":"intensity_sppa(p::Unitful.Pressure, M::Medium, E::Excitation)\nSpatial Peak, Pulse Averaged Intensity.\nSpatial Peak, Pulse Averaged Intensity.\np is expected to be a vector/time series containing only the measured pressure from the excitation pulse.\nOutput unit is W/cm².\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.intensity_spta-Union{Tuple{T}, Tuple{Array{T,2},Medium,Excitation}} where T<:Number","page":"Home","title":"IntensityMetrics.intensity_spta","text":"intensity_spta(p::Unitful.Pressure, M::Medium, E::Excitation)\nSpatial Peak, Time Averaged Intensity.\nSpatial Peak, Time Averaged Intensity.\np is expected to be a vector/time series containing only the measured pressure from the excitation pulse.\nOutput unit is W/cm².\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.intensity_spta-Union{Tuple{T}, Tuple{Array{T,3},Medium,Excitation}} where T<:Number","page":"Home","title":"IntensityMetrics.intensity_spta","text":"intensity_spta(p::Unitful.Pressure, M::Medium, E::Excitation)\nSpatial Peak, Time Averaged Intensity.\nSpatial Peak, Time Averaged Intensity.\np is expected to be a vector/time series containing only the measured pressure from the excitation pulse.\nOutput unit is W/cm².\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.intensity_spta-Union{Tuple{T}, Tuple{Array{T,4},Medium,Excitation}} where T<:Number","page":"Home","title":"IntensityMetrics.intensity_spta","text":"intensity_spta(p::Unitful.Pressure, M::Medium, E::Excitation)\nSpatial Peak, Time Averaged Intensity.\nSpatial Peak, Time Averaged Intensity.\np is expected to be a vector/time series containing only the measured pressure from the excitation pulse.\nOutput unit is W/cm².\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.mechanical_index-Union{Tuple{T}, Tuple{Array{T,1},Excitation}} where T<:(Union{Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}, Unitful.Level{L,S,Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}} where S where L} where U where T)","page":"Home","title":"IntensityMetrics.mechanical_index","text":"mechanical_index(p::Unitful.Pressure, E::Excitation)\np is expected to be a vector/time series containing the measured pressure from the excitation pulse.\nOutput is dimensionless.\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.peak_np-Tuple{Union{Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}, Unitful.Level{L,S,Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}} where S where L} where U where T}","page":"Home","title":"IntensityMetrics.peak_np","text":"peak_np(p)\nPeak Negative Pressure.\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.peak_pp-Tuple{Union{Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}, Unitful.Level{L,S,Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}} where S where L} where U where T}","page":"Home","title":"IntensityMetrics.peak_pp","text":"peak_pp(p)\nPeak Positive Pressure.\nOutput unit is unchanged, Pa.\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.peak_ptp-Tuple{Union{Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}, Unitful.Level{L,S,Unitful.Quantity{T,𝐌 𝐋^-1 𝐓^-2,U}} where S where L} where U where T}","page":"Home","title":"IntensityMetrics.peak_ptp","text":"peak_ptp(p)\npeak pressure measured in peak-to-peak.\nOutput unit is unchanged, Pa.\n\n\n\n\n\n","category":"method"}]
}

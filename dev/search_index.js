var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = IntensityMetrics","category":"page"},{"location":"#IntensityMetrics","page":"Home","title":"IntensityMetrics","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [IntensityMetrics]","category":"page"},{"location":"#IntensityMetrics.Excitation","page":"Home","title":"IntensityMetrics.Excitation","text":"struct Excitation     pulseduration: On-time / duration of the excitation pulse in seconds.         dutycycle: [0, 1]                 f0: Center frequency in Hz end\n\n\n\n\n\n","category":"type"},{"location":"#IntensityMetrics.Medium","page":"Home","title":"IntensityMetrics.Medium","text":"struct Medium     ρ: Density in kg/m³     c: Speed of sound in m/s end\n\n\n\n\n\n","category":"type"},{"location":"#IntensityMetrics.intensity-Tuple{Any,Medium}","page":"Home","title":"IntensityMetrics.intensity","text":"intensity(p, M::Medium)\np is expected to be a single number in units of pascal.\nOutput unit is W/m².\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.intensity_sppa-Tuple{Any,Medium,Excitation}","page":"Home","title":"IntensityMetrics.intensity_sppa","text":"intensity_sppa(p, M::Medium, E::Excitation)\nSpatial Peak, Pulse Averaged Intensity.\np is expected to be a vector/time series containing only the measured pressure from the excitation pulse.\nOutput unit is W/cm².\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.intensity_spta-Tuple{Any,Medium,Excitation}","page":"Home","title":"IntensityMetrics.intensity_spta","text":"intensity_spta(p, M::Medium, E::Excitation)\nSpatial Peak, Time Averaged Intensity.\np is expected to be a vector/time series containing only the measured pressure from the excitation pulse.\nOutput unit is W/cm².\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.mechanical_index-Tuple{Any,Excitation}","page":"Home","title":"IntensityMetrics.mechanical_index","text":"mechanical_index(p, E::Excitation)\np is expected to be a vector/time series containing the measured pressure from the excitation pulse.\nOutput is dimensionless.\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.peak_np-Tuple{Any}","page":"Home","title":"IntensityMetrics.peak_np","text":"peak_np(p)\nPeak Negative Pressure.\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.peak_pp-Tuple{Any}","page":"Home","title":"IntensityMetrics.peak_pp","text":"peak_pp(p)\nPeak Positive Pressure.\n\n\n\n\n\n","category":"method"},{"location":"#IntensityMetrics.peak_ptp-Tuple{Any}","page":"Home","title":"IntensityMetrics.peak_ptp","text":"peak_ptp(p)\npeak pressure measured in peak-to-peak.\n\n\n\n\n\n","category":"method"}]
}

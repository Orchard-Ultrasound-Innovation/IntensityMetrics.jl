using RecipesBase
using UnitfulRecipes

struct IntensitySppa1D
    intensity
end

struct IntensitySppa2D
    intensity
end

struct IntensitySppa3D
    intensity
end

struct IntensitySpta1D
    intensity
end

struct IntensitySpta2D
    intensity
end

struct IntensitySpta3D
    intensity
end

@recipe function plot(sppa::IntensitySppa1D; title="Intensity SPPA 1D", label="intensity", xguide="position")
   return sppa.intensity
end

@recipe function plot(spta::IntensitySpta1D; title="Intensity SPTA 1D", label="intensity", xguide="position")
   return spta.intensity
end

@recipe function plot(sppa::IntensitySppa2D; title="Intensity SPPA 2D")
    seriestype := :heatmap
    colorbar_title :=  "Intensity W cm^-2"
    return string.(1:size(sppa.intensity, 1)), string.(1:size(sppa.intensity, 2)), sppa.intensity
end

@recipe function plot(spta::IntensitySpta2D; title="Intensity SPTA 2D")
    seriestype := :heatmap
    colorbar_title :=  "Intensity W cm^-2"
    return string.(1:size(spta.intensity, 1)), string.(1:size(spta.intensity, 2)), spta.intensity
end

@recipe function plot(sppa::IntensitySppa3D; title="Intensity SPPA 3D", xslice = nothing, yslice = nothing, zslice = nothing)
    y =
    d=Dict([(i,count(x->x==i,y)) for i in y])
    seriestype := :heatmap
    colorbar_title :=  "Intensity W cm^-2"
    return string.(1:size(sppa.intensity, 1)), string.(1:size(sppa.intensity, 2)), sppa.intensity
end

@recipe function plot(spta::IntensitySpta3D; title="Intensity SPTA 3D")
    seriestype := :heatmap
    colorbar_title :=  "Intensity W cm^-2"
    return string.(1:size(spta.intensity, 1)), string.(1:size(spta.intensity, 2)), spta.intensity
end

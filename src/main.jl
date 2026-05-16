include("mandelbrot.jl")
include("render.jl")
include("colours.jl")

using Images
using Colors
using FileIO

function main()

    width = 800
    height = 800
    max_iter = 256

    println("START")

    iter_counts = render_mandelbrot(width, height, max_iter)

    println("RENDER DONE")

    img = iterations_to_image(iter_counts, max_iter)

    println("IMAGE DONE")

    output_dir = joinpath(dirname(@__FILE__), "output")
    mkpath(output_dir)

    output_path = joinpath(output_dir, "mandelbrot.png")

    println("SAVING TO:")
    println(output_path)

    save(output_path, img)

    println("SAVE COMPLETE")

    println(isfile(output_path))
end

main()
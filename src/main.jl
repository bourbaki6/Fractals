
include("mandelbrot.jl")
include("julia_set.jl")
include("burning_ship.jl")
include("render.jl")
include("colours.jl")

using Images
using Colors
using FileIO

function main()

    width = 800
    height = 800
    max_iter  = 256

    println("====================================")
    println(" FRACTAL ENGINE ")
    println("====================================")

    project_root = dirname(dirname(@__FILE__))

    output_dir = joinpath(project_root, "output")

    mkpath(output_dir)

    println("Output directory:")
    println(output_dir)
    println()

    println("Rendering Mandelbrot Set...")

    mandelbrot_counts = render_mandelbrot(
        width,
        height,
        max_iter
    )

    mandelbrot_img = iterations_to_image(
        mandelbrot_counts,
        max_iter
    )

    mandelbrot_path = joinpath(
        output_dir,
        "mandelbrot.png"
    )

    save(mandelbrot_path, mandelbrot_img)

    println("Saved: mandelbrot.png")
    println()


    println("Rendering Julia Sets...")
    println()

    julia_params = [

        (
            ComplexF64(-0.7, 0.27015),
            "julia_dendrite"
        ),

        (
            ComplexF64(-0.4, 0.6),
            "julia_rabbit"
        ),

        (
            ComplexF64(0.285, 0.01),
            "julia_snowflake"
        ),

        (
            ComplexF64(-0.8, 0.156),
            "julia_spiral"
        )
    ]

    for (c, filename) in julia_params

        println("Rendering $filename")
        println("c = $c")

        julia_counts = render_julia(
            width,
            height,
            max_iter,
            c
        )

        julia_img = iterations_to_image(
            julia_counts,
            max_iter
        )

        julia_path = joinpath(
            output_dir,
            "$filename.png"
        )

        save(julia_path, julia_img)

        println("Saved: $filename.png")
        println()

    end


    println("Rendering Burning Ship...")

    burning_counts = render_burning_ship(
        width,
        height,
        max_iter
    )

    burning_img = iterations_to_image(
        burning_counts,
        max_iter
    )

    burning_path = joinpath(
        output_dir,
        "burning_ship.png"
    )

    save(burning_path, burning_img)

    println("Saved: burning_ship.png")
    println()


    println("Rendering Burning Ship Zoom...")

    burning_zoom_counts = render_burning_ship(
        width,
        height,
        max_iter;

        x_min = -1.9,
        x_max = -1.7,

        y_min = -0.08,
        y_max = 0.08
    )

    burning_zoom_img = iterations_to_image(
        burning_zoom_counts,
        max_iter
    )

    burning_zoom_path = joinpath(
        output_dir,
        "burning_ship_zoom.png"
    )

    save(burning_zoom_path, burning_zoom_img)

    println("Saved: burning_ship_zoom.png")
    println()

    println("====================================")
    println(" VERIFYING OUTPUTS ")
    println("====================================")

    output_files = [

        "mandelbrot.png",

        "julia_dendrite.png",
        "julia_rabbit.png",
        "julia_snowflake.png",
        "julia_spiral.png",

        "burning_ship.png",
        "burning_ship_zoom.png"
    ]

    for file in output_files

        full_path = joinpath(output_dir, file)

        println(
            rpad(file, 30),
            " : ",
            isfile(full_path)
        )

    end

    println()
    println("====================================")
    println(" ALL RENDERS COMPLETE ")
    println("====================================")

end

main()
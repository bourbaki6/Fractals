
function pixel_to_complex(px, py, width, height,
                           x_min, x_max, y_min, y_max)::ComplexF64
    real = x_min + (px / width)  * (x_max - x_min)
    imag = y_min + (py / height) * (y_max - y_min)

    return ComplexF64(real, imag)
end


function render_mandelbrot(width, height, max_iter;
                            x_min=-2.0, x_max=1.0,
                            y_min=-1.5, y_max=1.5)::Matrix{Int}
    iter_counts = zeros(Int, height, width)
    for py in 1:height
        for px in 1:width
            c = pixel_to_complex(px, py, width, height,
                                  x_min, x_max, y_min, y_max)
            iter_counts[py, px] = mandelbrot_iterations(c, max_iter)
        end
    end
    return iter_counts
end

function render_julia(width::Int,
                      height::Int,
                      max_iter::Int,
                      c::ComplexF64;

                      x_min=-2.0,
                      x_max=2.0,
                      y_min=-2.0,
                      y_max=2.0)::Matrix{Int}

    iter_counts = zeros(Int, height, width)

    for py in 1:height
        for px in 1:width

            z0 = pixel_to_complex(px, py,
                                  width, height,
                                  x_min, x_max,
                                  y_min, y_max)

            iter_counts[py, px] =
                julia_iterations(z0, c, max_iter)
        end
    end

    return iter_counts
end
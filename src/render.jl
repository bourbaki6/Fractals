
function pixel_to_complex(px, py, width, height,
                           x_min, x_max, y_min, y_max)::ComplexF64
   
    re = x_min + ((px - 1) / (width  - 1)) * (x_max - x_min)
    im = y_max - ((py - 1) / (height - 1)) * (y_max - y_min)

    return ComplexF64(re, im)
end

function render_mandelbrot(width::Int, height::Int, max_iter::Int;

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
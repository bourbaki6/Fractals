
function burning_ship_iterations(c::ComplexF64, max_iter::Int)::Int
    z = ComplexF64(0.0, 0.0)

    for i in 1:max_iter
        z = ComplexF64(abs(real(z)), abs(imag(z)))
        z = z * z + c

        if abs2(z) > 4.0
            return i
        end
    end

    return max_iter
end

function render_burning_ship(width::Int, height::Int, max_iter::Int;
                              x_min=-2.5, x_max=1.5,
                              y_min=-2.0, y_max=0.5)::Matrix{Int}

    iter_counts = zeros(Int, height, width)

    for py in 1:height
        for px in 1:width
            c = pixel_to_complex(px, py, width, height,
                                  x_min, x_max, y_min, y_max)
            iter_counts[py, px] = burning_ship_iterations(c, max_iter)
        end
    end

    return iter_counts
end
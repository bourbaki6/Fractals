
function julia_iterations(z0::ComplexF64, c::ComplexF64, max_iter::Int)::Int
    z = z0
    
    for i in 1:max_iter
        z = z * z + c
        
        if abs2(z) > 4.0
            return i
        end
    end
    return max_iter
end



function render_julia(width::Int, height::Int, max_iter::Int, c::ComplexF64;
                       x_min=-2.0, x_max=2.0,
                       y_min=-2.0, y_max=2.0)::Matrix{Int}

    iter_counts = zeros(Int, height, width)

    for py in 1:height
        for px in 1:width
            
            z0 = pixel_to_complex(px, py, width, height,
                                   x_min, x_max, y_min, y_max)
            iter_counts[py, px] = julia_iterations(z0, c, max_iter)
        end
    end

    return iter_counts
end

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

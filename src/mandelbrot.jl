
function mandelbrot_iterations(c::ComplexF64, max_iter::Int)::Int
    
    z = zero(ComplexF64)

    for i in 1:max_iter

        z = z * z + c          
        
        if abs2(z) > 4.0      
            return i
        end
    end

    return max_iter            
end
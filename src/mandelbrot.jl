
function mandelbrot_iterations(c::ComplexF64, max_iter::Int)::Int
    
    z = ComplexF64(0.0, 0.0)

    for i in 1:max_iter
        z = z * z + c           # equation
        
        if abs2(z) > 4.0        # abs2 avoids sq. rt; |z|² > 4 ≡ |z| > 2
            return i
        end
    end

    return max_iter            
end
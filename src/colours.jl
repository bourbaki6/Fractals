using Colors

function iterations_to_image(iter_counts::Matrix{Int}, max_iter::Int)

    height, width = size(iter_counts)

    img = Matrix{RGB{Float64}}(undef, height, width)

    for py in 1:height
        for px in 1:width

            n = iter_counts[py, px]

            if n == max_iter
                img[py, px] = RGB(0.0, 0.0, 0.0)
            else
                t = n / max_iter
                img[py, px] = RGB(t, t, t)
            end

        end
    end

    return img
end
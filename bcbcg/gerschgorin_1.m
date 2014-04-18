function [max,min] = gerschgorin_1 (A)
%
[num_row,num_col] = size(A);
min = realmax();
max = realmin();

for row_idx = 1:num_row
    tmp = 0;
    for col_idx = 1:num_col
        if col_idx ~= row_idx
            tmp = tmp + abs (A(row_idx,col_idx));
        end
    end
    
    if (tmp + A(row_idx, row_idx)) > max
        max = tmp + A(row_idx,row_idx);
    end
    
    if (A(row_idx,row_idx) - tmp< min)
        min = A(row_idx,row_idx) - tmp;
    end
    
end

end
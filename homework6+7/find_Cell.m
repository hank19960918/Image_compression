function cell = find_Cell(total_num,table)
count_nonZero = 0;
for i=1:total_num
    if table(2, i) ~=0
        count_nonZero = count_nonZero + 1;
    end 
end
new_table = zeros(2, count_nonZero);
position = 0;
for i=1:total_num
    if table(2, i) ~= 0
       position = position + 1;
       new_table(1, position) = table(1, i);
       new_table(2, position) = table(2, i);
    end
end
cell = new_table;

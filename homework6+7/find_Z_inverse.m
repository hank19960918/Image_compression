function ZZ = find_Z_inverse(num, table)

total_num = num*num;
total = 1;
position = 1;
new_table = zeros(num, num);

while true
    total = total + 1;
    for i = 1:num
        for  j=1:num
            if i+j == total
                if (rem(i, 2) == 1 && rem(j,2)==1) || (rem(i,2) ==0 && rem(j, 2)==0)
                    %new_matrix(position) = table(j, i);
                    new_table(j, i) = table(position);
                    position = position + 1;
                    if position == total_num+1
                        break
                    end
                else
                    %new_matrix(position) = table(i, j);
                    new_table(i, j) = table(position);
                    position = position + 1;
                    if position == total_num+1
                        break
                    end
                end
            end
        end
        if position == total_num+1
            break
        end
    end
    if position == total_num+1
        break
    end
end
ZZ = new_table;
function ZZ = find_Z(num, table)
total_num = num*num;
total = 1;
position = 1;
new_matrix = zeros(1, total_num);
while true
    total = total + 1;
    for i = 1:num
        for  j=1:num
            if i+j == total
                if (rem(i, 2) == 1 && rem(j,2)==1) || (rem(i,2) ==0 && rem(j, 2)==0)
                    %new_matrix(position) = test(j, i);
                    new_matrix(position) = table(j, i);
                    position = position + 1;
                    if position == total_num+1
                        break
                    end
                else
                    %new_matrix(position) = test(i, j);
                    new_matrix(position) = table(i, j);
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
new_table = zeros(2, total_num);
for i = 1:total_num
    count_zero = 0;
    if i == 1
        new_table(1, i) = 0;
        new_table(2, i) = new_matrix(i);
    else
        number = i;
        while  true
            count_zero = count_zero + 1;
            number = number - 1;
            if new_matrix(number) ~= 0
                break
            end              
        end
        new_table(1, i) = count_zero - 1;
        new_table(2, i) = new_matrix(i);
    end
end
ZZ = new_table;













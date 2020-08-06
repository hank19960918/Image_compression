function imagetest = image_inverse(new_decode, A, Q_table, image_height, image_width)
[new_decode_dim, new_decode_length] = size(new_decode);
new_decode_table = zeros(1, 64);
decode_position = 0;
image_store = [];
for i =1:new_decode_length
    if strcmp(new_decode(1, i), 'EOB:EOB') == 1
        zz_test = find_Z_inverse(8, new_decode_table);
        image_store = [image_store, zz_test];
        new_decode_table = zeros(1, 64);
        decode_position = 0;
        continue
    else
        newStr = split(new_decode(1, i),':');
        X = str2double(newStr(2));    
        if str2double(newStr(1)) == 0
            decode_position = decode_position + 1;
        else
             decode_position = decode_position + str2double(newStr(1)) + 1;
        end
        new_decode_table(1, decode_position) = X;
    end
end
image_reshape = zeros(image_height, image_width);
row = 1;
for i=1:8:image_height
    for j = 1:8:image_width
        image_new = image_store(1:8, (row - 1) *  8 + 1:row * 8);
        new_Y_hat =  image_new .* Q_table;
        new_X_image = A' * new_Y_hat * A;
        image_reshape(i:i+7, j:j+7) = new_X_image;
        row = row + 1;
    end
end
imagetest = image_reshape;
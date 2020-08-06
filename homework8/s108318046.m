clear all; close all;
F1 = double(imread("foreman_176x144_F1_.tif"));
F2 = double(imread("foreman_176x144_F2_.tif"));
[F2_height, F2_width] = size(F2);
T = F1 - F2;
%%
SAD_record = [];
for i=1:16:F2_height
    for j = 1:16:F2_width
        image_block = F2(i:i+15, j:j+15);
        if i-16 <= 0
            comapre_heigh_start = 1;
            comapre_heigh_end = comapre_heigh_start+31;
        elseif i+16 >= F2_height
            comapre_heigh_end = F2_height;
            comapre_heigh_start = F2_height - 31;
        else
            comapre_heigh_start = i-16;
            comapre_heigh_end = i+31;
        end
        if j-16 <= 0
            comapre_width_start = 1;
            comapre_width_end = comapre_width_start + 31;
        elseif j+16 >= F2_width
            comapre_width_end = F2_width;
            comapre_width_start = F2_width - 31;
        else
            comapre_width_start = j-16;
            comapre_width_end = j+31;
        end
        image_compare = F1(comapre_heigh_start:comapre_heigh_end, comapre_width_start:comapre_width_end);
        SAD = small_image(image_compare,image_block);
        SAD_record = [SAD_record, SAD];
    end
end
%%
SAD_record = SAD_record';
[Mu,ia,ic] = unique(SAD_record, 'rows');
h = accumarray(ic, 1);
maph = h(ic);          
Result = [SAD_record, maph];
B = sortrows(Result);
D = unique(B,'rows');

symbol = cellstr(D(:, 1));
prob = double(string(double(D(:, 2)))) / sum(double(D(:, 2)));
[dict,avglen] = huffmandict(symbol,prob);

encoding_name = encoding(SAD_record', dict);

decoding_name = decoding(encoding_name, dict);

%%
F2_image_decode = zeros(F2_height, F2_width);
position = 0;
for i=1:16:F2_height
    for j = 1:16:F2_width
        if i-16 <= 0
            comapre_heigh_start = 1;
            comapre_heigh_end = comapre_heigh_start+31;
        elseif i+16 >= F2_height
            comapre_heigh_end = F2_height;
            comapre_heigh_start = F2_height - 31;
        else
            comapre_heigh_start = i-16;
            comapre_heigh_end = i+31;
        end
        if j-16 <= 0
            comapre_width_start = 1;
            comapre_width_end = comapre_width_start + 31;
        elseif j+16 >= F2_width
            comapre_width_end = F2_width;
            comapre_width_start = F2_width - 31;
        else
            comapre_width_start = j-16;
            comapre_width_end = j+31;
        end
        image_F1_compare = F1(comapre_heigh_start:comapre_heigh_end, comapre_width_start:comapre_width_end);
        position = position + 1;
        newStr = split(decoding_name(position), ':');
        new_height = str2double(cell2mat(newStr(1)));
        new_width = str2double(cell2mat(newStr(2)));
         F2_patch = image_F1_compare(new_height:new_height + 15,new_width :new_width + 15);
        F2_image_decode(i:i+15, j:j+15) = F2_patch;
    end
end
imshow(F2_image_decode, [])
imwrite(uint8(F2_image_decode),"F2_H.jpg")
F2_jpg = double(imread("F2_new.jpg"));
MSE = mse(F2_image_decode, F2)
PSNR = psnr(MSE)
%%
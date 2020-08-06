clear; close all;
X = imread('foreman_176x144_F2_.tif');
[image_height, image_width] = size(X); 
X_float=double(X);
[x1,y1,z1] = size(X_float);
image_size = x1 * y1;
num = 8;
total_num = num*num;
for i=0:num-1
    for j=0:num-1
        if i==0
            C=sqrt(1/num);
        else
            C=sqrt(2/num);
        end
        A(i+1,j+1)=C*cos((2*j+1)*i*pi/(2*num));
    end
end
 
Q_table=[16 11 10 16 24 40 51 61
    12 12 14 19 26 58 60 55
    14 13 16 24 40 57 69 56
    14 17 22 29 51 87 80 62
    18 22 37 56 68 109 103 77
    24 35 55 64 81 104 113 92
    49 64 78 87 103 121 120 101
    72 92 95 98 112 100 103 99];
cell_matrix = [];
test_length = [];
test_name = [];
for i=1:8:image_height
    for j=1:8:image_width
        new_Y2_jpg = X_float(i:i+7, j:j+7);
        Y = A*new_Y2_jpg*A';
        Index_table = fix(Y ./  Q_table);
        ZZ_table = find_Z(num, Index_table);
        new_table = find_Cell(total_num, ZZ_table); 
        new_table_string = string(new_table);
        [dim, length] = size(new_table_string);
        for k = 1:length
           name =  join([new_table_string(1, k),':', new_table_string(2, k)], '');
           test_name = [test_name, name];
        end
        eob = string(['EOB:EOB']);
        test_name = [test_name, eob];
    end
end
% calculate  the  symbol   probability
cell_matrix_compare = test_name';
[Mu,ia,ic] = unique(cell_matrix_compare, 'rows');
h = accumarray(ic, 1);                              % Count Occurrences
maph = h(ic);          
Result = [cell_matrix_compare, maph];
B = sortrows(Result);
D = unique(B,'rows');
total_number = sum(double(D(:, 2))) ;
prob = double(D(:, 2)) / total_number;
symbol_table = cellstr(D(:, 1));
[dict,avglen] = huffmandict(symbol_table,prob);
[prob_length, prod_dim] = size(prob);
entropy = count_entropy(prob, prob_length);
Fix_length_encoding = ceil(log2(prob_length));

tic
encoding_name = encoding(test_name, dict);
toc
%%
tic
decode_name = decoding(encoding_name, dict);
toc
%%
new_decode = decode_name;
new_decode_image = image_inverse(new_decode, A, Q_table, image_height, image_width);
imshow(new_decode_image, [])
MSE = mse(new_decode_image, X)
PSNR = psnr(MSE)
BPP = (42*1024*8)/(image_width*image_height)


















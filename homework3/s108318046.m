%{ 
Question
Use matlab built-in cameraman.tif
(1) Take left-upper 100¡Ñ100 as variable X .
(2) imshow X
(3) Use for loop to calculate the sum of all the pixel values of X and name it as variable ¡§total¡¨ (do not use the built-in function sum)

(4) Use for loop to find out how many different pixel values in X. 

(5) Find out the number of times each different pixel values appear, your answer will be a 2-row matrix, the first row contains different pixel value, the second row corresponds to the times each pixel value appears.
%}

%{
clear all
%1.solution
A=double(imread('cameraman.tif'));
X=A(1:100,1:100);
%2.solution
imshow(uint8(X))
%3.solution
total = double(0)
for i = 1:100
    for j = 1:100
        total = total + X(i, j)
    end
end
%4.solution
different_value_table = zeros(1, 255);
for i = 1:100
    for j = 1:100
          different_value_table(X(i, j)) =   different_value_table(X(i, j)) + 1;
    end
end
different_value_type = 0;
for i = 1:255
    if different_value_table(i) ~= 0
        different_value_type = different_value_type + 1;
    end
end
%5.solution
pixel = [1:255];
pixel_table = cat(1, pixel, different_value_table);
}
%

        
        






        


    

% {
1. Read cameraman.tif and name it as variable A.
2. Generate a 64 * 64 2D DCT matrix and name it as variable B.
3. Take the 64*64 upper left corner of A and name it as variable C
4. do D=tr(B)*C ,and mesh it.(¡§tr¡¨ means inverse matrix)
5. do D*B and mesh it.
%}
% {
%%
clear all;
close all;
%1.solution
A=double(imread('cameraman.tif'));
imshow(uint8(A))
%2.solution
N = 64;
B = DCT_process(N);

%3.solution
C = A(1:64,1:64);
%imshow(uint8(C));
y = B * C * B';
new_x = B' * y * B;
imshow(uint8(new_x));

%4.solution
D = B' * C;
mesh(D);
%5.solution
D_new = D * B;
mesh(D_new);
%%  
%}

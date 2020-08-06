clear; close all;
X = imread('cameraman.tif');
imshow(X); hold on
X_float=double(X);
              
 N=8;
%% For A  N
for i=0:N-1
    for j=0:N-1
        
        if i==0
            C=sqrt(1/N);
        else
            C=sqrt(2/N);
        end
        A(i+1,j+1)=C*cos((2*j+1)*i*pi/(2*N));
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

Q_table2=[10 9 7 10 24 40 51 61
    8 8 9 13 26 58 60 55
    9 8 10 18 40 57 69 56
    9 11 15 20 51 87 80 62
    18 22 37 56 68 109 103 77
    24 35 55 64 81 104 113 92
    49 64 78 87 103 121 110 99
    72 92 95 98 112 100 101 88];
%try to modify the value in high-frequency part and the value in
%low-frequency part to see what's the different of the result
%new_reconstructed_image = zeros(256, 256);
for i=1:8:256
    for j=1:8:256
        new_Y2_jpg = X_float(i:i+7, j:j+7);
        Y = A*new_Y2_jpg*A';
        Index_table = fix(Y ./  Q_table);
        new_Y_hat =  Index_table .* Q_table;
        new_X_image = A' * new_Y_hat * A;
        new_reconstructed_image(i:i+7, j:j+7) = new_X_image;
    end
end
imshow(new_reconstructed_image,[])
MSE = mse(X_float, new_reconstructed_image);
PSNR = psnr(MSE);



N=256;
%% For A  N
for i=0:N-1
    for j=0:N-1
        
        if i==0
            C=sqrt(1/N);
        else
            C=sqrt(2/N);
        end
        A(i+1,j+1)=C*cos((2*j+1)*i*pi/(2*N));
    end
end

 Y = A* X_float *A';
 mse_count = zeros(1, 256);
 x_count = zeros(1, 256);
 for times=1:256
     Y_new = zeros(256, 256);
     Y_new(1:times, 1:times) = Y(1:times, 1:times);
     X_float_new = A' * Y_new * A;
     MSE = mse(X_float, X_float_new);
     mse_count(times) = MSE;
     x_count(times) = times;
 end
figure; 
plot(x_count, mse_count, "r", 'LineWidth',2)

        
        
        
        
        
        
    
    
    





        



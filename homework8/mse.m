function MSE = mse(image1, image2)
[image1_width, image_height] = size(image1);
squaredErrorImage = (double(image1) - double(image2)) .^ 2;
MSE = sum(sum(squaredErrorImage)) / (image1_width * image_height);
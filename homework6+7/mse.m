function MSE = mse(image1, image2)
squaredErrorImage = (double(image1) - double(image2)) .^ 2;
MSE = sum(sum(squaredErrorImage)) / (256 * 256);
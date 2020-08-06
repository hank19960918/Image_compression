function PSNR = psnr(mse)
PSNR = 10 * log10( 255^2 / mse);


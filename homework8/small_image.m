function motion_vector = small_image(image_compare, image_block)
[image_compare_height, image_compare_width] = size(image_compare);
sAD_smallest = 1000000000000000;
for i = 1:image_compare_height-15
    for j = 1:image_compare_width-15
      SAD = sum(sum(abs(image_block - image_compare(i:i+15, j:j+15))));
      if SAD <= sAD_smallest
          sAD_smallest = SAD;
          vector_x = i;
          vector_y = j;
          vector = string(strcat(num2str(vector_x), ':', num2str(vector_y)));
      end
    end
end

motion_vector = vector;


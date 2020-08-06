function encoding_length = encoding(test_name, dict)
new_encode = [];
new_array = dict(:, 1)';
[test_name_dim, test_name_length] = size(test_name);
for i=1:test_name_length
   test_name_index = strcmp(test_name(i), new_array);
   [rows, cols] = find(test_name_index, 1);
   s_name = dict{cols, 2};
   new_encode = [new_encode, s_name];
end
fileID = fopen('encoding.abc','w');
fwrite(fileID,new_encode);
fclose(fileID);
encoding_length = new_encode;
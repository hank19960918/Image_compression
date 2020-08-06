function decoding_result = decoding(encoding_name, dict)
new_dict = [];
[num_length, num_dim] = size(dict);
for i=1:num_length
   dict_name = join(string(cell2mat(dict(i, 2))), '');
   new_dict = [new_dict,dict_name];
end
[encoding_dim, encoding_length] = size(encoding_name);
take_num_start = 1;
stride = 2;
count_length = 0;
take_num_end = take_num_start + stride;
decode_name = {};
while true
    compare_name = join(string(encoding_name(take_num_start:take_num_end )), '');
    index = strcmp(compare_name, new_dict);
    [rows, cols] = find(index, 1);
    if isempty(cols)
        take_num_end = take_num_end + 1;
    else
        distance = take_num_end - take_num_start;
        take_num_start = take_num_start + distance + 1;
        stride = 2;
        take_num_end = take_num_start + stride; 
        s_name = dict{cols, 1};
        decode_name = cat(1,decode_name,s_name);
    end
     if encoding_length < take_num_end
        break;
    end 
end
decoding_result =decode_name';
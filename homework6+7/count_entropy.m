function entropy_result = count_entropy(D_str, length)
entropy = 0;
for i=1:length
    entropy = entropy + D_str(i) * log2(D_str(i));
end
entropy_result = -1 * entropy;
function permuted = permute_array(input, permutation)
permuted = zeros(size(input));
for i = 1:numel(input)
   permuted(i) = input(permutation(i));
end
end
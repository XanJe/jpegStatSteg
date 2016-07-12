function inverse = generate_inverse_permutation(direct)
inverse = zeros(size(direct));
for i = 1:numel(direct)
   inverse(direct(i)) = i; 
end
end

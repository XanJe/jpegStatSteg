clc
close
clear all

%%
% aimed for getting a block with given statistics
% block = [0 0 0 0 0 1 1 1 1];
block = randi(2, [1 64]) -1;
prob_zero(block)
padded_block = pad_block_to_achieve_given_statistics(block, 147, 0.459)
prob_zero(padded_block)

permutation = generate_keyed_permutation(numel(padded_block), 7);
inverse_permutataion = generate_inverse_permutation(permutation);

permuted = permute_array(padded_block, permutation);
back = permute_array(permuted, inverse_permutataion);
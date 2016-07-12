clc
close
clear all

%%
% aimed for getting a block with given statistics
block = [0 0 0 0 0 1 1 1 1];
padded_block = pad_block_to_achieve_given_statistics(block, 15, 0.4);

padded_block = [7 8 9 10 11 12 13 14]

permutation = generate_keyed_permutation(8, 7)
inverse_permutataion = generate_inverse_permutation(permutation)

permuted = permute_array(padded_block, permutation)
back = permute_array(permuted, inverse_permutataion)
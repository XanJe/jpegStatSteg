clc
close
clear all

%%
% aimed for getting a block with given statistics
block = [0 0 0 0 0 1 1 1 1];
% result = pad_block_to_achieve_given_statistics(block, 15, 0.4)

permutation = generate_keyed_permutation(10, 4)
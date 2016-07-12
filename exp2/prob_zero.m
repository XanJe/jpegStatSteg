function p = prob_zero(block)
    num0 = numel(block) - sum(block);
    p = double(num0) / numel(block);
end
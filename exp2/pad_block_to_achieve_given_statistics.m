function block = pad_block_to_achieve_given_statistics(block, newSize, p_zero)
    while (numel(block) < newSize)
       numel(block)
       % 1. pad block with 0 and 1
       b0 = [block 0]
       b1 = [block 1]
       % 2. calculate p_zero of both blocks
       p0 = (numel(b0) - nnz(b0)) / numel(b0)
       p1 = (numel(b1) - nnz(b1)) / numel(b1)
       % 3. decide which one is closer to target p_zero
       if abs(p0 - p_zero) > abs(p1 - p_zero)
           block = b1
       else
           block = b0
       end
    end
end
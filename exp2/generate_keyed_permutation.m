function result = generate_keyed_permutation(size, key)
result = [];
% direction of shift will change with every iteration.
direction = 1;
for i = 1:size
    % generage new index from old using key and a*x+b generator.
    % more cryptographic stuff should be used later.
    newInd = mod(key*i + 7, size);
    % if found index is already in result, search for next, using
    % current direction.
    while ismember(newInd, result)
        newInd = mod(newInd + direction, size)
    end
    result = [result newInd];
    % update direction of shift
    direction = direction * -1;
end
end
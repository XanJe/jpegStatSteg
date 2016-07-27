a = [1 2 3 4 5];
b = [1 2 3 5 4];

permutation = generate_keyed_permutation(64,7)

a = randi(2, 1 , 64) - 1;
b = fliplr(a);

xB = xor(a,b);
xBs = sum(xB)

c = circshift(a, [0, 2])
xC = xor(a,c)
xCs = sum(xC)

d = permute_array(a, permutation)
xD = xor(a,d)
xDs = sum(xD)



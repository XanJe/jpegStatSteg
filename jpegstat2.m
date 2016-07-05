clc
close all;

[Y C] = quantization_tables(85);
image = imread('natureBig.jpg');

image = rgb2gray(image);
image = randi(255,size(image));
image = imresize(image,0.15);
imshow(image);

%% split into blocks
newImage = image;
% dctBlocks = zeros(8,8,size(image,1)*size(image,2)/64);

dctBlocks =[];
for i = 1:8:(size(image,1)-8)
    for j = 1:8:(size(image,2)-8)
        imageBlock = image(i:(i+7),j:(j+7));
        imageBlock = double(imageBlock) - 128;
        coefBlock = dct2(imageBlock);
        quantizedBlock = round(coefBlock ./ Y);
        dctBlocks = cat(3,dctBlocks,quantizedBlock);
    end
    i/size(image,1)
end

params = zeros(1,400)
counter = zeros(1,400)

oneOne = dctBlocks(1,1,:);
oneOne = squeeze(oneOne);
%%
fixed = 2 .* fix(oneOne ./ 2)';
diff = oneOne - fixed';

% figure, plot(fixed, diff,'b*')
for i=1:numel(fixed)
    index=int32(round(fixed(i))+200);
    counter(index) = counter(index) + 1;
    if diff(i) ~= 0
        params(index) = params(index) + 1;
    end
end

%%
params1 = [];
counter1 = [];
for i = 2:2:400
    params1 = [params1 params(i)];
    counter1 = [counter1 counter(i)];
    % number of coefficients for this value
end 
percentage = params1 ./ counter1;

figure, plot(-100:99,100 * percentage,'b-*',-100:99, counter1, 'r-*')

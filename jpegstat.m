clc
close all;

[Y C] = quantization_tables(85)
image = imread('Lenna.png');
image = rgb2gray(image);
% image = imresize(image,0.5);
% imshow(image);

%% split into blocks
newImage = image;
% dctBlocks = zeros(8,8,size(image,1)*size(image,2)/64);
dctBlocks =[];
for i = 1:8:size(image,1)
    for j = 1:8:size(image,2)
        imageBlock = image(i:(i+7),j:(j+7));
        imageBlock = double(imageBlock) - 128;
        coefBlock = dct2(imageBlock);
        quantizedBlock = round(coefBlock ./ Y);
        dctBlocks = cat(3,dctBlocks,quantizedBlock);
%           dctBlocks(:,:,i*(size(image,1)/8-1)+j) = quantizedBlock;
        
        % assemble compressed image
%         newCoefBlock = quantizedBlock .* Y;
%         newBlock = idct2(newCoefBlock)+128;
%         newImage(i:(i+7),j:(j+7)) = uint8(newBlock);
    end
end

% imshow(newImage)
% imwrite(newImage,'newLenna.png');

%% coef density
dctBlocks2 = dctBlocks;
dctBlocks2(dctBlocks2==0) = NaN;
dctBlocks2(~isnan(dctBlocks2)) = 1;
dctBlocks2(isnan(dctBlocks2)) = 0;
dctDensity = sum(dctBlocks2,3)
% imshow(dctDensity);
% impixelregion
figure, imshow(dctDensity/max(max(dctDensity)),'InitialMagnification',1500)

%% histogram
dctBlocks3 = dctBlocks;
h = dctBlocks3(:);
h(h==0) = NaN;
h(h==1 | h==-1) = NaN;
range = max(h)-min(h)+1;
histogram(h,range)

rzlt = hist(h,range);
% figure, plot(rzlt);
rzlt(-min(h)+1+3)

posR = rzlt((-min(h)+1):end);
figure, plot(rzlt);
% figure, histogram(posR,1:numel(posR))
%%
u = [];
for ind = (-min(h)+1):(-min(h)+48)
    a = rzlt(ind);
    b = rzlt(ind+1);
    c = a+b;
    prc = b/c*100;
    u = [u prc];
end
plot(u)


%% comparison
% diff = newImage-image;
% figure, imshow(10*diff)
% max(max(diff))
% impixelregion
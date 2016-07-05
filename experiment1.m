clc
clear all
close all

%% load image
image = imread('loading1.png');
% imshow(image);

for i = 1:8:M
    for j = 1:8:N
        blocks = cat(3,blocks,I(i:i+7,j:j+7));
    end
end
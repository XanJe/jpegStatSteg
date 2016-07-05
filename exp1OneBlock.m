clc
clear all
close all

%% load image
image = imread('loading1.png');
image = rgb2gray(image);
imshow(image);


%%
[qY qC] = quantization_tables(98)
%%
M = size(image,1);
N = size(image,2);

i = 33;
j = 33;

block = image(i:i+7,j:j+7)
shiftedBlock = double(block) - 128
dct = dct2(shiftedBlock)
quantized = round(dct ./ qY)

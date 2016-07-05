clc
clear all
close all

%% load image
image = imread('bokeh2.png');
image = rgb2gray(image);
% imshow(image);


%%
[qY qC] = quantization_tables(90)
%%
M = size(image,1);
N = size(image,2);

stat = zeros(1, 101);

for i = 1:8:(M-8)
    for j = 1:8:(N-8)
        % image(i,j) = 255;
        block = image(i:i+7,j:j+7);
        shiftedBlock = double(block) - 128;
        dct = dct2(shiftedBlock);
        quantized = round(dct ./ qY);
        
        % for each dct component.
        for k = 1:8
           for m = 1:8
               % but not DC component
               if (k~=1 && m~=1)
                   component = quantized(k,m);
                   % count only components in [-50,50]
                   if (abs(component) < 50)
                       index = 51 + component;
                       stat(index) = stat(index) + 1;
                   end
               end
           end
        end
        
    end
    i/M * 100
end
%%
stat(51) = 0;
range = -50:50;

stat = stat / sum(stat);

bar(stat)




clear;
clc

I = imread('len.bmp');
M = size(I,1);
N = size(I,2);
blocksize = 8;

blocks = [];
for i = 1:8:M
    for j = 1:8:N
        blocks = cat(3,blocks,I(i:i+7,j:j+7));
    end
end

% QUANT_MATRIX = [16 11 10 16 24 40 51 61;
%                 12 12 14 19 26 58 60 55;
%                 14 13 16 24 40 57 69 56;
%                 14 17 22 29 51 87 80 62;
%                 18 22 37 56 68 109 103 77;
%                 24 35 55 64 81 104 113 92;
%                 49 64 78 87 103 121 120 101;
%                 72 92 95 98 112 100 103 99];
            
% fun = @(block_struct) dct2(block_struct.data);
% Ir = blockproc(I,[8 8], fun);
% fun2 = @(block_struct) round(block_struct.data ./ QUANT_MATRIX);
% I_res = blockproc(Ir,[8 8], fun2);
% 
% tmp = I_res;
% tmp(tmp == 0)=NaN;

% for i = 1:size(tmp,1)
%     for j = 1:size(tmp,2)
%         if isfinite(tmp(i, j))
%             tmp(i, j) = bitget(abs(tmp(i, j)),1);
%         end
%     end
% end
% 
% 
% %%%%%%%%%
% Z = zeros(8,8, M*N / blocksize^2);

% for i = 1:8:M
%     for j = 1:8:N
%         cat(3,Z,tmp(i:i+7,j:j+7))
%     end
% end
        
        
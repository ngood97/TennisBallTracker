function [i,b,jG] = trackBall(img,thresh)
imagesc(img);
r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

justGreen = g-r*(7/20)-b*(13/20);
%justGreenEq = histeq(justGreen);
bw = justGreen > thresh;
% imagesc(bw);
% 
% [x, y] = find(bw);
% if ~isempty(x) && ~isempty(y)
%     xm = round(mean(x));
%     ym = round(mean(y));
%     xx = max(1, xm-5):min(xm+5, size(bw, 1));
%     yy = max(1, ym-5):min(ym+5, size(bw, 2));
%     bwbw = zeros(size(bw), 'uint8');
%     bwbw(xx, yy) = 255;
% end
i = img;
b= bw;
jG = justGreen;
end
img = imread('tennisBall.png');
imagesc(img);
r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

justGreen = g-r*1/11-b*2/3;

bw = justGreen > 53;
imagesc(bw);

[x, y] = find(bw);
if ~isempty(x) && ~isempty(y)
    xm = round(mean(x));
    ym = round(mean(y));
    xx = max(1, xm-5):min(xm+5, size(bw, 1));
    yy = max(1, ym-5):min(ym+5, size(bw, 2));
    bwbw = zeros(size(bw), 'uint8');
    bwbw(xx, yy) = 255;
end
figure
imagesc(justGreen + bwbw);
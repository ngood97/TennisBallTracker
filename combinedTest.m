
figure(1)
for i = 1:200
    [img, bw,jG] = trackBall(snapshot(cam), 40);
    [centers, radii] = imfindcircles(bw,[10 40],'sensitivity',0.87,'Method','twostage');
    [centers2, radii2] = imfindcircles(bw,[41 150],'sensitivity',0.85,'Method','twostage');
    [m,n] = size(centers);
    [m2,n2] = size(centers2);
    if m> 1 | m2>0
        centers = [];
        radii = [];
    end
    if m2> 1
        centers2 = [];
        radii2 = [];
    end
   
    
    centers = vertcat(centers,centers2);
    radii = vertcat(radii,radii2);
    [m,n] = size(centers);
    if m>0
        theta = 25; %radius of the ball at 1 meter
        beta = radii(1);
        distance = theta/beta;
        disp(['A=',num2str(distance)]);
    end
    subplot(311);
    imagesc(img);
    subplot(312);
    imagesc(bw);
    h = viscircles(centers,radii);
    subplot(313);
    imhist(jG);
    drawnow;
end
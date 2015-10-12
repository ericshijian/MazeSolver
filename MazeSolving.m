% An example on how to use watershed method to solving maze problem
% Authour : Steve Eddins 
% Webpage :http://blogs.mathworks.com/steve/2014/01/21/solving-mazes-with-the-watershed-transform/
% Caution : May need the imoverlay function :http://www.mathworks.com/matlabcentral/fileexchange/10502-image-overlay


close all;
clc;
clear;

I = imread('http://blogs.mathworks.com/images/steve/2011/maze-51x51.png');
I = logical(I);
figure,imshow(I)
hold on;
plot([6 526], [497 517], 'ro', 'MarkerSize', 15,'LineWidth', 2);
hold off;

L = watershed(I);
figure,imshow(L,[]);

L1 = L == 2;
I1 = L1.*I;
figure,imshow(I1);

L2 = watershed(I1);
figure,imshow(L2,[]);

imshowpair(L,L2);
img1 = L == 2;
img2 = L2 == 2;
path = img1 - img2;

P = imoverlay(I, path, [1 0 0]);
figure,imshow(P)

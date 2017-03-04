% 
close all
x=imread('img2.jpe');

%Binary image
image=rgb2gray(x);
[q,r]=size(image);
%cut image in half
bottomHalf = image(floor(r/2):end,:);
title('Sobel Gradient Magnitude')
%pass noisy image
sobelGradient = imgradient(bottomHalf);
imshow(sobelGradient,[])
%The Sobel gradient operators are 3x3 filters as shown below
hy = -fspecial('sobel');
hx = hy';
sigma = 2;
smoothImage = imgaussfilt(bottomHalf,sigma);
smoothGradient = imgradient(smoothImage,'CentralDifference');
imshow(smoothGradient,[])
title('Smoothed Gradient Magnitude')
[L,n]=bwlabel(edge_img);
for i=1:n
if sum(L==i)<128
    L(L==i)=0;
end
end

%subplot(2, 2, 4);
%blurredImage = conv2(single(bottomHalf), ones(3)/9, 'same');
%imshow(blurredImage, []); % or imshow(uint8(blurredImage), [0 255]);
%figure
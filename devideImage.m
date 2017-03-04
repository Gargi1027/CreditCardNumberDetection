close all
x=imread('img3.jpe');

%Binary image
image=rgb2gray(x);
%cut image in half
n=fix(size(image,1)/2)
A=image(1:n,:,:);
bottomHalf=image(n+1:end,:,:)
title('Sobel Gradient Magnitude')
%pass noisy image
sobelGradient = imgradient(bottomHalf);
imshow(sobelGradient,[])
%The Sobel gradient operators are 3x3 filters as shown below
hy = -fspecial('sobel');
hx = hy';
sigma = 2;
%smoothImage = imgaussfilt(bottomHalf,sigma);
smoothGradient = imgradient(bottomHalf,'CentralDifference');
imshow(smoothGradient,[])
title('Smoothed Gradient Magnitude')
% 8 connectivity label. to remove long edges

%remove longest edge
[L, num] = bwlabel(bottomHalf, 8);
count_pixels_per_obj = sum(bsxfun(@eq,L(:),1:num));
[~,ind] = max(count_pixels_per_obj);
biggest_blob = (L==ind);

%subplot(211),imshow(bottomHalf)
%blurredImage = conv2(single(bottomHalf), ones(3)/9, 'same');
%imshow(blurredImage, []); % or imshow(uint8(blurredImage), [0 255]);
%figure
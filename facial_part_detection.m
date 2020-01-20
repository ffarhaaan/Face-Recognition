clear all
clc
%To detect Face
FDetect = vision.CascadeObjectDetector;
[a,b]=uigetfile();
I = strcat(b,a);
I = imread(I);
BB = step(FDetect,I);
blue=I(:,:,3);
Face=imcrop(blue,BB);
FaceRGB=imcrop(I,BB);

%To detect Eyes
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
BB=step(EyeDetect,Face);
Eyes=imcrop(Face,BB);
EyesRGB=imcrop(FaceRGB,BB);

figure(1)
subplot(2,2,1);imshow(I);title('Original Image');
subplot(2,2,2);imshow(blue);title('Blue Plane Image');
subplot(2,2,3);imshow(Face);title('Cropped Face');
subplot(2,2,4);imshow(Eyes);title('Eyes');
%To detect Nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);
BB=step(NoseDetect,Face);
Nose=imcrop(Face,BB);
NoseRGB=imcrop(FaceRGB,BB);

figure(2)
subplot(2,2,1);imshow(I);title('Original Image');
subplot(2,2,2);imshow(blue);title('Blue Plane Image');
subplot(2,2,3);imshow(Face);title('Cropped Face');
subplot(2,2,4);imshow(Nose);title('Nose');




figure(3)
subplot(2,2,1);imshow(I);title('Original');
subplot(2,2,2);imshow(FaceRGB);title('FACE');
subplot(2,2,3);imshow(EyesRGB);title('EYES');
subplot(2,2,4);imshow(NoseRGB);title('NOSE');






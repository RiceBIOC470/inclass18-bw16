% In class 18

% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it. 

filename='yeast.tif';
img=imread(filename);
hx=fspecial('sobel');
hy=hx;
Iy=imfilter(double(img),hy,'replicate');
Ix=imfilter(double(img),hx,'replicate');
edge_img=sqrt(Ix.^2+Iy.^2);
imshow(edge_img,[]);
[centers,radii]=imfindcircles(edge_img,[15 25],'Sensitivity',0.96);
figure;
imshow(edge_img,[]);
hold on;
for ii=1:length(centers);
    drawcircle(centers(ii,:),radii(ii),'m');
end   

% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. 

A=randi(9,[10,1]);
B=randi(10,[10,1]);
[is_sig,pval]=ttest2(A,B)

%(B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. 

for i=1:100
    xx=randi(9,[100,1]);
    yy=randi(10,[100,1]);
    [is_sig(ii),pval(ii)]=ttest2(xx,yy);
end
sum(is_sig)

%(C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 

xx=randi(9,[1000,1]);
yy=randi(10,[1000,1]);
[is_sig,pval]=ttest2(xx,yy);

for ii=1:100
    xx=randi(9,[1000,1]);
    yy=randi(10,[1000,1]);
    [is_sig(ii),pval(ii)] = ttest2(xx,yy);
end
sum(is_sig)

%% the p value decreases as increasing of numbers each set. the difference between two sets become less significant and distribution is getting closer to uniform distribution.
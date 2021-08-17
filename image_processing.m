figure
image_rgb=imread("aowu.jpg");
image=rgb2gray(image_rgb);
image=im2double(image);
T=dctmtx(10);
B=blkproc(image,[10,10],'P1*x*P2',T,T');
mask=[1 1 1 1 1 0 0 0 0 0
    1 1 1 1 0 0 0 0 0 0
    1 1 1 0 0 0 0 0 0 0
    1 1 0 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0];
B2=blkproc(B,[10,10],'P1.*x',mask);
result=blkproc(B2,[10,10],'P1*x*P2',T',T);
subplot(2,2,1);
imshow(image)
subplot(2,2,2)
imshow(result)
[edge_result,threshold]=edge(image,'sobel');
subplot(2,2,3);
imshow(edge_result)
disp(threshold)

figure
image=imread('cameraman.tif');
image=im2double(image);
I=reshape(image,[256*256,1]);
[idx,C]=kmeans(I,2);
result=reshape(idx,[256,256]);
for i=1:256
    for j=1:256
        if result(i,j)==2
            result(i,j)=0;
        end
    end
end
subplot(1,2,1);
imshow(image);
subplot(1,2,2);
imshow(result)
function [sumc,thetac] = disym(img)
%img = imread('sil1.png');
%L = bwlabel(BW);
%stats = regionprops(L,'all');
%rectangle('Position',[stats.BoundingBox(1),stats.BoundingBox(2),stats.BoundingBox(3),stats.BoundingBox(4)],'EdgeColor','r','LineWidth',1 )
%rect= [stats.BoundingBox(1),stats.BoundingBox(2),stats.BoundingBox(3),stats.BoundingBox(4)];
%img=imcrop(BW,rect);
[bw,thresh,gh,gv] = edge(img,'sobel');  
rsize = size(bw,1);
csize = size(bw,2);
edge_mag=hypot(gh,gv);
const=1/sqrt(2*3.14*.6);
%imshow(bw);
[row,col] = find(gh);
n = size(row);
for i=1:10,

 

    for j=1:10,

        pos = [row(i),col(i);row(j),col(j)];
        distn=pdist(pos,'euclidean');
        final_dist(i,j)= const*exp(-distn/1.2);
        log_int(i,j) = log(1+edge_mag(row(i),col(i)))*log(1+edge_mag(row(j),col(j)));
        ph(i,j) = (1 - cos((atan(gv(row(i),col(i))/gh(row(i),col(i))))+(atan(gv(row(j),col(j))/gh(row(j),col(j))))-2*(atan((col(i)-col(j))/(row(i)-row(j))))))*(1 - cos((atan(gv(row(i),col(i))/gh(row(i),col(i)))) - (atan(gv(row(j),col(j))/gh(row(j),col(j))))));
        C(i,j) = final_dist(i,j)*ph(i,j)*log_int(i,j);
        theta(i,j)=((atan(gv(row(i),col(i))/gh(row(i),col(i))))+(atan(gv(row(j),col(j))/gh(row(j),col(j)))))/2;
        %disp(j);
    end
disp(i);
 

end

save('final_dist_sym.mat','final_dist','ph','log_int','C','theta');
C(isnan(C))=0;
sumc = sum(C(:));
theta(isnan(theta))=0;
thetac = sum(theta(:));
save('final_result.mat','sumc','thetac');
end
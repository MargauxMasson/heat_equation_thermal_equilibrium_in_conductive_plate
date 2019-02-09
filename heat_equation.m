clear all;close all;
n= input('n = ');
 
for i=1:n
    for j=1:n
        A(i,j)=n*(i-1)+j;   %we create the Aij matrix auxiliary which represents the plate
    end
end
M=zeros(n^2,n^2);  %initialization of the matrix M 

for i=1:n
    for j=1:n-1
        I1 = A(i,j);  %coeff of A(i,j) which become the indexes of M when M=1
        J1 = A(i,j+1);  %coeff of A(i,j+1) which become the indexes of M when M=1
        M(I1,J1) = 1;
        M(J1,I1) = 1; 
    end
end
 
for i=1:n-1
    for j=1:n
        I2 = A(i,j);   %coeff of A(i,j) which become the indexes of M when M=1
        J2 = A(i+1,j);  %coeff of A(i,j+1) which become the indexes of M when M=1
        M(I2,J2) = 1;
        M(J2,I2) = 1;
    end
end  
M

T= zeros(n^2,1);   %initialization of the temperatures matrix T
B=zeros(n^2,1);    %initialization of the boundaries conditions matrix
i=[1:n];
B(i)=10/4;

for m=1:100*n
     T= 0.25*M*T + B;   %matrix composed by the temperatures at the different areas of the plate
end
 
colormap(jet(256)); %R2015b change default color maps: more red on the top close to 10°C
TXY=reshape(T,n,n);
[X,Y]=meshgrid(1:n); surf(X,Y,TXY);  %plot the plate with the different temperatures

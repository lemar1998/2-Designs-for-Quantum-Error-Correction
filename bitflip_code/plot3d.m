x=1:0.1:4
y=1:0.1:4
[X,Y]=meshgrid(x,y)
Z=sin(X).^2+cos(Y).^2
%{
imagesc(x,y,Z)
axis xy
colorbar
%}
surf(X,Y,Z)
view(2)
colorbar
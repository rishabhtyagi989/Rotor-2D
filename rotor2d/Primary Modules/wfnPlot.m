function [] = wfnPlot(phi,theta,rad)
%  plotting a a spherical function defined on a (phi,theta) grid
%  where phi is the azimuth and theta the polar angle

phi = [phi(1,:),2*pi];
theta = [theta(:,1);pi];

[phi,theta] = meshgrid(phi,theta);

%  the wavefunction should come in a line vector
n = sqrt(size(rad,2));
rad=reshape(rad,[n,n]);

%  apply pbc for plotting
%  during calculation avoid double counting
rad=[rad,rad(:,1)];
rad=[rad;rad(1,:)];

X = sin(theta).*cos(phi).*abs(rad); 
Y = abs(rad).*sin(theta).*sin(phi);
Z = abs(rad).*cos(theta);

%surf(X,Y,Z,double(rad>=0));
surf(X,Y,Z,rad);
%surf(X,Y,Z,rad.^2);
axis([min(min(X)),max(max(X)),min(min(Y)),max(max(Y)),min(min(Z)),max(max(Z))]);

%surf(phi,theta,rad);
%view(0,90);
%shading("interp");
%axis([min(min(phi)),max(max(phi)),min(min(theta)),max(max(theta))]);

%contour(rad);
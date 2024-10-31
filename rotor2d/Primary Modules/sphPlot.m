function [] = sphPlot(phi,theta,rad)
%  plotting a spherical function defined on a (phi,theta) grid
%  where phi is the azimuth and theta the polar angle

phi = [phi(1,:), 2*pi];
theta = [theta(:,1); pi];

[phi,theta] = meshgrid(phi,theta);

rad=[rad,rad(:,1)];
rad=[rad;rad(1,:)];%I don't understand why this is defined in two different ways

X = rad.*sin(theta).*cos(phi); 
Y = rad.*sin(theta).*sin(phi);
Z = rad.*cos(theta);

surf(X,Y,Z);% this is for surface plotting 
axis([min(min(X)),max(max(X)),min(min(Y)),max(max(Y)),min(min(Z)),max(max(Z))]);%this is for setting limits on the axes, with the maximum and and minimum values of the coordinates being the two end points
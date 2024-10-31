function potEQQ = generateEQQ(phi,theta,r,Ngrid,lambda)  % coordinates representing the distance between the monopoles          x = sin(theta).*cos(phi);  y = sin(theta).*sin(phi);  z = cos(theta);   disp('we are in genEQQ');  potEQQten = zeros(Ngrid,Ngrid,Ngrid,Ngrid); %4-D matrix for the potential   n = [0,1,0]; %The unit vector joining the centres of the two dipoles    for i=1:Ngrid    for j=1:Ngrid      for l=1:Ngrid        for k=1:Ngrid           moment1 = [x(i,j),y(i,j),z(i,j)];           moment2 = [x(l,k),y(l,k),z(l,k)];                      m1 = moment1/norm(moment1);%The direction of the first rotor           m2 = moment2/norm(moment2);%The direction of the second rotor            potEQQten(i,j,k,l) = EQQDist(r,m1,m2,n,lambda);%dipole-dipole interaction energy as a 4D matrix       end      end    end   end   potEQQ = reshape(potEQQten,[Ngrid^2,Ngrid^2]);%EQQ as a Ngrid^2 by Ngrid^2 matrix  %disp(potEQQ);end
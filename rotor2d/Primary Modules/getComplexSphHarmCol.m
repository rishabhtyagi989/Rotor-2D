function Y_LM = getComplexSphHarmCol(l,phi,theta)
%  these are the complex spherical harmonics, not the real ones
  P_LM = legendre(l,cos(theta));
% legendre goes from 0 to l, fill in with -l:0 -> associated Legendre Polinomials
  mn = repmat(transpose(-l:-1),[[1,size(P_LM,2),size(P_LM,3)]]);
  P_LM = [((-1).^mn).*(factorial(l+mn)./factorial(l-mn)).*flipdim(P_LM(2:end,:,:),1); P_LM];
  %disp(size(mn));
  %disp(size((-1).^mn));
  %disp(size(factorial(l+mn)./factorial(l-mn)));
  %disp(size(flipdim(P_LM(2:end,:,:),1)));
%  normalization constant
  m = transpose(-l:l);
  m = repmat(m,[1,size(P_LM,2),size(P_LM,3)]);
  N_LM = sqrt((2*l+1)/4/pi*factorial(l-m)./factorial(l+m)); 
  
%  base spherical harmonic function
  phi = permute(repmat(phi,[1,1,size(m,1)]),[3,1,2]);
  theta = permute(repmat(theta,[1,1,size(m,1)]),[3,1,2]);
  phase = ((-1).^m).*exp(1i*m.*phi);
  Y_LM = phase.*N_LM.*P_LM;
end   


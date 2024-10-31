function SphHarmCol = generateBasis(phi,theta,Lmax,Ngrid)
  Nbasis = (Lmax+1)^2;
 
  SphHarm1 = getComplexSphHarmCol(0,phi,theta);
  for l = 1:Lmax
      SphHarm1 = [SphHarm1; getComplexSphHarmCol(l,phi,theta)];
  end

  SphHarm1 = reshape(SphHarm1,[Nbasis,Ngrid^2]);
  SphHarm2 = flip(SphHarm1')';
  SphHarmCol = kron(SphHarm1,SphHarm1);
  
  % Write this matrix to a file.
  %fid = fopen('SphHarmCol.txt','w');
  %dlmwrite(fid,SphHarmCol);
  %fclose(fid) 
end

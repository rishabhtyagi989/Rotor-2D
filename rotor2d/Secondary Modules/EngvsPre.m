clear all;Ngrid = 15;         %number of grid points in any dimensionLmax = 5;           %basis set cut-off (spherical harmonics L)molName = 'H2';                     %molecule type: H2 or D2                                                             Prange = [0:0.05:3.5]+0.00000001;   %pressure range                                lambda = 1;                        %EQQ potential strength da = pi/Ngrid; %spehrical grid densityphi = 0:2*da:(2*pi-2*da);theta = 0:da:(pi-da);[phi,theta] = meshgrid(phi,theta);Nbasis = (Lmax+1)^2;SphHarmCol = generateBasis(phi,theta,Lmax,Ngrid);disp(size(SphHarmCol));if (molName == 'H2'),  B = 1.0; %B=hbar^2/2Ielse  if (molName == 'D2'),    B = 0.5;  else    error('atom name not found!')  end;end;engLevelsname = ['EQQplot/englev_EQQ',molName,'.dat'];engLevelsfid = fopen(engLevelsname,'w');fprintf(engLevelsfid,'# pres(1) Eng(2) Eng(3) Eng(4)... \n');KinEngBasis = generateKinetic(B,Lmax);for P = Prange,    disp('looping');  R0=(1./P).^(1.0./5.0);  disp(['Pressure: ',num2str(P)]);  fflush(stdout);    disp('still looping');  PotEngGridEQQ = generateEQQ(phi,theta,R0,Ngrid,lambda);  PotEngBasisEQQ = integrateEQQ(phi,theta,da,Ngrid,Nbasis,PotEngGridEQQ,SphHarmCol);  Hamiltonian = KinEngBasis+PotEngBasisEQQ;  disp('still still looping');    [coeffBasis,engLevels] = solveSchrodinger(Hamiltonian, Nbasis*Nbasis);   fprintf(engLevelsfid,[repmat('%g ',[1,size(engLevels)]),'\n'],P,engLevels-engLevels(1));  fprintf(engLevelsfid,'\n');disp('looping completed');endfclose(engLevelsfid); 
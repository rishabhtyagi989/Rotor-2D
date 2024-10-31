function [coeffBasis,engLevels] = solveSchrodinger(Hamiltonian, Nbasis)
  
  [coeffBasis,engLevels] = eig(Hamiltonian);
  data = sortrows([real(diag(engLevels)), (1:Nbasis)']);
  engLevels = data(:,1);
  order = data(:,2);
  coeffBasis = coeffBasis(:,order);

end

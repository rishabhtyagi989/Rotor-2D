# Rotor-2D

The full programme is divided into 5 folders namely in the order:

1)"Primary Modules" 
2)"Secondary Modules" 
3)"EQQ_results"
4)"EQQplot"
5)"CoeffPlot"

This text file aims to describe the contents of each of these folders.
------

#Primary Modules: This is the most important folder as it contains the piece of code required to generate the Hamiltonian, eigenvalues, eigenvectors and also the Raman spectrum for the system of hydrogen rotors. It also contains modules/subroutines for generation of wavefunction (integrated of course) and for plotting the real part of it against theta and phi. The task of each of the modules is as follows:

1)The modules that compute the integrated wavefunction (IWF) and plot it.

*wfnGrid.m: Produces the eigenvectors for given pressure P which are then integrated by integratewfn.m.

*integratewfn.m: This is the module used for integrating the wavefunction, it takes the eigenvector from wfngrid.m and uses block diagonalisation method and spherical harmonics from SphHarm.m.

*computewfn.m: Can be interpreted as main module for integrating wavefunction, takes values for Ngrid and Lmax outputs the IWF, the integratewfn.m module is called here.

2)The modules for computing the energy eigenvalue and eigenvectors.

*getcomplexSpHarmCol.m: Nothing new here same as always.

*SpHarm.m:Simple function generating spherical harmonics, have only changed the basis size everything else stays the same.

*generatebasis.m:Considers the kronecker direct product of the already existing spherical harmonics matrix with itself to get the total basis matrix for the two rotors.

*mainQQ.: computes the hamiltonian and hence the e-values and e-vec just as before.

3)The modules for computing the spectra.

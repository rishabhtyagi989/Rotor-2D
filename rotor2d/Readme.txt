The full programme is divided into 6 folders namely in the order:

1)"Primary Modules" 
2)"Secondary Modules" 
3)"EQQ_results"
4)"EQQplot"
5)"CoeffPlot"
6)"Failed Optimisation Attempts"

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

*Generatepolarisability.m: Care has been taken due to insertion of another rotor into the picture, the main change is rewriting the polarisation tensor as P_1+P_2, so polarisability due to the first molecule plus the second, this has been done by looping over two indices i and j instead of just one.

*Integratepolarisability.m: The main change made here is simply changing the basis size of  dsDiag and changing the 3D "polarisationTensorgrid" matrix entries 

*CalculateRamanSpectrum.m: No significant changes have been made here other than changing the basis size as usual.

 
These modules rely on other submodules such as wfnParity.m, however no changes have been made here.
-----------

#Secondary Modules: This contains modules that consists of code for plotting graphs such as energy vs number of grids and number of basis and the expansion coefficients vs the spherical harmonic basis etc. We used these modules for optimisation purposes.

It also contains the code to plot Energy vs 'pressure' or interaction strength graphs namely the EngPre.m module.

------------
#EQQresults: Contains .dat files to plot the spectrum, the two main files are spec_EQQH2.dat and stats_EQQH2.dat they serve same purpose as their single rotor spectrum files counter parts (original files). 


-----------
#EQQPlot:

Contains textiles for plotting energy vs interaction strength graphs and vs Lmax graphs, which we used again for optimisation of Ngrid and Lmax parameters. It also contains the plots themselves.

-----------
#CoeffBasis:

Contains text files and .dat files for plotting coefficient vs pressure plots which we used to weight different basis in our expansion w.r.t the interaction strength.

-----------

#Failed Optimisation Attempts

This contains some of the 'failed' coding strategies that were appointed to enhance the speeding of computation, includes vectorised versions of EQQdist.m and generatekinetic.m for example, however clearly as the title suggests these techniques didn't quite work due to a possible bug I talk about this in the report too in appendix A.1. May look into them and if possible fix the bug.




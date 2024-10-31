# Project Overview

This project is organized into five main folders:

1. **Primary Modules**
2. **Secondary Modules**
3. **EQQ_results**
4. **EQQplot**
5. **CoeffPlot**

Each folder serves a distinct purpose, detailed below.

## Primary Modules

The `Primary Modules` folder contains the core code for generating the Hamiltonian, eigenvalues, eigenvectors, and Raman spectrum for a hydrogen rotor system. This folder also includes subroutines for calculating and plotting the integrated wavefunction (IWF) against the angles θ and φ. Below is an outline of key modules:

### Wavefunction Calculation and Plotting

- **`wfnGrid.m`**: Produces eigenvectors at a specified pressure (`P`), which are later integrated.
- **`integratewfn.m`**: Integrates the wavefunction using eigenvectors from `wfnGrid.m`, applying block diagonalization and spherical harmonics from `SpHarm.m`.
- **`computewfn.m`**: Serves as the main integration module, taking grid (`Ngrid`) and maximum angular momentum (`Lmax`) inputs to compute the IWF. It calls `integratewfn.m`.

### Energy Eigenvalues and Eigenvectors Calculation

- **`getcomplexSpHarmCol.m`**: Computes complex spherical harmonics.
- **`SpHarm.m`**: Generates spherical harmonics, with adjustments to basis size.
- **`generatebasis.m`**: Builds the total basis matrix for two rotors using the Kronecker product.
- **`mainQQ.m`**: Calculates Hamiltonian, eigenvalues, and eigenvectors.

### Spectra Calculation

- **`Generatepolarisability.m`**: Modifies the polarization tensor to account for two rotors by summing the polarizability contributions.
- **`Integratepolarisability.m`**: Adjusts basis size for the polarization tensor grid.
- **`CalculateRamanSpectrum.m`**: Computes Raman spectra with adjusted basis size.

These modules depend on auxiliary submodules like `wfnParity.m`, though no modifications have been made to these dependencies.

## Secondary Modules

The `Secondary Modules` folder contains scripts for generating plots related to:

- Optimization graphs, such as energy vs. grid size and spherical harmonic basis.
- Energy vs. pressure or interaction strength (via `EngPre.m`).

## EQQ_results

The `EQQ_results` folder holds `.dat` files, such as `spec_EQQH2.dat` and `stats_EQQH2.dat`, used to plot the spectrum and analyze statistical properties, serving as extensions to their single rotor counterparts.

## EQQplot

This folder contains data and plots of energy vs. interaction strength and vs. `Lmax`. These visualizations support the optimization of `Ngrid` and `Lmax` parameters.

## CoeffPlot

The `CoeffPlot` folder includes data files for plotting coefficient vs. pressure, which assist in analyzing the weighting of different basis functions in relation to interaction strength.

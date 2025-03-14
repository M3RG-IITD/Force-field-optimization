We imported the lammps structure file created by phonopy in colab.
We run it with phonoLAMMPS to get the force_constant matrix.

Running on hoffman cluster one needs to load the conda environment
where phonopy, lammps and phonolammps is installed.

source miniforge3/bin/activate

To run force constant calculation run :-

phonolammps in.lammps --dim 1 1 1

keep the dim 1 1 1 as we already have a supercell and only want to calculate
the force constants. Post processing will be done in colab.

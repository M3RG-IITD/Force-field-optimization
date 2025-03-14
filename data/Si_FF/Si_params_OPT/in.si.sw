# SW potential for Silicon

units		metal
dimension       3
processors      * * *
boundary	p p p

#read data
atom_style      atomic

# read restart
# read_restart    S300K.rest

#read data
read_data	REF_DFT.dat

#potential
pair_style      sw
pair_coeff      * * Si_FT.sw Si

neighbor        1.0 bin
neigh_modify    every 1 delay 10 check yes


#outputs
velocity all create 2000.0 3213112 mom yes rot yes dist gaussian
thermo		10
thermo_style	custom step temp pe ke etotal vol press density spcpu 

timestep        1e-3

dump            1 all custom 1 md.lammpstrj id type x y z  # Add dump before first run
fix             1 all nve temp 2000 2000 0.1
run             10000
unfix           1
undump          1  # Remove dump after first run

write_data S300K.dat
write_restart S300K.rest

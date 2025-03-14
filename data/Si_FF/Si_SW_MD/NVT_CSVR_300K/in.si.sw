# SW potential for Silicon

units		metal
dimension       3
processors      * * *
boundary	p p p

#read data
atom_style      atomic

# read restart
#read_restart    S300K.rest

#read data
read_data       Si_512.dat

#potential
pair_style      sw
pair_coeff      * * Si.sw Si

neighbor        2.0 bin
neigh_modify    every 1 delay 0 check yes

#outputs
velocity all create 300.0 121 mom yes dist gaussian
thermo		100
thermo_style	custom time temp press vol pe econserve 
dump            1 all custom 100 md.lammpstrj id type xs ys zs vx vy vz fx fy fz
dump_modify     1 format line "%d %d %5.10f %5.10f %5.10f %5.10f %5.10f %5.10f %5.10f %5.10f %5.10f" pbc yes sort id

timestep        1e-3

#initial mixing
fix             4 all temp/csvr 300 300 0.1 121
fix		5 all nve 
run             200000
undump          1
unfix           4
unfix		5

write_data S300K.dat
write_restart S300K.rest

program main

  use iso_fortran_env, only:  i4 => int32
  use parameters 
  use latticeSpin
  use init
  use periodic_boundary_conditions
  use energy
  use local_update_algorithms
  use dynamics
  
  implicit none
  
  call read_input()
  call set_memory_lattice(L)
  call setInitialConfig(x, start)
  call set_boundary_conditions(L)
  
  do i = 1, N_beta
     call measure_sweeps(x, dbeta*(i - 1), L, N_measurements, N_skip)
  end do
  
end program main

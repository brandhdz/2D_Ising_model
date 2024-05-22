program main

  use parameters 
  use latticeSpin
  use periodic_boundary_conditions
  use dynamics
  
  implicit none
  
  call read_input()
  call set_memory_lattice(L)
  call set_boundary_conditions(L)
  
  do i = 1, N_beta
     call measure_sweeps(start, x, dbeta*(i - 1), L, N_measurements, N_skip)
  end do
  
end program main

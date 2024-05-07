program main

  use parameters 
  use latticeSpin
  use init
  use periodic_boundary_conditions
  use energy
  use local_update_algorithms
  use dynamics
  
  implicit none
  
  call read_input
  call set_memory_lattice(L)
  call setInitialConfig(x, start)
  call set_boundary_conditions(L)
  print*, "Original"
  print*, x
  print*, "Sweep"
  call sweep(x)
  print*, x
 
end program main

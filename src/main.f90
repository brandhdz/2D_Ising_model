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
  call hamiltonian(x, L)
  print*, "Sweep"
  x(1,1) = -1
  print*, x
  call hamiltonian(x, L)
  call delta_hamiltonian(x, 1, 1)
  print*, "Sweep 2"
  x(2,2) = -1
  print*, x
  call hamiltonian(x, L)
  call delta_hamiltonian(x, 2, 2)
  
end program main

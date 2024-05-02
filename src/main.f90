program main
  
  use parameters 
  use latticeSpin
  use init
  use periodic_boundary_conditions
  use energy

  implicit none
  
  call read_input
  call set_memory_lattice(L)
  call setInitialConfig(x, start )
  call set_boundary_conditions(L)
  call hamiltonian(x, L)
 
end program main

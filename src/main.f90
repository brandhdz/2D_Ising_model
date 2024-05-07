program main

  use parameters 
  use latticeSpin
  use init
  use periodic_boundary_conditions
  use energy
  use local_update_algorithms

  implicit none
  real(dp) :: xn, dh
  DH =  0.01_dp
  
  
  call read_input
  call set_memory_lattice(L)
  call setInitialConfig(x, start )
  call set_boundary_conditions(L)
  call hamiltonian(x, L)
  
  print*, x(1,1)
  xn = -x(1,1)
  !call metropolis(x(1,1), xn, DH)
  !call glauber(x(1,1), xn, DH)
  print*, x(1,1)
 
end program main

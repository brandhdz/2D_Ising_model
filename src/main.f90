program main

  use iso_fortran_env, only : dp => real64
  use periodic_boundary_conditions
  use energy
  implicit none

  real(dp), dimension(2,2)  :: x
  
  call set_boundary_conditions(2)
  x = reshape([1, 1, 1, 1], [2, 2])
  call hamiltonian(x, 2)
  
  !call delta_hamiltonian(h, x, 1, 1, 2, 1.0_dp)
  
end program main

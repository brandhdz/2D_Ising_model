program main

  use iso_fortran_env, only : i4 => int32, dp => real64
  use periodic_boundary_conditions
  use energy
  implicit none

  real(dp), dimension(2,2)  :: x
  real(dp) :: dh
  
  call set_boundary_conditions(2)
  x = reshape([1, 1, 1, 1], [2, 2])
  x = transpose(x)
  call hamiltonian(x, 2)
  x(1,1) = -1.0_dp 
  call delta_hamiltonian(x, 1, 1, 2)
end program main

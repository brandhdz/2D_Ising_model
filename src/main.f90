program main
  use iso_fortran_env, only : dp => real64, i4 => int32
  use parameters 
  use latticeSpin
  use init
  use periodic_boundary_conditions
  use energy
  use local_update_algorithms
  use dynamics
  
  implicit none
  integer(i4) :: i, j, k

  call read_input
  call set_memory_lattice(L)
  call setInitialConfig(x, start)
  call set_boundary_conditions(L)
  
  
  
 ! do k = 1, 100
  !  call drawrandomnumber(L, i, j)
   ! print*, i,j
  !end do
 

  call thermalization(start, x, N_thermalization, L, beta)
 
 
end program main

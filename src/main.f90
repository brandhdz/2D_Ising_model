program main

  use parameters
  use gplots
  use latticeSpin
  use periodic_boundary_conditions
  use dynamics
  
  implicit none
  
  call read_input()
  call set_memory_lattice(L)
  call set_boundary_conditions(L)
  call execute_command_line( "mkdir "//trim(route) )
  
  do i = 1, N_beta
     call measure_sweeps(start, x, dbeta*(i - 1)+a, L, N_measurements, N_skip, route)
  end do

  !call obs_plots(L, route)
  
end program main

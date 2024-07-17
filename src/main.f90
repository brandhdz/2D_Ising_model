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
  call execute_command_line( "mkdir "//trim(route)//"/Thermalization" )
  call execute_command_line( "mkdir "//trim(route)//"/Measures" )
  call execute_command_line( "mkdir "//trim(route)//"/Autocorrelations" )
  call execute_command_line( "mkdir "//trim(route)//"/Mean_values" )
  
  do i = 1, N_beta
     call thermalization(start, x, dbeta*(i - 1) + a, L, N_thermalization, route)
     call measure_sweeps(start, x, dbeta*(i - 1) + a, L, N_measurements, N_skip, N_block, route)
  end do

  !call obs_plots(L, route)
  
end program main

program main

  use parameters 
  use latticeSpin
  use periodic_boundary_conditions
  use dynamics
  
  implicit none
  character(100) :: route
  
  call read_input()
  call set_memory_lattice(L)
  call set_boundary_conditions(L)

  route = "./data/"//trim(start)//",L="//trim(int2str(L))
  call execute_command_line( "mkdir "//trim(route) )
  
  do i = 1, N_beta
     call measure_sweeps(start, x, dbeta*(i - 1), L, N_measurements, N_skip, route)
  end do
  
end program main

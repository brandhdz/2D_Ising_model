module gplots

  use iso_fortran_env, only: i4 => int32
  use str_conv
  
  implicit none

contains

  subroutine obs_plots(L, route)

    integer(i4), intent(in) :: L
    character(50), intent(in) :: route
    integer(i4) :: unit

    open(newunit = unit, file = "./figures/energy.plt", status = "old", action = "write", position = "append" )
    write(unit, *)"'."//trim(route)//"/mean_values.dat' u 1:2:3 w yerrorbars t 'L="//trim(int2str(L))//"' , \"
    close(unit)

    open(newunit = unit, file = "./figures/heat_capacity.plt", status = "old", action = "write", position = "append" )
    write(unit, *)"'."//trim(route)//"/mean_values.dat' u 1:4:5 w yerrorbars t 'L="//trim(int2str(L))//"' , \"
    close(unit)

    open(newunit = unit, file = "./figures/magnetization.plt", status = "old", action = "write", position = "append" )
    write(unit, *)"'."//trim(route)//"/mean_values.dat' u 1:6:7 w yerrorbars t 'L="//trim(int2str(L))//"' , \"
    close(unit)

    open(newunit = unit, file = "./figures/susceptibility.plt", status = "old", action = "write", position = "append" )
    write(unit, *)"'."//trim(route)//"/mean_values.dat' u 1:8:9 w yerrorbars t 'L="//trim(int2str(L))//"' , \"
    close(unit)
    
  end subroutine obs_plots
  
end module gplots

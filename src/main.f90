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
  !real(dp), dimension(10) ::  beta_array
  real(dp) :: array(1000)
  


  call read_input
  call set_memory_lattice(L)
  call setInitialConfig(x, start)
  call set_boundary_conditions(L)
  
  
  
 ! do k = 1, 100
  !  call drawrandomnumber(L, i, j)
   ! print*, i,j
  !end do
 

  !call thermalization(start, x, N_thermalization, L, beta)
 ! call measure_sweeps(x, beta, L, N_measurements, N_skip)
  !beta_array(0) :

  call linspace(from=0.001_dp, to=1.0_dp, array=array)
  !print*, array
  call multiple_beta(x, array, L, N_measurements, N_skip)

  contains

  subroutine linspace(from, to, array)
    real(dp), intent(in) :: from, to
    real(dp), intent(out) :: array(:)
    real(dp) :: range
    integer :: n, i
    n = size(array)
    range = to - from

    if (n == 0) return

    if (n == 1) then
        array(1) = from
        return
    end if


    do i=1, n
        array(i) = from + range * (i - 1) / (n - 1)
    end do
end subroutine

 
end program main

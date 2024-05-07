module latticeSpin

  use iso_fortran_env, only: i4 => int32

  implicit none

  integer(i4), allocatable, dimension(:,:) :: x

contains

  subroutine set_memory_lattice(L)
    !This one dimensional array will store the spin value for each site of the lattice
    integer(i4), intent(in) :: L
    
    allocate(x(L,L))

  end subroutine set_memory_lattice


end module latticeSpin

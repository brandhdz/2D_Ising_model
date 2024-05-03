module periodic_boundary_conditions

  use iso_fortran_env, only : i4 => int32
  implicit none

  integer(i4), allocatable, dimension(:) :: id_f
  integer(i4), allocatable, dimension(:) :: id_b
  
contains

  subroutine set_boundary_conditions(L)
    integer(i4) :: i
    integer(i4), intent(in) :: L

    allocate(id_f(L), id_b(L))

    do i = 1, L
       id_f(i) = i + 1 
       id_b(i) = i - 1
    end do

    id_f(L) = 1
    id_b(1) = L

  end subroutine set_boundary_conditions
  
end module periodic_boundary_conditions

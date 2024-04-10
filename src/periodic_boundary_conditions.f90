module periodic_boundary_conditions

  use iso_fortran_env, only : i4 => int32, dp => real64
  implicit none

contains

  subroutine set_boundary_conditions(L)
    integer(i4) :: i, j
    integer(i4), intent(in) :: L
    integer(i4), dimension(L, L) :: N

    do i = 1, L
       do j = 1, L
          N(i, j) = i + (L-j)*L
       end do
    end do

    N(1, :) = N(L, :)
    N(:, 1) = N(:, L)

    print*, N
    
  end subroutine set_boundary_conditions

end module periodic_boundary_conditions

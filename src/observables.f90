module observables

  use iso_fortran_env, only: dp => real64, i4 => int32
  use statistics
  
  implicit none

contains

   subroutine magnetization(lattice,  L, M)
    integer(i4) :: i, j, s
    integer(i4), intent(inout), dimension(:,:) :: lattice
    integer(i4), intent(in) :: L
    real(dp), intent(inout) :: M

    s = 0
    do i = 1, size(lattice(1, :))
      do j = 1, size(lattice(1, :))
         s = lattice(i, j) + s
        end do
  end do

    M = ABS(DBLE(s)/L**2)
   ! print*,M
    
  end subroutine magnetization

  subroutine susceptibility(m_array, beta, chi, L)

    integer(i4), intent(in) :: L 
    real(dp), intent(in), dimension(:) :: m_array
    real(dp), intent(in) :: beta
    real(dp), intent(out) :: chi
   
    chi = beta*(mean(m_array**2) - mean(m_array)**2)*L**2
    
  end subroutine susceptibility

end module observables


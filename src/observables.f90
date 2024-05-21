module observables

  use iso_fortran_env, only: dp => real64, i4 => int32
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

    M =real(s)/real(L)**2
   ! print*,M
    
  end subroutine magnetization
  
  subroutine mean_magnetization(m_array, mean_mag)
  
    real(dp),intent(in), dimension(:) :: m_array
    real(dp), intent(out) :: mean_mag
 
    integer(i4) :: index, L
    L = size(m_array)
    mean_mag = 0.0_dp
  
    do index = 1, L
      mean_mag=  mean_mag + (m_array(index))
    end do
    mean_mag = abs(mean_mag/L)
    !val = sum(x_array**2)/size(x_array)
    
  end subroutine mean_magnetization

  subroutine susceptibility(m_array, L, chi)

    integer(i4) :: i
    integer(i4), intent(in) :: L
    real(dp),intent(in), dimension(:) :: m_array
    real(dp), intent(out) :: chi
    real(dp) m2

    m2 = 0_dp
    
    do i = 1, size(m_array)
       m2 = m2 + m_array(i)**2
    end do
   
    chi = (m2/size(m_array) - (SUM(m_array)/size(m_array))**2)*L**2
    
  end subroutine susceptibility

end module observables


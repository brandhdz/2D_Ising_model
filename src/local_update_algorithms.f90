module local_update_algorithms

    use iso_fortran_env, only : dp => real64, i4 => int32
    implicit none
  
  contains
  
    subroutine metropolis(x0, xnew, dh, beta)
      real(dp) :: r, p
      integer(i4), intent(inout) :: x0, xnew
      real(dp), intent(in) :: dh, beta !beta = 1/T
    
      call random_number(r)
      p = MIN(1.0_dp, EXP(-beta*dh))
  
      if ( r < p ) then
         x0 = xnew
      end if
      
    end subroutine metropolis
  
    subroutine glauber(x0, xnew, dh, beta)
  
      real(dp) :: r, p
      integer(i4), intent(inout) :: x0, xnew
      real(dp), intent(in) :: dh, beta
  
      call random_number(r)
      p = 1/( EXP(beta*dh) +1.0_dp)
  
      if ( r < p ) then
         x0 = xnew
      end if
      
    end subroutine glauber
    
  end module local_update_algorithms
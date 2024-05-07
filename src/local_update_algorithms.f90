module local_update_algorithms

    use iso_fortran_env, only : dp => real64
    implicit none
  
  contains
  
    subroutine metropolis(x0, xnew, dh)
      real(dp) :: r, p
      real(dp), intent(inout) :: x0
      real(dp), intent(in) :: xnew, dh
      
      call random_number(r)
      p = MIN(1.0_dp, EXP(-dh))
  
      if ( r < p ) then
         x0 = xnew
      end if
      
    end subroutine metropolis
  
    subroutine glauber(x0, xnew, dh)
  
      real(dp) :: r, p
      real(dp), intent(inout) :: x0
      real(dp), intent(in) :: xnew, dh
  
      call random_number(r)
      p = 1/(EXP(dh)+1.0_dp)
  
      if ( r < p ) then
         x0 = xnew
      end if
      
    end subroutine glauber
    
  end module local_update_algorithms
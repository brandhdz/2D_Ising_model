module statistics

  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

contains

  function mean(x) result(m)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: m

    m = SUM(x)/SIZE(x)

  end function mean

  function mean_sqr(x) result(m2)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: m2

    m2 = SUM(x**2)/SIZE(x)

  end function mean_sqr

  function standard_deviation(x) result(sd)

    integer(i4) :: i
    real(dp), dimension(:), intent(in) :: x
    real(dp) :: s, m, sd

    s = 0.0_dp
    m = mean(x)
    
    do i = 1, size(x)
       s = s + (x(i) - m)**2
    end do

    sd = SQRT(s/(SIZE(x)-1))

  end function standard_deviation

  function standard_error(x) result(se)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: sd, se

    sd = standard_deviation(x)

    se = sd/SQRT(DBLE(SIZE(x)))

  end function standard_error

  function sta_ind_error(x) result(sie)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: m, m2, sie

    m = mean(x)
    m2 = mean_sqr(x)
    
    sie = (m2- m**2)/(SIZE(x)-1) 

  end function sta_ind_error

end module statistics

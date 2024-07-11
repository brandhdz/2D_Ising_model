module statistics

  use iso_fortran_env, only : dp => real64, i4 => int32
  use str_conv
  implicit none

contains

  function mean(x) result(m)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: m

    m = SUM(x)/SIZE(x)

  end function mean

  function std_dev(x) result(sd)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: sd

    sd = SQRT((mean(x**2) - mean(x)**2)/(SIZE(x)-1))

  end function std_dev

  function std_err(x) result(se)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: se

    se = std_dev(x)/SQRT(REAL(SIZE(x)))

  end function std_err

  function std_err_com(x) result(sec)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: se, se_sqr, sec

    se = std_err(x)
    se_sqr = std_err(x**2)

    sec = SQRT(se_sqr**2 + se**4)

  end function std_err_com

  subroutine t_d_ac(x, beta, route, obs)

    real(dp), intent(in), dimension(:) :: x
    character(*), intent(in) :: route, obs
    real(dp), allocatable, dimension(:) :: chi
    real(dp) :: beta, s_1, s_2, s_3
    integer(i4) :: i, j, unit

    allocate(chi(0:size(x)-1))
    
    s_1 = 0d0
    s_2 = 0d0
    s_3 = 0d0
    
    open(newunit=unit, file=trim(route)//"/Autocorrelations/beta="//trim(real2str(beta))//"_"//trim(obs)//"_autocorrelation.dat" )
    
    do i = 0, size(x) - 1
       do j = 1, size(x) - i
          s_1 = s_1 + x(j)*x(j+i)
          s_2 = s_2 + x(j)
          s_3 = s_3 + x(j+i)
       end do
       chi(i) =  s_1/(size(x)-i) - s_2/(size(x)-i)*s_3/(size(x)-i)
       write(unit,*) chi(i)/chi(0)
       s_1 = 0d0
       s_2 = 0d0
       s_3 = 0d0
    end do

    close(unit)
    
    deallocate(chi)
    
  end subroutine t_d_ac
  
end module statistics

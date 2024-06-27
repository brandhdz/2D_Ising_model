program jacknife_errors
  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none
  real(dp), dimension(50) :: y
  integer(i4) :: M, i
  
  do i = 1, 50
    y(i) = i
    print*,y(i)
  end do
  print*, y
  M = 50
  call jknife_err(y, M)

contains 

subroutine jknife_err(x, M)
    real(dp), dimension(:), intent(in) :: x
    integer(i4), intent (in) :: M
    real(dp) :: err, avg, err_std
    integer(i4) :: i, j, div !Segments
    real(dp), allocatable :: array1(:) !<O>
    !−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
    div = size(x)/M
    
    allocate(array1(1: M ))
    array1 = 0.0d0
    ! jackknife
    ! This loops asks if the i-element of the array x(:) corresponds 
    !to the j-bin and then stores its value 
    do i = 1, size(x)
      do j = 1, M
        if (((i-1)/div)  /= j-1 ) then
            array1(j) = array1(j) + x(i)
        end if
      end do
    end do
    array1 = array1/( size(x) - div)
    print*, array1
    avg = SUM(array1)/M
    err = sqrt( SUM( (array1- avg )*(array1- avg )) ) 
    print*, err, std_dev(x)

end subroutine jknife_err

!!!!_____________________

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
end program jacknife_errors
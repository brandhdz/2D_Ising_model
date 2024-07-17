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

  function var(x) result(v)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: v

    v = mean(x**2) - mean(x)**2

  end function var
  
  function std_dev(x) result(sd)

    real(dp), dimension(:), intent(in) :: x
    real(dp) :: sd

    sd = SQRT(var(x)/(SIZE(x)-1))

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

  subroutine block_err(x, N_block, beta, L, route, obs)

    real(dp), intent(in), dimension(:) :: x
    integer(i4), intent(in) :: N_block, L
    real(dp), intent(in) :: beta
    character(*), intent(in) :: route, obs
    real(dp), allocatable, dimension(:) :: b, m, mh 
    integer(i4) :: i, j, unit, elms

    elms = size(x)/N_block

    allocate(b(elms))
    allocate(m(N_block))
    allocate(mh(N_block))
    
    open(newunit = unit, file = trim(route)//"/Mean_values/"//trim(obs)//"_block.dat", action = "write", position = "append")

    if ( obs == "energy" ) then
       
    do j = 1, N_block
       do i = 1, elms
          b(i) = x(i + elms*(j-1))
       end do
       m(j) = mean(b)
       mh(j) = beta**2*var(b)*L**2
    end do

    write(unit, *) beta, mean(m), std_err(m), mean(mh), std_err(mh)

 else if ( obs == "magnetization" ) then

    do j = 1, N_block
       do i = 1, elms
          b(i) = x(i + elms*(j-1))
       end do
       m(j) = mean(b)
       mh(j) = beta*var(b)*L**2
    end do

    write(unit, *) beta, mean(m), std_err(m), mean(mh), std_err(mh)

 else
    error stop "Only energy or magnetization options are available"

 end if
 
    close(unit)

    deallocate(b)
    deallocate(m)
    deallocate(mh)
    
  end subroutine block_err

    subroutine bootstrap_err(x, N_sample, N_tries, beta, L, route, obs)

    real(dp), intent(in), dimension(:) :: x
    integer(i4), intent(in) :: N_sample, N_tries, L
    real(dp), intent(in) :: beta
    character(*), intent(in) :: route, obs
    real(dp), allocatable, dimension(:) :: s, m, ms 
    integer(i4) :: i, j, unit
    real(dp) :: r

    allocate(s(N_sample))
    allocate(m(N_tries))
    allocate(ms(N_tries))
    
    open(newunit = unit, file = trim(route)//"/Mean_values/"//trim(obs)//"_bootstrap.dat", action = "write", position = "append")

    if ( obs == "energy" ) then
       
    do j = 1, N_tries
       do i = 1, N_sample
          call random_number(r)
          s(i) = x(FLOOR(L*r) + 1)
       end do
       m(j) = mean(s)
       ms(j) = beta**2*var(s)*L**2
    end do

    write(unit, *) beta, mean(m), std_err(m), mean(ms), var(ms)

 else if ( obs == "magnetization" ) then

    do j = 1, N_tries
       do i = 1, N_sample
          call random_number(r)
          s(i) = x(FLOOR(L*r) + 1)
       end do
       m(j) = mean(s)
       ms(j) = beta*var(s)*L**2
    end do

    write(unit, *) beta, mean(m), std_err(m), mean(ms), var(ms)

 else
    error stop "Only energy or magnetization options are available"

 end if
 
    close(unit)
    
    deallocate(s)
    deallocate(m)
    deallocate(ms)
    
  end subroutine bootstrap_err
  
  !   subroutine jk_err(x, N_block, beta, route)

  !   real(dp), intent(in), dimension(:) :: x
  !   integer(i4), intent(in) :: N_block
  !   real(dp), intent(in) :: beta
  !   character(100), intent(in) :: route
  !   real(dp), allocatable, dimension(:) :: b
  !   real(dp) :: a, m, djk
  !   integer(i4) :: i, j, unit, elms

  !   elms = size(x)/N_block

  !   a = 0d0

  !   allocate(b(N_block))
    
  !   open(newunit=unit, file=trim(route)//"/Mean_values/beta="//trim(real2str(beta))//"_"//trim(obs)//"_energy_jk.dat", action="write",position="append" )
    
  !   do j = 1, N_block
  !      do i = 1, elms
  !         a = a + x(i + elms*(j-1))
  !      end do
  !      b(j) = a/N_block
  !      a = 0d0
  !   end do

  !   m = mean(x)

  !   djk = SQRT(DBLE(N_block-1)/N_block*SUM(b - m))
    
  !   write(unit,*) mean(x), mean(b), djk

  !   close(unit)
    
  !   deallocate(b)
    
  ! end subroutine jk_err
  
end module statistics

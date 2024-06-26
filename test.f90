program jacknife_errors
  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none
  real(dp), dimension(50) :: x
  integer(i4) :: M, i
  
  do i =1, 50
    x(i) = i 
  end do
  print*, x
  M = 5
  call jknife_err(x, M)

contains 

subroutine jknife_err(x, M)
    real(dp), dimension(:), intent(in) :: x
    real(dp) :: delta
    integer(i4) :: M, i, j, div !Segments
    real(dp), allocatable :: array1(:) !<O>
    !−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
    div = size(x)/M
    print*, div
    allocate(array1(0: M - 1))
    array1 = 0.0d0
    do i = 0, size(x) -1
      do j = 0, M -1 
        if (i/div /= j ) then
           ! print*, i/div, j
          array1(j) = array1(j) + x(i)
          !print*, array1(j),  x(i)
        end if
      end do
    end do
    !print*, size(array1)
    array1 = array1 /(  size(x) - div)
    print*, size(array1)
    print*, array1
    delta = SUM(array1) / M
    print*,delta
end subroutine jknife_err

end program jacknife_errors
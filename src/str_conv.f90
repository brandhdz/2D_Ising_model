module str_conv

  use iso_fortran_env, only : dp => real64
  implicit none

contains

  function real2str(r) result(r_string)
    real(dp), intent(in) :: r
    character(25) :: r_string

    write(r_string, "(f7.5)") r

  end function real2str

  function int2str(i) result(k)
    integer, intent(in) :: i
    character(20) :: k

    write(k, *) i
    k = adjustl(k)

  end function int2str
  
  
end module str_conv

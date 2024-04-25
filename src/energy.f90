module energy

  use iso_fortran_env, only : dp => real64, i4 => int32 
  use periodic_boundary_conditions
  implicit none

contains

  function first_neighbors(x, m, n, L) result(sfn)
    real(dp), intent(in), dimension(:,:) :: x
    real(dp) :: lf_ngb, rg_ngb, up_ngb, dw_ngb
    real(dp) :: sfn
    integer(i4), intent(in) :: m, n, L
    
    up_ngb = x(m, id_b(n))
    dw_ngb = x(m, id_f(n))
    rg_ngb = x(id_f(m), n)
    lf_ngb = x(id_b(m), n)

    sfn = x(m,n)*(up_ngb+dw_ngb+rg_ngb+lf_ngb)
    
  end function first_neighbors

  subroutine hamiltonian(x, L, J)
    real(dp), intent(in), dimension(:,:) :: x
    real(dp), intent(in) :: J
    real(dp) :: s, h
    integer(i4) :: m, n
    integer(i4), intent(in) :: L

    s = 0.0_dp

    do m = 1, L
       do n = 1, L
          s = s + first_neighbors(x, m, n, L)
       end do
    end do
    
    h = J*s

    print*, h
  
  end subroutine hamiltonian
  
end module energy

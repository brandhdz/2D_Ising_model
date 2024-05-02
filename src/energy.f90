module energy

  use iso_fortran_env, only : dp => real64, i4 => int32 
  use periodic_boundary_conditions
  implicit none

contains

  function first_neighbors(x, m, n, L) result(sfn)
    real(dp), intent(in), dimension(:,:) :: x
    real(dp) :: rg_ngb, up_ngb
    real(dp) :: sfn
    integer(i4), intent(in) :: m, n, L
    
    up_ngb = x(id_b(m), n)
    rg_ngb = x(m, id_f(n))

    sfn = x(m,n)*(up_ngb+rg_ngb)
    
  end function first_neighbors

  subroutine hamiltonian(x, L)
    real(dp), intent(in), dimension(:,:) :: x
    real(dp) :: s, h
    integer(i4) :: m, n
    integer(i4), intent(in) :: L

    s = 0.0_dp

    do m = 1, L
       do n = 1, L
          s = s + first_neighbors(x, m, n, L)
       end do
    end do
    
    h = -s

    print*, h
  
  end subroutine hamiltonian

  subroutine delta_hamiltonian(x, m, n, L)
    real(dp), intent(in), dimension(:,:) :: x
    real(dp) :: rg_ngb, up_ngb, lf_ngb, dw_ngb, dh
    integer(i4), intent(in) :: m, n, L
    
    up_ngb = x(id_b(m), n)
    rg_ngb = x(m, id_f(n))
    dw_ngb = x(id_f(m), n)
    lf_ngb = x(m, id_b(n))

    dh = -2*x(m,n)*(up_ngb+rg_ngb+dw_ngb+lf_ngb)

    print*, dh
    
  end subroutine delta_hamiltonian
  
end module energy

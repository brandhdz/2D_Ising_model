module energy

  use iso_fortran_env, only : dp => real64, i4 => int32 
  use periodic_boundary_conditions
  implicit none

contains

  function first_neighbors(x, m, n) result(sfn)
    integer(i4), intent(in), dimension(:,:) :: x
    integer(i4), intent(in) :: m, n
    integer(i4) :: rg_ngb, up_ngb, sfn
    
    up_ngb = x(id_b(m), n)
    rg_ngb = x(m, id_f(n))

    sfn = x(m,n)*(up_ngb+rg_ngb)
    
  end function first_neighbors

  subroutine hamiltonian(x, L, h)
    integer(i4), intent(in), dimension(:,:) :: x
    integer(i4), intent(in) :: L
    integer(i4), intent(inout) :: h
    integer(i4) :: m, n, s
    
    s = 0

    do m = 1, L
       do n = 1, L
          s = s + first_neighbors(x, m, n)
       end do
    end do
    
    h = -s
  
  end subroutine hamiltonian

  subroutine delta_hamiltonian(x, m, n, dh)
    integer(i4), intent(in), dimension(:,:) :: x
    integer(i4), intent(in) :: m, n
    integer(i4) :: rg_ngb, up_ngb, lf_ngb, dw_ngb
    integer(i4), intent(inout) :: dh
    
    up_ngb = x(id_b(m), n)
    rg_ngb = x(m, id_f(n))
    dw_ngb = x(id_f(m), n)
    lf_ngb = x(m, id_b(n))

    dh = 2*x(m,n)*(up_ngb+rg_ngb+dw_ngb+lf_ngb)
    
  end subroutine delta_hamiltonian
  
end module energy

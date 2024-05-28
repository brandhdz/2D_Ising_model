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
    real(dp), intent(inout) :: h
    integer(i4) :: m, n, s
    
    s = 0

    do m = 1, L
       do n = 1, L
          s = s + first_neighbors(x, m, n)
       end do
    end do
    
    h = -DBLE(s)/L**2
  
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
  
  subroutine mean_energy(h_array, h_mean)
  real(dp),intent(in), dimension(:) :: h_array
  real(dp), intent(out) :: h_mean

   h_mean = SUM(h_array)/size(h_array)
   
 end subroutine mean_energy

  subroutine heat_capacity(h_array, beta, h_c)

    integer(i4) :: i
    real(dp) :: h2
    real(dp),intent(in), dimension(:) :: h_array
    real(dp), intent(in) :: beta
    real(dp), intent(out) :: h_c

    h2 = 0_dp
    
    do i = 1, size(h_array)
       h2 = h2 + h_array(i)**2
    end do
   
    h_c = (h2/size(h_array) - (SUM(h_array)/size(h_array))**2)*beta**2
    
  end subroutine heat_capacity
  
end module energy

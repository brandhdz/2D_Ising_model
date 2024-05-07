module dynamics

    use iso_fortran_env, only : dp => real64, i4 => int32
    use local_update_algorithms
    use energy
    implicit none
  
  contains
  subroutine sweep(x)
    integer(i4) :: i, j, xnew
    real(dp) :: dh !Energy diferrence

    integer(i4), intent(inout), dimension(:,:)  :: x !Lattice
    

    do i = 1, size(x(1, :))
        do j = 1, size(x(1, :))

            xnew = -x(i,j)
            call delta_hamiltonian(x, i, j)
            call metropolis(x(i,j), xnew, dh)
        end do
    end do
      
    end subroutine sweep

    
  end module dynamics
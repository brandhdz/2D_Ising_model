module dynamics

    use iso_fortran_env, only : dp => real64, i4 => int32
    use str_conv
    use init
    use local_update_algorithms
    use energy
    use observables
    use statistics
    
    implicit none
  
  contains
    
  subroutine seq_sweep(x, beta)
    integer(i4) :: i,j,xnew, dh
    real(dp) :: beta!Energy diferrence
    integer(i4), intent(inout), dimension(:,:)  :: x !Lattice

    do i = 1, size(x(1, :))
        do j = 1, size(x(1, :))
            !call random_number(r)
           xnew = -x(i,j)
           call delta_hamiltonian(x, i, j, dh)
           !print*,dh
           !call glauber(x(i,j), xnew, dh, beta)
           call metropolis(x(i,j), xnew, dh, beta)
        end do
    end do
      
    end subroutine seq_sweep

    subroutine random_sweep(x, beta, L)
      integer(i4) :: i, j, xnew, m,n,  dh
      integer(i4), intent(in) :: L
      real(dp) :: beta!Energy diferrence
      integer(i4), intent(inout), dimension(:,:)  :: x !Lattice
     
      do i = 1, size(x(1, :))
        do j = 1, size(x(1, :))
            !call random_number(r)
          call drawrandomnumber(L, m ,n )
           xnew = -x(m,n)
           call delta_hamiltonian(x, m, n, dh)
           !call glauber(x(i,j), xnew, dh, beta)
           call metropolis(x(m, n), xnew, dh, beta)
        end do
     end do
     
      end subroutine random_sweep

  subroutine drawrandomnumber(L, i ,j )
    integer(i4), intent(in) :: L
    integer(i4) , intent(out):: i,j

    real(dp) :: r, p
    call random_number(r)
    call random_number(p)
    i = FLOOR(L*r) + 1

    j = FLOOR(L*p) + 1
    !print*, j
    !print*, i
    
  end subroutine drawrandomnumber

  subroutine thermalization(start, lattice, beta, L, N_thermalization, route)
   
    integer(i4), intent(inout), dimension(:,:) :: lattice
    integer(i4) :: i, unit
    integer(i4), intent(in) :: N_thermalization, L
    real(dp), intent(in) :: beta
    real(dp) :: h, m_n
    character(100), intent(in) :: start, route

    call setInitialConfig(lattice, start)

    open(newunit = unit, file = trim(route)//"/Thermalization/beta="//trim(real2str(beta))//"_measures.dat")
    
    do i = 1, N_thermalization
       call random_sweep(lattice, beta, L)
       call hamiltonian(lattice, L, h)
       call magnetization(lattice,  L, m_n)
       write(unit, *) h, m_n
    end do

    close(unit)
    
  end subroutine thermalization
  
  subroutine measure_sweeps(start, lattice, beta, L, N_measurements, N_skip, route)

    integer(i4), intent(inout), dimension(:,:) :: lattice
    integer(i4) :: i, unit
    integer(i4), intent(in) :: N_measurements, N_skip, L
    real(dp), dimension(N_measurements) :: h_a
    real(dp), intent(in) :: beta
    real(dp) :: h, m_n, h_c, chi
    real(dp), dimension(N_measurements) :: M_a
    character(100), intent(in) :: start, route

    open(newunit = unit, file = trim(route)//"/Measures/beta="//trim(real2str(beta))//"_measures.dat")
    
    do i = 1, N_measurements*N_skip
       
       call random_sweep(lattice, beta, L)
       
       if ( mod(i, N_skip) == 0 ) then
          call hamiltonian(lattice, L, h)
          call magnetization(lattice,  L, m_n)
          h_a(i/N_skip) = h
          M_a(i/N_skip) = m_n
          write(unit, *) h, m_n
       end if
       
    end do

    close(unit)

    open(newunit = unit, file = trim(route)//"/mean_values.dat", action = "write", position = "append")
    
    call heat_capacity(h_a, beta, h_c, L)   
    call susceptibility(M_a, beta, chi, L)
    
    write(unit, *) beta,mean(h_a),std_err(h_a),h_c,std_err_com(h_a)*beta**2,mean(M_a),std_err(M_a),chi,std_err_com(M_a)*beta 

    close(unit)

    call t_d_ac(h_a, beta, route, "energy")
    call t_d_ac(M_a, beta, route, "magnetization")
    
  end subroutine measure_sweeps

  end module dynamics

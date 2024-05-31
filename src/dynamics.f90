module dynamics

    use iso_fortran_env, only : dp => real64, i4 => int32
    use str_conv
    use init
    use local_update_algorithms
    use energy
    use observables
    
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

  subroutine thermalization(start, x, N_thermalization, L, beta)

    integer(i4) :: i, unit, h
    integer(i4), intent(in) :: N_thermalization, L
    integer(i4), intent(inout), dimension(:,:) :: x
    character(100), intent(in) :: start
    real(dp) :: beta,  M
    
    call setInitialConfig(x,  start )
    call magnetization(x,  L, M)
    print*, M

    !open(newunit = unit, file = "./data/seq_update_Mag.dat")
    open(newunit = unit, file = "./data/random_update_Mag.dat")
    !open(newunit = unit, file = "./data/random_update_Mag_L18.dat")

    call hamiltonian(x, L, h)
    
    write(unit, *) M
    
    do i = 1, N_thermalization
       
       !call seq_sweep(x, beta)
       call random_sweep(x, beta, L)
       call magnetization(x,  L, M)
      
       !call hamiltonian(x, L, h)
       !print*,h
       write(unit, *) M
       
    end do

    close(unit)
    
  end subroutine thermalization
  
  subroutine measure_sweeps(start, lattice, beta, L, N_measurements, N_skip, route)
    integer(i4), intent(inout), dimension(:,:) :: lattice
    integer(i4) :: i, unit, h, h_mean
    integer(i4), intent(in) :: N_measurements, N_skip, L
    integer(i4), dimension(N_measurements) :: h_array
    real(dp), intent(in) :: beta
    real(dp) :: mean_mag, m_n, h_c, chi
    real(dp), dimension(N_measurements) :: M_array
    character(100), intent(in) :: start, route
    open(unit = 101, file = trim(route)//"/snapshot_beta="//trim(real2str(beta))//".dat")
    
    call setInitialConfig(lattice, start)


    open(newunit = unit, file = trim(route)//"/beta="//trim(real2str(beta))//"_measure.dat", action = "write", position = "append")
    write(101, *) 0, lattice
    
    
    do i = 1, N_measurements*N_skip
       
       call random_sweep(lattice, beta, L)
       
       if ( mod(i, N_skip) == 0 ) then
          call hamiltonian(lattice, L, h)
          call magnetization(lattice,  L, m_n)
          h_array(i/N_skip) = h
          M_array(i/N_skip) = m_n
          write(unit, *) h, m_n
          write(101, *) i, lattice
       end if
       
    end do
    close(101)

    close(unit)

    open(newunit = unit, file = trim(route)//"/mean_values.dat", action = "write", position = "append")
    
    call mean_energy(h_array,  h_mean)
    call heat_capacity(h_array, beta, h_c)
    call mean_magnetization(M_array,  mean_mag)   
    call susceptibility(m_array, L, chi)
    write(unit, *) beta, h_mean, h_c,  mean_mag, chi

    close(unit)
    
  end subroutine measure_sweeps


  end module dynamics

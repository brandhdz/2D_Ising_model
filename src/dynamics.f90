module dynamics

    use iso_fortran_env, only : dp => real64, i4 => int32
    use init
    use local_update_algorithms
    use energy
    
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

    
  subroutine magnetization(lattice,  L, M)
    integer(i4) :: i, j, s
    
    integer(i4), intent(inout), dimension(:,:) :: lattice
    integer(i4), intent(in) :: L
    real(dp), intent(inout) :: M
    

    s = 0
    do i = 1, size(lattice(1, :))
      do j = 1, size(lattice(1, :))
         s = lattice(i, j) + s
        end do
  end do

    M =real(s)/real(L)**2
   ! print*,M
    
  
    
  end subroutine magnetization



  subroutine measure_sweeps(lattice, beta, L, N_measurements, N_skip, mean_mag)
    integer(i4), intent(inout), dimension(:,:) :: lattice
    
    integer(i4) :: i, unit
    integer(i4), intent(in) :: N_measurements, N_skip, L
    real(dp), intent(in) :: beta
    real(dp), intent(out) :: mean_mag
    real(dp), dimension(N_measurements) :: M_array
    real(dp) ::  m_n
  
    
    
    open(newunit = unit, file = "./data/mag_measure.dat")
    
    do i = 1, N_measurements*N_skip
       
       call random_sweep(lattice, beta, L)
       
       if ( mod(i, N_skip) == 0 ) then
          call  magnetization(lattice,  L, m_n)
          M_array(i/10) = m_n
          write(unit, *) m_n
       end if
       
    end do
    call mean_magnetization(M_array,  mean_mag)
    print*, mean_mag

    close(unit)
    
  end subroutine measure_sweeps

  subroutine mean_magnetization(m_array, mean_mag)
  
    real(dp),intent(in), dimension(:) :: m_array
    real(dp), intent(out) :: mean_mag
 
    integer(i4) :: index, L
    L = size(m_array)
    mean_mag = 0.0_dp
  
    do index = 1, L
      mean_mag=  mean_mag + (m_array(index))
    end do
    mean_mag = abs(mean_mag/L)
    !val = sum(x_array**2)/size(x_array)
    
  end subroutine mean_magnetization

  subroutine multiple_beta(lattice, beta_array, L, N_measurements, N_skip)

    integer(i4), intent(inout), dimension(:,:) :: lattice
    
    integer(i4) :: index, unit
    integer(i4), intent(in) :: N_measurements, N_skip, L
  
    
    real(dp), dimension(:) ::  beta_array

    real(dp) :: mean_mag, m_n

    
    open(newunit = unit, file = "./data/beta_measures.dat")

    do index = 1, size(beta_array)
      
      call measure_sweeps(lattice, beta_array(index), L, N_measurements, N_skip , mean_mag)

      write(unit, *) beta_array(index), mean_mag
    end do

  
    close(unit)
  end subroutine multiple_beta
  

  end module dynamics

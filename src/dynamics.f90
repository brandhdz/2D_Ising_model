module dynamics

    use iso_fortran_env, only : dp => real64, i4 => int32
    use init
    use local_update_algorithms
    use energy
    
    implicit none
  
  contains
  subroutine seq_sweep(x, beta)
    integer(i4) :: i,j,xnew
    real(dp) :: dh, beta!Energy diferrence
    integer(i4), intent(inout), dimension(:,:)  :: x !Lattice

    do i = 1, size(x(1, :))
        do j = 1, size(x(1, :))
            !call random_number(r)
           xnew = -x(i,j)
           call delta_hamiltonian(x, i, j)
           call glauber(x(i,j), xnew, dh, beta)
           !call metropolis(x(i,j), xnew, dh, beta)
        end do
    end do
      
    end subroutine seq_sweep

    subroutine random_sweep(x, beta, L)
      integer(i4) :: i, j, xnew, m,n
      integer(i4), intent(in) :: L
      real(dp) :: dh, beta!Energy diferrence
      integer(i4), intent(inout), dimension(:,:)  :: x !Lattice
     
      do i = 1, size(x(1, :))
        do j = 1, size(x(1, :))
            !call random_number(r)
          call drawrandomnumber(L, m ,n )
           xnew = -x(m,n)
           call delta_hamiltonian(x, m, n)
           call glauber(x(m,n), xnew, dh, beta)
           !call metropolis(x(i,j), xnew, dh, beta)
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
   ! print*, x

    !open(newunit = unit, file = "./data/seq_update_Mag.dat")
    open(newunit = unit, file = "./data/random_update_Mag.dat")
    

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
    print*,M
    
  
    
  end subroutine magnetization

  end module dynamics

program main

  use parameters 
  use latticeSpin
  use init
  use periodic_boundary_conditions
  use energy
  use local_update_algorithms
  use dynamics

  implicit none
  
  
  
  
  call read_input
  call set_memory_lattice(L)
  call setInitialConfig(x, start )
  call set_boundary_conditions(L)
  call print_matrix(x)
  call hamiltonian(x, L)
  
  
  call sweep(x)

  call print_matrix(x)
  !print*, x(1,1)
 
  contains 

  subroutine print_matrix(A)

    integer, intent(in), dimension(:, :) :: A
    integer :: n,m , LL,i
  
    n = size(A(1, :))
    m = size(A(:, 1))
    LL = len(trim(int2str(maxval(A))))
  
    do i = 1, m
  
      write (*, '("[",'//int2str(n-1)//'(i'//int2str(LL)//', 3x), i'//int2str(LL)//' "]")') A(i,: )
      !write (*, '("[",'//int2str(n-1)//'(i0, 2x), i0 , "]")') A(i,: )
    end do
  
  
  
    end subroutine print_matrix
  
  
  
     function int2str(i) result(k)
       !This function returns the "i" string
       character (20) :: k
       integer,  intent(in) :: i
      
       write(k, *) i
       k  = adjustl(k)
  
  
     end function int2str
end program main


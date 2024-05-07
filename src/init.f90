module init
    !This module sets the initial spin configuration
    use iso_fortran_env, only : dp => real64, i4 => int32
    implicit none
    
contains

subroutine setInitialConfig(lattice,  start )

    integer(i4),intent(inout), dimension(:,:) :: lattice
    character(100), intent(in) :: start
    
    if ( start == "hot" ) then
        call hotStart(lattice)
     else if ( start == "cold") then
        call coldStart(lattice)
     else
        error stop "Wrong start / Please select one: hot or cold"
     end if
end subroutine setInitialConfig


subroutine coldStart(lattice)
    integer(i4), intent(inout),  dimension(:,:) :: lattice
    !Either one or -1 
    lattice = 1
    !lattice = -1.0d0
end subroutine coldStart

subroutine hotStart(lattice)

    integer(i4), intent(inout), dimension(:,:) :: lattice
    real(dp), dimension(size(lattice(1, :))) :: r
    integer(i4) :: j

   
    do j = lbound(lattice,1), ubound(lattice,1)
        call random_number(r)
        lattice(j, :) = 2*FLOOR(2*r) - 1   
        !write(*,*) lattice(j,:)
    end do    
    
  end subroutine hotStart


    
end module init

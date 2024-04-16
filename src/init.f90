module init
    !This module sets the initial spin configuration
    use iso_fortran_env, only : dp => real64, i4 => int32
    implicit none


    
contains

subroutine setInitialConfig(lattice,  start )

    real(dp), dimension(:,:) :: lattice
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
    real(dp), dimension(:,:) :: lattice
    !n = size(lattice(1, :))
    lattice = 1.0d0
end subroutine coldStart

    
end module init
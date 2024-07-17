module parameters

    use iso_fortran_env, only: dp => real64, i4 => int32
    use str_conv
    implicit none
  
    integer(i4) :: i, L, N_thermalization, N_measurements, N_skip, N_block, N_beta, N_sample, N_tries
    real(dp) :: a, b, dbeta
    character(100) :: input_file, start, algorithm, route
  
    namelist /input_parameters/  L, start, algorithm, N_thermalization, N_measurements, N_skip, N_block, N_sample, N_tries, a, b, N_beta
  
  contains
  
    subroutine read_input
  
      integer(i4) :: unit
  
      read(*,*) input_file
  
      open(newunit = unit, file = input_file)
      read(unit, nml = input_parameters)
      close(unit)
  
      if ( L <= 0 ) error stop "L must be > 0"
      if ( start /= "hot" .EQV. start /= "cold" ) error stop "Please select hot or cold"
      if ( algorithm /= "Metropolis" .EQV. algorithm /= "Glauber" ) error stop "Please select Metropolis or Glauber"
      if ( N_thermalization <= 0 ) error stop "N_thermalization must be > 0"
      if ( N_measurements <= 0 ) error stop "N_measurements must be > 0"
      if ( N_skip <= 0 ) error stop "N_skip must be > 0"
      if ( N_block <= 1 ) error stop "N_block must be > 1"
      if ( N_block > N_measurements ) error stop "N_block must be <= N_measurements"
      if ( mod(N_measurements, N_block) /= 0 ) error stop "All blocks must have the same number of elements"
      if ( N_sample <= 1 ) error stop "N_sample must be > 1"
      if ( N_sample > N_measurements ) error stop "Samples must be < N_measurements"
      if ( N_tries <= 1 ) error stop "N_tries must be > 1"
      if ( a > b ) error stop " a must be < b"
      if ( N_beta <= 1 ) error stop "N_beta must be > 1"

      write(*, nml = input_parameters)

      dbeta = (b - a)/(N_beta - 1)

      route = "./data/START="//trim(start)//",ALGORITHM="//trim(algorithm)//",L="//trim(int2str(L))
      
    end subroutine read_input
      
  end module parameters
  

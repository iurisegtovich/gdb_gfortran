PROGRAM main
implicit none
! two variables, we will test i and modify j
integer i
integer j

! i is 1
i=1
! j is zero for default
j=0
! let the tests begin
  if ((i .ne. 2) .and. (i .ne. 3)) then
    j=1 !triggered
    if (i .eq. 1) then
      j=1 !triggered
    else !i .ne. 1 .or. isnan(i)
      j=2 !if #? not triggered
    endif
  else !i .eq. 2 .or. i .eq. 3 .or. isnan(i)
      j=3 !if #? not triggered
  endif



select case(i)
case(1)
j=1 !case #1 triggered
case default
j=4 !case #2 not triggered
end select

call sub1()

contains

subroutine sub1()
!lets also see an issue with allocatables
integer, allocatable, dimension(:) :: k !why does the gdb stop here?
allocate(k(9))
end subroutine

end program

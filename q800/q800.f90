program PrimePairs
  implicit none
  integer, parameter :: n = 800800
  integer :: i, p, q, counter, mid, lower, upper, num
  integer, allocatable :: primes(:)
  real*8 :: log2n, result,p1,q1

  ! 计算以2为底n的对数
  log2n = log(real(n)) / log(2.0d0)

  ! 动态分配足够大的数组来存储素数
  allocate(primes(1:n)) 
  primes = 0

  ! 初始化计数器和素数数组
  counter = 0
  num = 0

  ! 寻找所有小于或等于n的素数
  do i = 2, n
      if (is_prime(i)) then
          num = num + 1
          primes(num) = i
      end if
  end do

  ! 检查素数对
  do i = 1, num - 1
      p = primes(i)
      do q = i + 1, num
          p1=p
          q1=primes(q)
          if (dble(p)*log2(q1) + dble(q)*log2(p1) > dble(n)*log2n) then
              exit
          end if
          result = dble(p)*log2(q1) + dble(q)*log2(p1) - dble(n)*log2n
          if (result > 0.0d0) then
              mid = q
              exit
          end if
      end do
      if (mid > i) then
          counter = counter + (mid - i)
      end if
   end do

  print *, 'The count is: ', counter

contains

  logical function is_prime(test)
      integer, intent(in) :: test
      integer :: j, sqrt_test

      if (test <= 1) then
          is_prime = .false.
          return
      end if

      if (test <= 3) then
          is_prime = .true.
          return
      end if

      if (mod(test, 2) == 0 .or. mod(test, 3) == 0) then
          is_prime = .false.
          return
      end if

      sqrt_test = int(sqrt(real(test)))
      do j = 5, sqrt_test, 6
          if (mod(test, j) == 0 .or. mod(test, (j + 2)) == 0) then
              is_prime = .false.
              return
          end if
      end do

      is_prime = .true.
  end function is_prime

  real*8 function log2(x)
      real*8, intent(in) :: x
      log2 = log(x) / log(2.0d0)
  end function log2

end program PrimePairs
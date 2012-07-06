## to generate all primes less than a given integar "n"

PrimeSieve <- function(n) {
  if (n <= 1) {
    primes <- numeric(0)
  }
  if (n == 2 | n == 3) {
    primes <- 2:n
  }
  else {
    numbers <- 2:n
    sieve <- rep(TRUE, times = n - 1)  # let all flags to be TRUE
    cross.limit <- floor(sqrt(n))
    count <- 1   
    p <- numbers[sieve][count]  # let p be the first sieve number
    while (p <= cross.limit) {
      sieve[p * (2:floor(n / p)) - 1] <- FALSE
      count <- count + 1
      p <- numbers[sieve][count]
    }   
    primes <- numbers[sieve]
  }
  return(primes)
}
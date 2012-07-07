## to factorize an integar number into prime numbers

PrimeFactor <- function(x, prime = prime) {
  m <- length(prime)
  fac.count <- numeric(m)
  names(fac.count) <- prime
  # actually, a primality check could insert here
  for (i in 1:m) {
    prime.num <- prime[i]
    while (x %% prime.num == 0) {
      fac.count[i] <- fac.count[i] + 1
      x = x / prime.num
    }  
  while (x == 1) break
  }
  return(fac.count)
}
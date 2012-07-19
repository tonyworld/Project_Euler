## Copyright Tong Wei, July 2012

## to determine primality of a given integar "x" 
## gmp::isprime() does the same work 

IsPrime <- function(x) { 
  if (x == 1) {
    flag <- FALSE
  } 
  else if (x == 2 | x == 3) {
    flag <-  TRUE
  } 
  else {
    flag <- !any(x %% 2:(floor(sqrt(x))) == 0)
  }
  return(flag)
}
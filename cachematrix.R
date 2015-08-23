## These functions create the environments needed to store the 
## values and enable access to both.

## This function creates the environment containing the matrix of values
## and provides the access to them

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<- function(y) {
    x <<- y
    m <<- NULL
  }
  get<-function() x
  setSolve <-function(solve) m <<- solve
  getSolve <- function() m
  list(set = set, get = get,
       setSolve = setSolve,
       getSolve = getSolve)
}


## This function will look for a calculated inverse value in an environment
## and create one if not found that will get cached for future calls.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getSolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setSolve(m)
  m
}

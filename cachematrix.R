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
  get<-funtion() x
  setinverse <-function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function will look for a calculated value in an environment
## and create one if not found that will get cached for future calls.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- inverse(data, ...)
  x$setinverse(m)
  m
}

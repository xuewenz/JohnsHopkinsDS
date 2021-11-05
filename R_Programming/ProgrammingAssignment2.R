## Put comments here that give an overall description of what your
## functions do
## Computing the inverse of a square matrix
##can be done with the solve function in R. For example,
##if X is a square invertible matrix
##then solve(X) returns its inverse.

## Get the chache by setting the inverse for x

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function () x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function () inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Solving the cache by inversing the matrix

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}

## Given function

makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

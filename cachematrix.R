## Below are a pair of functions that cache the inverse of a given matrix

## This function creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

  mycache <- NULL
  mymat <- x
  mycache <- solve(x)
  x <<-list(mat=mymat,cache=mycache)
}


## This function checks if inverse has already been calculated, 
## retrieves from cache if yes, else computes it afresh.

cacheSolve <- function(x, ...) {

  mycache <- x$cache
  mymat <- x$mat
  if(!is.null(mycache)) {
    message("getting cached data")
    return(mycache)
  }
  mycache <- solve(mymat)
  x$cache <<- mycache
  x$mat <<- mymat
  mycache
}

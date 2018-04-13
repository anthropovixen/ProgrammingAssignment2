## This function creates a special "matrix" object that can cache its inverse
## The function will create a list containing a function that will set the matrix, get the matrix, set the inverse and get the inverse.

## take the matrix as input
makeCacheMatrix <- function(x = matrix()) {
  invMatrix <- NULL
  
  ## set the Matrix with the desired value.
  set <- function(y) {
    x <<- y
    invMatrix <<- NULL
  }
  ## get the value of the Matrix
  get <- function() x
  
  ## set value of the inverse Matrix
  setinverse <- function(inverse) invMatrix <<- inverse
  
  ## get value of the inverse Matrix
  getinverse <- function() invMatrix
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## The function cacheSolve will take the special Matrix output from the function MakeCacheMatrix and transform it into a input.
## It will check if there is any value cached in it, then it will return it.
## If the inverse Matrix is empty, it will get the original data and set the inverse Matrix with the solve function.
## If there is a value cached, it will return the message "getting cached data" and the inverse Matrix.

cacheSolve <- function(x, ...) {
        invMatrix <- x$getinverse()
        if(!is.null(invMatrix)) {
          ## if inverse Matrix is not NULL
          
          message("getting cached data")
          ## this message will be displayed
          
          return(m)
          ## the inverse Matrix cached will be displayed
        }
        Matrixdata <- x$get()
        ## get the original Matrixdata
        
        invMatrix <- solve(Matrixdata, ...)
        ## use solve function to inverse the Matrix
        
        x$setinverse(invMatrix)
        ## set the inverse Matrix
        
        invMatrix
        ##print the inverse Matrix
}

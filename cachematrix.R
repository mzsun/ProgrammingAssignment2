## Put comments here that give an overall description of what your
## functions do

#We have two functions:
  # makeCacheMatrix contains 4 functions to save and retrieve the value of 
    # the matrix and its inverse to variables x and matrixinverse globally.
  # cacheSolve checks to see if the inverse of the matrix has already
    # been computed and if so, returns this saved value, if not
    # computes the inverse and assigns it globally to the matrixinverse variable


## makeCacheMatrix contains functions to
  #create a new matrix
  #get the value of the matrix
  #set the value of the inverse of the matrix
  #get the value of the inverse of the matrix
  #Returns a list of these functions

makeCacheMatrix <- function(x = matrix()) {

  matrixinverse <<- NULL # Set the matrix inverse to null globally
  
  ## First Function: Assign the matrix to the variable x globally 
  ## and its inverse to NULL globally
  set <- function(y) {
    x <<- y
    matrixinverse <<- NULL
  }
  
 ## Second Function: Retrieve the assigned matrix x
 get <- function() {x}
 
 ## Thrid Function: Assign the inverse of the matrix to the variable inverse globally
 setinverse <- function(inverse) {
   matrixinverse <<- inverse
 }
 
 ## Fourth Function: Retrive the inverse of the matrix stored as a global variable
 getinverse <- function(){
   matrixinverse
 }
 ## Create a named list of the matrix functions to be returned by makeCacheMatrix
 list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve first checks to see if the matrix inverse is stored globally.
  # If found this value is returned
  # If not the inverse of the matrix is calculated and saved globally
  # to the matrixinverse variable and returned.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  matrixinverse <- x$getinverse()
  if(!is.null(matrixinverse)){ #matrix inverse is already cached.
    message("getting cached data")
    return(matrixinverse)
  }
  data <- x$get() # Retrieve x
  matrixinverse <- solve(data) # compute the matrix inverse
  x$setinverse(matrixinverse) # cache the computed matrix inverse
  matrixinverse
}

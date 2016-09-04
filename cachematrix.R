## Put comments here that give an overall description of what your
## functions do

##  
## While the objective of this is supposed to be the time saving element
## I think this is about proding a list of functions, and calling function
## as a list. the make fucniton returns a list with the elements
## set a matrix, get a matrix, set an inverse, gent an inverse
## flg is a flag to indicate that the cashe is set

makeCacheMatrix <- function(x = matrix()) {
   mat <- NULL          ## local matrix, which is also a flag
   set <- function(y) { 
       x <<-  y          ##  return matrix global, new matrix to work
	   mat <<- NULL     ##    set global mat to Null, so set inv mat to NULL
    }
	get <- function() { x  }   ##   get the matrix passed in. single line func
    setinv <- function(inv) { mat <<- inv }  ## Set the inverse, publish it
	getinv <- function() { mat }    ## return the current inverted  mat
# Create our function list
	list(set = set, get = get, setinv = setinv, getinv = getinv)
}


##  this is where we use our clever 'list-function' utility. I would guess
##  this reinforces the idea that eveything in R is a function

cacheSolve <- function(x, ...) {
#  check  a matrix that is the inverse of 'x'
	mat <- x$getinv()     # get our inverted matrix
    if(!is.null(mat)) { return(mat) }    ## if not null then we are done
	mat <- x$get()
	mat <- solve(mat,...)
	x$setinv(mat)
	return(mat)
}

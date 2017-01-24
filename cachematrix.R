## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){
        x <<- y
    }
    get <- function() {
        x
    }
    setInverse<- function(inverse){
        m <<- inverse
    }
    getInverse <- function(){
        m
    }
    
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
    
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    
    if(!is.null(m)){
        message("Getting Cached Data")
        ## Return a matrix that is the inverse of 'x'
        return(m)
    }
    
    ## Following is else part
    data <- x$get()
    
    # Actual solving of the problem
    m<- solve(data)
    
    # Caching the value
    x$setInverse(m)
    
    ## Return a matrix that is the inverse of 'x'
    m
    
}







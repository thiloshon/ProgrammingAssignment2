## Finding inverse of a square matrix can take a long time for large datasets. 
## So storing the calculated inverse and using it for unchanged matrixes later on
## Would increase the performance significantly.
## These functions calculate, set, store and retrieve values inorder to perform efficiently. 

## The function stores value in the cache and retrieves from the cache. 

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





## The function checks if the value has already been calculated. 
## If yes, retrieves from the cache, If not calculates and then stores in the cache. 

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
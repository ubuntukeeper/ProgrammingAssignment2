## Put comments here that give an overall description of what your
## functions do

## tweaks to makeVector function taken from assignment:
## replaced makeVector by makeCacheMatrix
## replaced 'mean' by 'inverse'
## warning! never ever do this in real life project
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        ## assignment takes place in global environment
        x <<- y
        m <- NULL
    }

    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    
    ## functions hold pointer to defining environment
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## tweaks to cachemean taken from assignment
## replaced 'mean' by 'inverse'
## replaced solving function
## warning! never do this in real life project
cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}

## This is a code that uses lexical scoping. 
## The objective is the appointment of an inverse matrix

## This is a function which save inverse matrix in cache memory.

makeCacheSolve <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) i <<- solve
    getsolve <- function() i
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)    
}

## This function checks whether the searched inverse matrix is calculated. 
## If yes then shows it. If not, then performs the necessary calculations

cacheSolve <- function(x, ...) {
    i <- x$getsolve()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data)
    x$setsolve(i)
    i
}

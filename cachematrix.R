## Put comments here that give an overall description of what your functions do

##VRJ This function will calculate the inverse of a matrix, if the inverse was already calculated, it will retrieve the information
##without calculating again the inverse

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { 
##This function creates a special "matrix" object that can cache its inverse.
##COMMENTS IN THE LINES OF CODE

        inv<-NULL ##sets inv as initial value of inv
        setMatrix<-function(y=matrix()){
                x<<-y 
                ## Assigns value to x(matrix), that can be consulted in a different environment
                
                inv<<-NULL 
                ## Assigns value to inv (solve(x)), that can be consulted in a different environment
        }
        
        
        getMatrix<-function()x
        
        setinv<-function(solve) inv<<-solve
        
        getinv<- function() inv
                
        list(setMatrix=setMatrix,
             getMatrix=getMatrix,
             setinv=setinv,
             getinv=getinv)
}

## Write a short comment describing this function
## VRJ This code will determine if the value for inv was already calculated, if so, it will not calculate it again and will
## retrieve the result printing a Message to let know the user it was retrieved from previous calculation.
##MORE COMMENTS IN THE LINES OF CODE
        
cacheSolve <- function(x, ...) {
        inv <-x$getinv()
        
        if(!is.null(inv)){ ##is inv different than NULL (initial value)
                message("Getting cached data")
                return(inv)
        } ##if current value of inv=NULL
        data<-x$getMatrix()
        inv<-solve(data,...) ##calculates inv
        x$setinv(inv)
        inv
        
##This function computes the inverse of the special "matrix" returned by 
##makeCacheMatrix above. If the inverse has already been calculated (and 
##the matrix has not changed), then the cachesolve should retrieve the inverse 
##from the cache.
        ## Return a matrix that is the inverse of 'x'
       
}

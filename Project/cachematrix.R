#Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than computing it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.

#Write the following functions:
  
 # makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
#cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.
#Computing the inverse of a square matrix can be done with the solve function in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.

#For this assignment, assume that the matrix supplied is always invertible.


## Put comments here that give an overall description of what your
## functions do

#Given a matrix, if one wants to solve for the inverse of the square matrix and save in a cache for later recall,
# first create the cache, then draw upon the cache, else solve for the answer


makeCacheMatrix <- function(x = matrix()) {

## Write a short comment describing this function

#makeCacheMatrix creates a matrix that:
# 1) sets the value of the matrix
# 2) gets the value of the matrix
# 3) sets the value of the inverse of the square matrix
# 4) gets the value of the inverse of the square matrix

  #create matrix
  m<-NULL
  
  set<-function(y){
    
    x <<- y
    
    m <<- NULL
  }

  
  #Use solve function to compute inverse of matrix
  get<- function() x
  setsolve<-function(solve) m <<- solve
  getsolve<-fuction() m
  list(set=set, get=get,
       setsolve=setsolve,
       getsolve=getsolve)
  
}




cacheSolve<- function(x,...) {

## Write a short comment describing this function

# cacheSolve then checks the cache otherwise calculates the inverse of the square matrix

        ## Return a matrix that is the inverse of 'x'
  
    #checking to see if inverse exists 
    m<-x$getsolve()
    if(!is.null(m)) {
      message("getting cached data")
      return (m)
    }
    
    #Calculating solve if not in cache
    data<-x$get()
    m<-solve(data, ...)
    x$getsolve(m)
    m
}

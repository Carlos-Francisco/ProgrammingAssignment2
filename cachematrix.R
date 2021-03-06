## Catching the inverse of a matrix 
## The function makeCacheMatrix creates a special "matrix", containing
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse matrix
## 4. get the value of the inverse matrix 
 
 
## The goal of this function is to generate an object "matrix" that 
##could cache its inverse 
 
makeCacheMatrix <- function(x = matrix()) { 
	inv<-NULL
	set<-function(y){
		x<<-y
		inv<<-NULL
	}
	get<-function()x
	setinverse<-function(inverse) inv<<-inverse
	getinverse<-function()inv
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
 } 
 
 
## In this function the inverse of the object "matrix" is generated. However, it 
## first checks  if the inverse has already been calculated. If so, it gets
## the inverse from the cache and skips the computation. If not, the inverse of the
## data is calculated.
 
 
 cacheSolve <- function(x, ...) { 
         ## Return a matrix that is the inverse of 'x'
	inv<-x$getinverse()
	if(!is.null(inv)){
		message("getting cached data.")
		return(inv)
	}
	data<- x$get()
	inv<- solve(data, ...)
	x$setinverse(inv)
	inv
} 

package main

import (
	"fmt"
)

func factorial(num int) int {
	// code goes here
	// Note: feel free to modify the return type of this function
	if num == 1 {
		return 1
	}
	return num * factorial(num-1)

}

func main() {

	// do not modify below here, readline is our function
	// that properly reads in the input for you
	var i int
	fmt.Println("Enter a number ?")
	fmt.Scanf("%d", &i)

	fmt.Println(factorial(i))

}

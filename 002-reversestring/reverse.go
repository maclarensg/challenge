package main

import (
	"fmt"
)

func reverse(str string) string {
	// code goes here
	// Note: feel free to modify the return type of this function
	var buffer []byte
	var strbytes = []byte(str)
	for i := len(str) - 1; i >= 0; i-- {
		//fmt.Println(strbytes[i])
		buffer = append(buffer, strbytes[i])
	}
	return string(buffer)
}

func main() {

	// do not modify below here, readline is our function
	// that properly reads in the input for you
	var s string
	fmt.Println("Enter a String: ")
	fmt.Scanf("%s", &s)

	fmt.Println(reverse(s))

}

package main

import (
	"fmt"
)

func letterChanges(str string) string {
	var strbytes = []byte(str)

	for i := 0; i < len(strbytes); i++ {
		if strbytes[i] >= 97 && strbytes[i] <= 122 {
			strbytes[i]++
			if (strbytes[i] == 97) || (strbytes[i] == 101) || (strbytes[i] == 105) || (strbytes[i] == 111) || (strbytes[i] == 117) {
				strbytes[i] -= 32
			}
		}
	}
	return string(strbytes)
}

func main() {

	// do not modify below here, readline is our function
	// that properly reads in the input for you
	var s string
	fmt.Println("Enter a String: ")
	fmt.Scanf("%s", &s)

	fmt.Println(letterChanges(s))

}

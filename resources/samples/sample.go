package main

import "fmt"

type Person struct {
	Name string
	Age  int
}

func (p Person) String() string {
	return fmt.Sprintf("%s: %d", p.Name, p.Age)
}

func main() {
	a := Person{"pokutuna", 36}
	z := Person{"oneetyan", 17}

	fmt.Println(a, z)

	sum := calculateSum(5, 7)
	fmt.Printf("Sum: %d\n", sum)
}

func calculateSum(x, y int) int {
	return x + y
}

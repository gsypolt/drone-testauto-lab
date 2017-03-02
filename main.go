package main

import (
	"bytes"
	"fmt"
)

func main() {

	buf := printText()
	fmt.Println(buf.String())

}

func printText() *bytes.Buffer {
	byt := []byte{}
	buf := bytes.NewBuffer(byt)
	buf.WriteString("****************************\n")
	buf.WriteString("Your app is compiled and runs\n")
	buf.WriteString("****************************\n")

	return buf
}

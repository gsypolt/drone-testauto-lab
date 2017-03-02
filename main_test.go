package main

import "testing"

func TestPrint(t *testing.T) {
	buf := printText()
	if buf.Len() != 88 {
		t.Fail()
	}
}

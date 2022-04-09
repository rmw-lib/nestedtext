package main

import (
  "fmt"
  "syscall/js"
  "strings"
  "github.com/npillmayer/nestext"
)

func add(this js.Value, args []js.Value) interface{} {
  if len(args) != 1 {
    return js.ValueOf(nil)
  }
  input := args[0].String()
  result, err := nestext.Parse(strings.NewReader(input))
  if err != nil {
    fmt.Errorf("%v", err);
    return js.ValueOf(-1)
  }

  return js.ValueOf(result)
}

func main() {
  done := make(chan struct{}, 0)
  js.Global().Set("addFun", js.FuncOf(add))
  <-done
}

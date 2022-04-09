package nestedtext
//import "github.com/npillmayer/nestext"

import "syscall/js"

func main() {
  alert := js.Global().Get("alert")
  alert.Invoke("Hello World!")
}

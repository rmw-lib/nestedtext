#!/usr/bin/env coffee
import thisdir from '@rmw/thisdir'
import fs from 'fs'
import {dirname,join} from 'path'
import crypto from 'crypto'

Object.defineProperty(globalThis, 'crypto', {
  value: {
    getRandomValues: (arr) => crypto.randomBytes(arr.length)
  }
})

await import('./wasm_exec.js')

go = new Go
wasm = await WebAssembly.compile(
  fs.readFileSync(join thisdir(import.meta),'lib.wasm')
)

run = (txt)=>
  go.run await WebAssembly.instantiate(
    wasm
    go.importObject
  )
  r = addFun(txt)
  if r == -1
    throw Error("nestext decode error :\n"+txt)
  return r

console.log await run """a : 1"""
console.log await run """a : 2 """
###
console.log mod
.then(wasmModule => {
  // Exported function live under instance.exports
  const add = wasmModule.instance.exports.add;
  const sum = add(5, 6);
  console.log(sum); // Outputs: 11
});
###

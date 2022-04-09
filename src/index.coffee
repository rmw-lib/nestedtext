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

export ntDecode = (txt)=>
  go.run await WebAssembly.instantiate(
    wasm
    go.importObject
  )
  r = addFun(txt)
  if r == -1
    throw Error("nestext decode error :\n"+txt)
  return r

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
  txt_li = txt.split("\n")
  indent = 0
  for line,pos in txt_li
    i = line.trimEnd()
    if i
      if i.startsWith '#'
        continue
      indent = line.length - line.trimStart().length
      break

  li = []
  for i from txt_li
    i = i.trimEnd()
    if indent
      i = i[...indent].trimStart() + i[indent..]
    if i
      li.push i

  txt = li.join('\n')

  if not txt
    return null

  go.run await WebAssembly.instantiate(
    wasm
    go.importObject
  )
  r = addFun(txt)
  if r == -1
    throw Error("nestext decode error :\n"+txt)
  return r

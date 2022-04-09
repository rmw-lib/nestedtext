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

mod = await WebAssembly.instantiate(
  fs.readFileSync(join thisdir(import.meta),'lib.wasm')
  go.importObject
)


###
console.log mod
.then(wasmModule => {
  // Exported function live under instance.exports
  const add = wasmModule.instance.exports.add;
  const sum = add(5, 6);
  console.log(sum); // Outputs: 11
});
###

#!/usr/bin/env coffee
import thisdir from '@rmw/thisdir'
import fs from 'fs'
import {dirname,join} from 'path'

wasmBuffer = fs.readFileSync(join dirname(thisdir(import.meta)),'nestedtext.wasm')
mod = await WebAssembly.instantiate(wasmBuffer)
console.log mod
###
.then(wasmModule => {
  // Exported function live under instance.exports
  const add = wasmModule.instance.exports.add;
  const sum = add(5, 6);
  console.log(sum); // Outputs: 11
});
###

<!-- 本文件由 ./make.md 自动生成，请不要直接修改此文件 -->

# @rmw/nestedtext

## English Readme

use https://github.com/npillmayer/nestext wasm for nestedtext decode in nodejs ( es module )

###  Install

```yarn add @rmw/nestedtext ``` or ``` npm install @rmw/nestedtext```

### Use

```coffee
#!/usr/bin/env coffee

import {ntDecode} from '@rmw/nestedtext'

console.log await ntDecode """
# Contact information for our officers

president:
  name: Katheryn McDaniel
  address:
    > 138 Almond Street
    > Topeka, Kansas 20697
  phone:
    cell: 1-210-555-5297
    home: 1-210-555-8470
      # Katheryn prefers that we always call her on her cell phone.
  email: KateMcD@aol.com
  additional roles:
    - board member

vice president:
  name: Margaret Hodge
  address:
    > 2586 Marigold Lane
    > Topeka, Kansas 20682
  phone: 1-470-555-0398
  email: margaret.hodge@ku.edu
  additional roles:
    - new membership task force
    - accounting task force
"""
```

output is :

```json5
{
  president: {
    name: 'Katheryn McDaniel',
    address: '138 Almond Street\nTopeka, Kansas 20697',
    phone: { cell: '1-210-555-5297', home: '1-210-555-8470' },
    email: 'KateMcD@aol.com',
    'additional roles': [ 'board member' ]
  },
  'vice president': {
    name: 'Margaret Hodge',
    address: '2586 Marigold Lane\nTopeka, Kansas 20682',
    phone: '1-470-555-0398',
    email: 'margaret.hodge@ku.edu',
    'additional roles': [ 'new membership task force', 'accounting task force' ]
  }
}
```

## 中文说明

###  安装

```yarn add @rmw/nestedtext ``` 或者 ``` npm install @rmw/nestedtext```

### 使用

```coffee
#!/usr/bin/env coffee

import {ntDecode} from '@rmw/nestedtext'

console.log await ntDecode """
# Contact information for our officers

president:
  name: Katheryn McDaniel
  address:
    > 138 Almond Street
    > Topeka, Kansas 20697
  phone:
    cell: 1-210-555-5297
    home: 1-210-555-8470
      # Katheryn prefers that we always call her on her cell phone.
  email: KateMcD@aol.com
  additional roles:
    - board member

vice president:
  name: Margaret Hodge
  address:
    > 2586 Marigold Lane
    > Topeka, Kansas 20682
  phone: 1-470-555-0398
  email: margaret.hodge@ku.edu
  additional roles:
    - new membership task force
    - accounting task force
"""
```

## 备忘

* 从这里获取 wasm_exec

cp "$(go env GOROOT)/misc/wasm/wasm_exec.js" .

### 关于

本项目隶属于**人民网络([rmw.link](//rmw.link))** 代码计划。

![人民网络](https://raw.githubusercontent.com/rmw-link/logo/master/rmw.red.bg.svg)
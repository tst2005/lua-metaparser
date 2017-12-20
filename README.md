# lua-metaparser

# Goal

Be able to parse /anything/, get an `AST`, be able to render it to /anything/

**anything** is :
* POSIX Shell (see [lua-sh-parser](https://github.com/tst2005/lua-sh-parser))
  * [x] parser
  * [ ] renderer
* Lua (see [lua-parser](https://github.com/tst2005/lua-parser) forked-from: [andremm/lua-parser](https://github.com/andremm/lua-parser))
  * [ ] parser
  * [ ] renderer
* Lua (see [leg](https://github.com/keplerproject/leg))
  * [ ] parser
  * [ ] renderer
* Lua (see [LuaMinify](https://github.com/tst2005/LuaMinify) forked-from: [stravant/LuaMinify](https://github.com/stravant/LuaMinify))
  * [ ] parser
  * [ ] renderer
* Lua (see [lua_code_formatter](https://github.com/martin-eden/lua_code_formatter))
  * [ ] parser
  * [ ] renderer
* Lua (see [TypedLua](https://github.com/andremm/typedlua) or [their new repo](https://github.com/titanproject/titancompiler))
  * [ ] parser
  * [ ] renderer
* Lua (see [luajit-lang-toolkit](https://github.com/franko/luajit-lang-toolkit))
  * [x] lexer-only
  * [x] parser-only
  * [x] renderer: bytecode generator
  * [x] renderer: lua code generator
* CSV (see [lua-csv-parser](https://github.com/tst2005/lua-csv-parser))
  * [x] parser
  * [x] renderer
* GNOME balot (see [blt](https://github.com/tst2005/h_ckthevote/blob/master/blt.lua))
  * [x] parser
  * [ ] renderer
* gitolite config file (see [lua-gitolite](https://github.com/tst2005/lua-gitolite))
  * [x] parser
  * [x] renderer
* markdown (see [lpeg-markdown](https://github.com/tst2005/lpeg-markdown))
  * [ ] parser
  * [ ] renderer
* ... and more
* JSON
* LISP (see [l2l](https://github.com/meric/l2l)) (see [urn](https://github.com/SquidDev/urn)) (see moonlisp[](https://github.com/leafo/moonlisp))
* Moonscript
* Python
* ...
* similar project : https://github.com/vsbenas/parser-gen

The rendering common base is [ast-renderer.lua](https://github.com/tst2005/lua-metaparser/blob/master/ast-renderer.lua)

My work in progress ast2**anything** stuff :
* [ast2sh](https://github.com/tst2005/lua-sh-parser/blob/dev/ast2sh.lua)
* [ast2gitolite](https://github.com/tst2005/lua-gitolite/blob/master/ast2gitolite.lua) almost completed
* ast2humanast (the metalua ast format)
* ast2tprint (the lua table format)

# Long term goal

* [ ] support the ANTL grammar format.
We will be able to support [so many format](https://github.com/antlr/grammars-v4)

# Current approach

* using `lpeg.re`
* define the **grammar** of the target
* parse it to an `AST` format like metalua
* setup all AST type handler to render into the target format
* enjoy!

# Technical choice

## AST format

Unfortunately there is no standard format for AST in lua.
Each project make it own.

### the metalua AST

The [metalua AST format](https://github.com/fab13n/metalua-parser#notation).
Sample: `` `Foo{ 1, 2, 3 }`` for `{tag="Foo", 1, 2, 3}`

Pro:
* I like the short notation. Easy.
* Detect if it's a AST item or a raw lua table, check if a `tag` field exists.

Cons:
* the table contains both hash-key and numerical index. Most of format in other languages does not support mixed content.

### the moonscript AST format

It's a `S-expression`(?)

Sample:
```lua
return {"Foo", 1 2 3, [-1]=99 }

Pro:
* Compatible with lot of format in lot of languages.

Cons:
* More difficult to detect if it's a AST item or a raw lua table. I don't know if the `-1` field is mandatory.



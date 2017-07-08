# lua-metaparser

# Goal

Be able to parse /anything/, get an `AST`, be able to render it to /anything/

**anything** is :
* POSIX Shell (see [lua-sh-parser](https://github.com/tst2005/lua-sh-parser))
  * [x] parser
  * [ ] renderer
* Lua (see [lua-parser](https://github.com/tst2005/lua-parser)) (see [leg](https://github.com/keplerproject/leg))
  * [ ] parser
  * [ ] renderer
* [x] [x] CSV (see [lua-csv-parser](https://github.com/tst2005/lua-csv-parser))
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

The rendering common base is [ast-renderer.lua](https://github.com/tst2005/lua-metaparser/blob/master/ast-renderer.lua)

My work in progress ast2**anything** stuff :
* [ast2sh](https://github.com/tst2005/lua-sh-parser/blob/dev/ast2sh.lua)
* [ast2gitolite](https://github.com/tst2005/lua-gitolite/blob/master/ast2gitolite.lua) almost completed
* ast2humanast (the metalua ast format)
* ast2tprint (the lua table format)

# Long term goal

* [ ] support the ANTL grammar format.
We will be able to support [so many format](https://github.com/antlr/grammars-v4)


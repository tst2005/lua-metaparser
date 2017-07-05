# lua-metaparser

# Goal

Be able to parse /anything/, get an `AST`, be able to render it to /anything/

**anything** is :
* POSIX Shell (see [lua-sh-parser](https://github.com/tst2005/lua-sh-parser))
* Lua (see [lua-parser](https://github.com/tst2005/lua-parser))
* CSV (see [lua-csv-parser[(https://github.com/tst2005/lua-csv-parser))
* GNOME balot (see [blt](https://github.com/tst2005/h_ckthevote/blob/master/blt.lua))
* gitolite config file (see [lua-gitolite](https://github.com/tst2005/lua-gitolite))
* ... and more
* JSON
* LISP (see [l2l](https://github.com/meric/l2l))
* Moonscript
* Python
* ...

The rendering stuff are currently mainly done into [ast-renderer.lua](https://github.com/tst2005/lua-sh-parser/blob/dev/ast-renderer.lua)

# Long term goal

* [ ] support the ANTL grammar format.
We will be able to support [so many format](https://github.com/antlr/grammars-v4)


if false then
	do
	local lpeg = require "lulpeg"
	local re = lpeg.re
	package.loaded.lpeg = lpeg
	package.loaded.re = re
	end
end

local md2busted = require "md2busted.parser"

local data = [[
# describe line

* it line

```lua
test
```

]]

if ... == "-" then
	data = io.stdin:read("*a")
end

local x = md2busted( data )
print("return "..require"mini.tprint"(x, {inline=false}))


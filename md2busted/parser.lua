local re = require "re"

local re_internal_def
do
	local lpeg = require"lpeg"
	local locale = lpeg.locale -- backup the function
	lpeg.locale = function(t, ...)
		re_internal_def = t
		return locale(t, ...)
	end
	re.updatelocale() -- will internaly call lpeg.locale(...)

	lpeg.locale = locale -- restore the function

	-- patch the internal data
	if re_internal_def.nl then
		re_internal_def.tab = lpeg.P"\t"	-- tab
		re_internal_def.taborspace = lpeg.S" \t" -- space or tab
--		re_internal_def.lf = lpeg.P"\n"		-- lF
--		re_internal_def.cr = lpeg.P"\r"		-- CR
--		re_internal_def.crlf = lpeg.P"\r\n"	-- CRLF
	end
end

local grammar = re.compile[[
	mdbusted <- {| (describe / it / code)+ unmatched? eof |} !.

	describe <- {| describe_line {:tag: '' -> "Desc" :} |}
	describe_line <- {:level: {'#'+} :} spaces describe_str %nl+
	describe_str <- {[^%nl]+}

	it <- {| '*' spaces it_str %nl+ {:tag: '' -> "It" :} |}
	it_str <- {[^%nl]+}

	code <- {| "```lua" %nl codelines+ %nl* {:tag: '' -> "Code" :} |}

	codelines <- endofcode / codeline
	codeline <- {[^%nl]+ %nl+}
	endofcode <- '```' %nl

	spaces <- ws+
	ws <- %taborspace

	unmatched <- {| {:tag: '' -> "UnmatchedData" :} {.*} |}
	eof <- {| {:tag: '' -> "Eof" :} |}
]]

return function(data)
	return grammar:match( data )
end


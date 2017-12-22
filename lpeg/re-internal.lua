local re = require "re"

local lpeg = require"lpeg"
local locale = lpeg.locale -- backup the function

local re_internal_def
lpeg.locale = function(t, ...)
	re_internal_def = t
	return locale(t, ...)
end
re.updatelocale() -- will internaly call lpeg.locale(...)

lpeg.locale = locale -- restore the function

return re_internal_def

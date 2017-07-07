local class = require "mini.class"

local renderer = class("ast-renderer", {})
function renderer:init(obj_type_handler)
	if not (type(obj_type_handler)=="function") then
		local name = obj_type_handler
		obj_type_handler = function(t) return t[name] end
	end
	self._obj_type_handler = obj_type_handler -- a function

	self._config = {}

	local meta = getmetatable(self)
	self._debugvalue = tostring(self)
	meta.__tostring = function(self) return self:render(self) or self._debugvalue or "" end

	function meta:__call(...) return self:render(...) end
	return self
end

function renderer:defs()
	return self._config
end

function renderer:render(t)
	if not t then
		error("argument #1 missing", 2)
	end

	local objtype = self._obj_type_handler(t)
	if not objtype then
		error("unable to determine type",2)
	end

	local f = self._config[objtype]
	if not f then error("no handler to render type "..objtype,2) end

	return f(self, t)
end

function renderer:concat(t, sep, b, e) -- FIXME: implement the b,e
	local r = {}
	for i,v in ipairs(t) do
		if type(v) == "table" then
			r[#r+1] = self:render(v)
		else
			r[#r+1] = v
		end
	end
	return table.concat(r, sep or "")
end

function renderer:type(t)
	return (self._obj_type_handler(t))
end

return renderer

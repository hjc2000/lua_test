function Create()
	local str = "666"

	local context = {}
	function context.Log()
		print(str)
	end

	return context
end

local o = Create()
o.Log()

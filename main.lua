function Inject()
	if (Test == nil) then
		Test = {}
	end

	local str = "6"
	function Test.Log()
		print(str)
	end
end

Inject()
Test.Log()

function Inject()
	if (Test == nil) then
		Test = {}
	end

	local str = "7"
	function Test.Log()
		print(str)
	end
end

Inject()
Test.Log()

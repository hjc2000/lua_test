function Inject()
	if (Test == nil) then
		Test = {}
	end

	local str = "6"
	function Test.Log()
		print(str)
	end
end

function Inject1()
	if (Test1 == nil) then
		Test1 = {}
	end

	local str = "7"
	function Test1.Log()
		print(str)
	end
end

Inject()
Test.Log()

Inject1()
Test1.Log()

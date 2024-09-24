require("Math.InertialElement")
require("Ticker")


function Math.InertialElement.Test()
	local inertial_element = Math.InertialElement.New(0.05, 0.010, 0.1)
	for i = 0, 100 do
		Math.InertialElement.Input(inertial_element, 5)
		print(Math.InertialElement.CurrentOutput(inertial_element))
	end
end

-- Math.InertialElement.Test()


function Ticker.Test()
	local ticker = Ticker.New(
		10,
		1000,
		function()
			print("timeup")
		end
	)

	for i = 1, 1000 do
		Ticker.Tick(ticker)
	end
end

-- Ticker.Test()

if (true) then
	local str = "666"

	function Log1()
		print(str)
	end
end


if (true) then
	local str = "777"

	function Log2()
		print(str)
	end
end

Log1()
Log2()

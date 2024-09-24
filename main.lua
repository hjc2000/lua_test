require("Math.InertialElement")

local inertial_element = Math.InertialElement.New(0.05, 0.010, 0.1)
for i = 0, 100 do
	Math.InertialElement.Input(inertial_element, 5)
	print(Math.InertialElement.CurrentOutput(inertial_element))
end

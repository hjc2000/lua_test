require("Detector.StaticFrictionDetector")

if true then
	if (MuDetector == nil) then
		--- 摩擦系数检测器
		MuDetector = {}
	end

	local _f_max = 0
	local _f_max1 = 0
	local _mu = 0

	local function Calculate()
		_mu = (_f_max1 - _f_max) / Option.Weight()
	end

	--- 获取摩擦系数。
	--- 要执行完检测后本属性才有效。
	--- @return number
	function MuDetector.Mu()
		return _mu
	end

	--- 执行步骤 1 检测。
	local function Step1Detect()
		Detector.StaticFrictionDetector.Detect()
	end

	--- 执行步骤 2 检测。
	local function Step2Detect()
		Calculate()
	end

	--- 执行检测
	function MuDetector.Detect()
		if (InputSignal.Step1StartingSignal()) then
			Step1Detect()
		elseif (InputSignal.Step2StartingSignal) then
			Step2Detect()
		end
	end
end

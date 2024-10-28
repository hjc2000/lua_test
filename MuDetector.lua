require("Detector.StaticFrictionDetector")

if true then
	if (Detector == nil) then
		Detector = {}
	end

	if (Detector.MuDetector == nil) then
		--- 摩擦系数检测器
		Detector.MuDetector = {}
	end

	local _f_max = 0
	local _f_max1 = 0
	local _mu = 0

	--- 获取摩擦系数。
	--- 要执行完检测后本属性才有效。
	--- @return number
	function Detector.MuDetector.Mu()
		return _mu
	end

	--- 重物重量导致的施加到电机轴上的转矩。单位：额定转矩的百分比。
	--- 调用最大静摩擦测试程序测试得到最大静摩擦后，需要将得到的值减去本属性，得到的才是真实的最大静摩擦。
	--- @return number
	local function WeightTorque()
		return 100 * Option.Weight() * Option.WireSpoolRadius() / (Option.ReductionRatio() * Option.RatedTorque())
	end

	--- 执行步骤 1 检测。
	local function Step1Detect()
		print("步骤 1 启动，检测光轴状态下的最大静摩擦。")
		Detector.StaticFrictionDetector.Detect()
		_f_max = Detector.StaticFrictionDetector.Result()
	end

	--- 执行步骤 2 检测。
	local function Step2Detect()
		print("步骤 2 启动，检测吊着重物状态下的最大静摩擦。")
		Detector.StaticFrictionDetector.Detect()
		_f_max1 = Detector.StaticFrictionDetector.Result()
		_f_max1 = _f_max1 - WeightTorque()
		_mu = (_f_max1 - _f_max) / Option.Weight()
		print("检测完毕，摩擦系数为：", _mu)
	end

	--- 执行检测
	function Detector.MuDetector.Detect()
		while true do
			if (InputSignal.Step1StartingSignal()) then
				Step1Detect()
			elseif (InputSignal.Step2StartingSignal) then
				Step2Detect()
				return
			end
		end
	end
end

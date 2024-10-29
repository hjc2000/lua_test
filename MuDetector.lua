require("Detector.StaticFrictionDetector")

if true then
	if (Detector == nil) then
		Detector = {}
	end

	if (Detector.MuDetector == nil) then
		--- 摩擦系数检测器
		Detector.MuDetector = {}
	end

	-- 光轴时的最大静摩擦
	local _f_max = 0

	-- 吊着重物时的最大静摩擦
	local _f_max1 = 0

	-- 摩擦系数
	local _mu = 0

	--- 获取摩擦系数。
	--- 要执行完检测步骤后本属性才有效。
	--- @return number
	function Detector.MuDetector.Mu()
		return _mu
	end

	--- 计算当前的最大静摩擦。
	--- 计算依赖 Detector.MuDetector.Mu() ，所以要执行完检测步骤后才能计算。
	--- @param weight number 当前轴上压着的重物重量
	--- @return number
	function Detector.MuDetector.CalculateMaxStaticFriction(weight)
		return _f_max + Detector.MuDetector.Mu() * weight
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
		_f_max1 = _f_max1 - Option.WeightTorque()
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

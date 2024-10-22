local function TestSpeedMode()
	Servo.ChangeToSpeedMode()
	Servo.Param.SetBothTorqueLimit(4)
	Servo.SetSpeedAndRun(100)
end

local function TestTorqueMode()
	Servo.ChangeToTorqueMode()
	Servo.Param.SetSpeedLimitInTorqueMode(300)
	Servo.SetTorqueAndRun(10)
end

--- 测试电机自由停车
local function TestFreeStopping()
	Servo.ChangeToSpeedMode()
	Servo.Param.SetBothTorqueLimit(20)
	Servo.SetSpeedAndRun(300)

	-- 等待直到电机转起来，达到指定速度
	Detector.AccelerationDetector.Reset()

	--- 计数，至少向滤波器输入 100 个点
	local count = 0
	while true do
		Detector.AccelerationDetector.Detect()
		if (math.abs(Detector.AccelerationDetector.Acceleration()) == 0 and
				Servo.Feedback.Speed() >= 100 and
				count > 100) then
			break
		end

		Servo.Timer.Delay(Servo.Timer.Period())
		count = count + 1
	end

	Servo.Param.SetBothTorqueLimit(0)
end

--- 初始化
if true then
	Servo.Configure()

	-- 启动定时
	TIM_START(1, Servo.Timer.Period())
	Servo.Core.Enable()
	Servo.Stop()
	Servo.PresetPosition()

	Detector.StaticFrictionDetector.Detecte()
	-- TestTorqueMode()
	-- TestFreeStopping()
end

local _max_time = 0

-- 主循环
while (true) do
	if (TIM_CHECK(1) == 1) then
		-- 定时时间到
		TIM_RESET(1)


		local cuttent_time = TIM_VALUE(1)
		if (cuttent_time > _max_time) then
			_max_time = cuttent_time
			print("单次循环最大耗时变大，变为：", _max_time)
		end
	end
end

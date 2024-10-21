--- 初始化
if true then
	Servo.Configure()

	-- 启动定时
	TIM_START(1, Servo.Timer.Period())
	Servo.Core.Enable()
	Servo.Stop()
	Servo.PresetPosition()

	Detector.StaticFrictionDetector.Detecte()
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

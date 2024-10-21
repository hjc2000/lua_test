--- 静摩擦转矩检测
if true then
	if (StaticFrictionDetector == nil) then
		StaticFrictionDetector = {}
	end


	--- 静摩擦检测结果
	local _static_friction = 0

	--- 在速度模式下以指定的转矩限制值转动
	--- @param torque integer 转矩限制值
	local function RunWithTorque(torque)
		Servo.ChangeToSpeedMode()
		Servo.Param.SetBothTorqueLimit(torque)
		Servo.SetSpeedAndRun(100)
	end


	--- 使用二分法，首先指定转矩限制值的区间左右端点，在区间内寻找静摩擦对应的转矩
	local _left_torque = 0
	local _right_torque = 100
	local _detecte_result = 0

	--- 执行检测
	function StaticFrictionDetector.Detecte()
		_left_torque = 0
		_right_torque = 100

		while true do
			local current_torque = (_left_torque + _right_torque) // 2
			RunWithTorque(current_torque)
			Servo.Timer.Delay(100)
			if (Servo.Feedback.Speed() > 10) then
				-- _current_torque 已经让伺服转起来了，说明大于静摩擦
				_right_torque = current_torque
			else
				-- 没让伺服转起来，说明 _current_torque 无法克服静摩擦
				_left_torque = current_torque
			end

			if (_left_torque >= _right_torque) then
				print("检测结束")
				_detecte_result = current_torque
				return
			end

			if (current_torque <= _left_torque) then
				print("检测结束")
				_detecte_result = current_torque
				return
			end

			if (current_torque >= _right_torque) then
				print("检测结束")
				_detecte_result = current_torque
				return
			end
		end
	end
end

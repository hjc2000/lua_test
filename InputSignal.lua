require("Servo.MVariable")

if true then
	if (InputSignal == nil) then
		--- 输入信号
		InputSignal = {}
	end

	--- 步骤 1 启动信号。
	--- 步骤 1 是在光轴的情况下测试最大静摩擦。
	--- @return boolean
	function InputSignal.Step1StartingSignal()
		return Servo.MVariable.HasRisingEdgeEvent(0)
	end

	--- 步骤 2 启动信号。
	--- 步骤 2 是在吊着重物的情况下测试最大静摩擦。
	--- @return boolean
	function InputSignal.Step2StartingSignal()
		return Servo.MVariable.HasRisingEdgeEvent(1)
	end
end

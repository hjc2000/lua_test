if true then
	if (Option == nil) then
		--- 选项
		Option = {}
	end

	--- 重物重量。单位 N
	--- @return number
	function Option.Weight()
		return 10.0
	end

	--- 减速比
	--- @return number
	function Option.ReductionRatio()
		return 2.0
	end

	--- 线轴半径
	--- @return number
	function Option.WireSpoolRadius()
		return 10.0
	end

	--- 电机额定转矩
	--- @return number
	function Option.RatedTorque()
		return 2.7
	end

	--- 重物重量导致的施加到电机轴上的转矩。单位：额定转矩的百分比。
	--- 调用最大静摩擦测试程序测试得到最大静摩擦后，需要将得到的值减去本属性，得到的才是真实的最大静摩擦。
	--- @return number
	function Option.WeightTorque()
		return 100 * Option.Weight() * Option.WireSpoolRadius() / (Option.ReductionRatio() * Option.RatedTorque())
	end
end

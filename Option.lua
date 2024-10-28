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
end

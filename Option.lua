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
end

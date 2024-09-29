-- 打印_ENV的内容
local function print_env(env)
	for key, value in pairs(env) do
		print(key)
	end
end

-- 调用函数打印_ENV
print_env(_ENV)

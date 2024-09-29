-- 打印_ENV的内容
function print_env(env)
	for key, value in pairs(env) do
		print(key .. ": " .. tostring(value))
	end
end

-- 调用函数打印_ENV
print_env(_ENV)

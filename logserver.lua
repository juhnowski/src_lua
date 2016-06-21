socket = require("socket")
print(socket.VERSION)

local server = socket.try(socket.bind("10.0.0.100", 8080))
local ip, port = server:getsockname()
local client = server:accept()
local device = io.input("/dev/ttyS0")

while true do
	local client = server:accept()
	local count, err = client:receive()
    
	if not err then  

		while count>0  do
			local line = device.read()
    		if line == nil then break end
    		client(string.format("%6d  ", count), line, "\n")
    		count = count - 1
		end

 		client:send("----- end log -----" .. "\n") 
	end

	client:close()
end
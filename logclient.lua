socket = require("socket")
print(socket.VERSION)

local host, port, com = "10.0.0.100", 8080, "/dev/ttyS1"

local device = io.open(com, "w")
local tcp = assert(socket.tcp())
tcp:connect(host, port);
local count = 10
tcp:send(count .. "\n");

while true do
    local s, status, partial = tcp:receive()
    print(s or partial)
    device.write(s or partial, "\n")
    if status == "closed" then break end
end

tcp:close()
local com = "/dev/ttyS1"
local device = io.open(com, "w")

while true do
	local x = os.clock()
	device.write(x, "\n")
end
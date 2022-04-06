SerialPort = Serial("COM7", 9600)

function stn(number)
	local n = tostring(number)
	local g = ""
	for i=1,4-#n do
		g = g.."0"
	end
	g = g..number
	return g
end

function moveX(x)
    SerialPort:Write(stn(x).."Xf")
end

function moveY(y)
    SerialPort:Write(stn(y).."Yf")
end

function moveZ(z)
    SerialPort:Write(stn(z).."Zf")
end

function broca0()
    SerialPort:Write("0000Bf")
end

function broca1()
    SerialPort:Write("0001Bf")
end

function broca2()
    SerialPort:Write("0002Bf")
end
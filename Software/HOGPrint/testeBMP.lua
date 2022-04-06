dofile("loadBMP.lua")
image = LoadBitmap("file.bmp");
print("bitmap size = "..image.X.."x"..image.Y)
for x=1, image.X do
    for y=1, image.Y do
	print("R1:"..image[x][y].R)
	print("G1:"..image[x][y].G)
	print("B1:"..image[x][y].B)
    end
end
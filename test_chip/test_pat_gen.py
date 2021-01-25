import numpy as np
import gen_pat
def gen_pattern_bin(b_array, file_name='pattern.bin'):
	with open(file_name, "wb") as writer:
		b_array = bytearray(b_array)
		writer.write(b_array)
def gen_numpy_padding_pic():
	bayer_pic = np.zeros((8,1028))
	for i in range(1028):
		for j in range(8):
			bayer_pic[j][i] = (i*4+j%4)%256
	return bayer_pic
bayer = gen_numpy_padding_pic()
den_rgb = gen_pat.denoise(gen_pat.demosaic(bayer))
rgb_mean = gen_pat.mean(den_rgb)
rgb_gain = gen_pat.gain(rgb_mean)
wb_rgb = gen_pat.wb(rgb_gain, den_rgb)
gamma_rgb = gen_pat.gamma(wb_rgb)


rst_n = []
pixel = []
valid = []
color = []
last_col = []
last_pic = []
mode = []
comment = []

#stage14
#rst cycles
rst_n = [0, 0, 0]
pixel = [0, 0, 0]
valid = [0, 0, 0]
color = [0, 0, 0]
last_col = [0, 0, 0]
last_pic = [0, 0, 0]
mode = [0, 0, 0]
comment = [0, 0, 0]


rst_n += [1,1,1,1]
pixel += [0,0,0,0]
valid += [0,0,0,0]
color += [0,0,0,0]
last_col += [0,0,0,0]
last_pic += [0,0,0,0]
mode += [0,6,6,6]
comment += [0,0,0,1]

for i in range(1024+4):
	for j in range(8):
		rst_n += [1,1,1]
		pixel += [int(bayer[j][i])]*3
		valid += [1,0,0]
		color += [0,0,0]
		if (i==1024+3 and j == 7):
			last_col += [1,0,0]
			comment += [0,0,2]
		else:
			last_col += [0,0,0]
			comment += [0,0,0]
		last_pic += [0,0,0]
		mode += [6,6,6]


for i in range(1024+4):
	for j in range(8):
		rst_n += [1,1,1]
		pixel += [int(bayer[j][i])]*3
		valid += [1,0,0]
		color += [0,0,0]
		if (i==1024+3 and j == 7):
			last_col += [1,0,0]
			last_pic += [1,0,0]
			comment += [0,0,3]
		else:
			last_col += [0,0,0]
			last_pic += [0,0,0]
			comment += [0,0,0]
		mode += [6,6,6]



b_pixel = bytearray(pixel)
b_color = bytearray(color)
b_mode = bytearray(mode)

others = [i*8+j*4+k*2+l for i,j,k,l in zip(rst_n, valid, last_col, last_pic)]
b_others = bytearray(others)
b_comment = bytearray(comment)

gen_pattern_bin(b_pixel, "pixel_14_in.bin")
gen_pattern_bin(b_color, "color_14_in.bin")
gen_pattern_bin(b_mode, "mode_14_in.bin")
gen_pattern_bin(b_others, "others_14_in.bin")
gen_pattern_bin(b_comment, "comment_14_in.bin")




for i in range(100):
	rst_n += [1]
	pixel += [0]
	valid += [0]
	color += [0]
	last_col += [0]
	last_pic += [0]
	mode += [6]
	if i == 99:
		comment += [4]
	else:
		comment += [0]
#stage56
for i in range(30):
	rst_n += [1]
	pixel += [0]
	valid += [0]
	color += [0]
	last_col += [0]
	last_pic += [0]
	mode += [7]
	if i == 99:
		comment += [4]
	else:
		comment += [0]

for i in range(1024):
	for j in range(4):
		rst_n += [1,1,1]
		pixel += [int(den_rgb[j,i,0]),int(den_rgb[j,i,1]),int(den_rgb[j,i,2])]
		valid += [1,1,1]
		color += [0,1,2]
		last_col += [0,0,0]
		comment += [0,0,0]
		last_pic += [0,0,0]
		mode += [7,7,7]


for i in range(1024):
	for j in range(4):
		rst_n += [1,1,1]
		pixel += [int(den_rgb[j,i,0]),int(den_rgb[j,i,1]),int(den_rgb[j,i,2])]
		valid += [1,1,1]
		color += [0,1,2]
		last_col += [0,0,0]
		if( j==3 and i==1023):
			comment += [0,0,5]
			last_pic += [1,1,1]
		else:
			comment += [0,0,0]
			last_pic += [0,0,0]
		mode += [7,7,7]


b_pixel = bytearray(pixel)
b_color = bytearray(color)
b_mode = bytearray(mode)

others = [i*8+j*4+k*2+l for i,j,k,l in zip(rst_n, valid, last_col, last_pic)]
b_others = bytearray(others)
b_comment = bytearray(comment)

gen_pattern_bin(b_pixel, "pixel_1456_in.bin")
gen_pattern_bin(b_color, "color_1456_in.bin")
gen_pattern_bin(b_mode, "mode_1456_in.bin")
gen_pattern_bin(b_others, "others_1456_in.bin")
gen_pattern_bin(b_comment, "comment_1456_in.bin")



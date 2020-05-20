import os
import imageio
from tqdm import tqdm, trange
import numpy as np
import scipy.misc
from matplotlib import pyplot as plt
import rawpy

RAW_DATA_MAX = 16383
OUTPUT_FOLDER = './output/'
FILE_POSTFIX = '.jpg'
IMAGE_FILE = '20201_00_10s.ARW'
#FILE_POSTFIX = '.png'
#IMAGE_FILE =  'blue.png'



# function: extract raw data to ndarray
## input:   file name of raw image
## output:  numpy array with 2D array presented
def get_raw_data(file_name = IMAGE_FILE):
	assert os.path.exists(file_name), "ERROR! IMAGE_FILE: {} not found".format(file_name)
	raw = rawpy.imread(file_name)
	print("Pattern of bayer:\n", raw.raw_colors[0:5,0:5])
	im = raw.raw_image_visible.astype(np.float32)
	im = (im)/RAW_DATA_MAX*255
	im.astype(int)
	return im
def get_png(file_name = IMAGE_FILE):
	im = imageio.imread(file_name)
	print("Loaded %s" % (file_name))
	print("Shape of image",im.shape)
	print("Max of image",np.max(im))
	print("Min of image",np.min(im))
	return im
def mosaic_png(png):
	rgb = png[:,:,0:3]
	output = np.zeros(rgb.shape[0:2]).astype(int)
	for i in range(rgb.shape[0]):
		for j in range(rgb.shape[1]):
			if(i%2 == 0 and j%2 == 0):
				output[i][j] = rgb[i,j,0]
			elif(i%2 == 1 and j%2 == 1):
				output[i][j] = rgb[i,j,2]
			else:
				output[i][j] = rgb[i,j,1]
	return output

	

def demosaic(bay, debug=0):
	r = np.zeros((bay.shape))
	g = np.zeros((bay.shape)) 
	b = np.zeros((bay.shape)) 

	last_row = bay.shape[0]
	last_col = bay.shape[1]



	for i in trange(bay.shape[0]):
		for j in range(bay.shape[1]):
			if(i%2==0 and j%2==0): # red pixel
				r[i][j] = bay[i][j]
				if(j== last_col-1):
					assert 0 , "ERROR! bay pattern error"
				elif(i== last_row-1):
					assert 0 , "ERROR! bay pattern error"
				
				elif(i== 0 and j== 0):
					g[i][j] = (bay[i+1][j] + bay[i][j+1]) //2
					b[i][j] = bay[i+1][j+1]

				elif(i==0):
					g[i][j] = (bay[i][j-1] + bay[i][j+1] + bay[i+1][j]) //3
					b[i][j] = (bay[i+1][j-1] + bay[i+1][j+1]) //2

				elif(j==0):
					g[i][j] = (bay[i-1][j] + bay[i][j+1] + bay[i+1][j]) //3
					b[i][j] = (bay[i-1][j+1] + bay[i+1][j+1]) //2

				else:
					g[i][j] = (bay[i-1][j] + bay[i+1][j] + bay[i][j-1] + bay[i][j+1])//4
					b[i][j] = (bay[i-1][j-1] + bay[i+1][j+1] + bay[i+1][j-1] + bay[i-1][j+1])//4

			elif(i%2==1 and j%2==1): #blue pixel
				b[i][j] = bay[i][j]
				if(i==0):
					assert 0 , "ERROR! bay pattern error"

				elif(j==0):
					assert 0 , "ERROR! bay pattern error"

				elif(i==last_row-1 and j==last_col-1):
					r[i][j] = bay[i-1][j-1]
					g[i][j] = (bay[i-1][j] + bay[i][j-1]) //2

				elif(j==last_col-1):
					r[i][j] = (bay[i-1][j-1] + bay[i+1][j-1]) //2
					g[i][j] = (bay[i-1][j] + bay[i][j-1] + bay[i+1][j]) //3
				elif(i==last_row-1):
					r[i][j] = (bay[i-1][j-1] + bay[i-1][j+1]) //2
					g[i][j] = (bay[i-1][j] + bay[i][j-1] + bay[i][j+1]) //3
				
				else:
					r[i][j] = (bay[i-1][j-1] + bay[i+1][j+1] + bay[i+1][j-1] + bay[i-1][j+1])//4
					g[i][j] = (bay[i-1][j] + bay[i+1][j] + bay[i][j-1] + bay[i][j+1])//4

			else: # green pixel
				g[i][j] = bay[i][j]
				if(i==0):
					b[i][j] = bay[i+1][j]
				elif(j==0):
					b[i][j] = bay[i][j+1]

				elif(j==last_col-1):
					b[i][j] = (bay[i+1][j] + bay[i-1][j])//2

				elif(i==last_row-1):
					b[i][j] = (bay[i][j+1] + bay[i][j-1])//2
					
				if(i==last_row-1):
					r[i][j] = bay[i-1][j]
				elif(j==last_col-1):
					r[i][j] = bay[i][j-1]

				elif(j==0):
					r[i][j] = (bay[i+1][j] + bay[i-1][j])//2

				elif(i==0):
					r[i][j] = (bay[i][j+1] + bay[i][j-1])//2
				else:
					if(i%2==1 and j%2==0):
						r[i][j] = (bay[i-1][j] + bay[i+1][j])//2
						b[i][j] = (bay[i][j-1] + bay[i][j+1])//2
					else:
						b[i][j] = (bay[i-1][j] + bay[i+1][j])//2
						r[i][j] = (bay[i][j-1] + bay[i][j+1])//2
	return np.stack([r,g,b],axis=2).astype(int)

def denoise(rgb_image, method='mid'):
	assert rgb_image.shape[2] == 3, 'ERROR! RGB image required'
	assert method in ['mid', 'avg'], 'ERROR! denoise method not recognize'
	
	out = np.zeros(rgb_image.shape)
	last_row = rgb_image.shape[0]
	last_col = rgb_image.shape[1]
	
	if(method == 'mid'):

		for i in trange(3):
			for j in trange(rgb_image.shape[0]):
				for k in range(rgb_image.shape[1]):
					left	= k-1 if k !=0 else k
					right   = k+1 if k != last_col else k
					up	  = j-1 if j !=0 else j
					down	= j+1 if j != last_row else j
					out[j][k][i] = np.median(rgb_image[up:down+1,left:right+1,i])

	else: #avg
		for i in trange(3):
			for j in trange(rgb_image.shape[0]):
				for k in range(rgb_image.shape[1]):
					left	= k-1 if k !=0 else k
					right   = k+1 if k != last_col else k
					up	  = j-1 if j !=0 else j
					down	= j+1 if j != last_row else j
					out[j][k][i] = np.average(rgb_image[up:down+1,left:right+1,i])

	return out


def whitebalance(image, input_type = 'rgb', k = 'dynamic'):
	assert input_type in ['bayer', 'rgb'], 'ERROR! input_type not recognized in whitebalance'
	assert k in ['fixed128' ,'dynamic'], 'ERROR! K not recognized in whitebalance'

	k_r = 0.0
	k_g = 0.0
	k_b = 0.0
	
	if(input_type == 'bayer'):
		avg_r = np.average(image[0::2,0::2])
		avg_b = np.average(image[1::2,1::2])
		avg_g = (np.average(image[0::2,1::2]) + np.average(image[1::2,0::2])) //2
		if( k == 'fixed128'):
			k_r = 128/avg_r
			k_g = 128/avg_g
			k_b = 128/avg_b
		else:
			print("Dynamic k: %f"%((avg_r + avg_g + avg_b)/3 ))
			k_r = (avg_r + avg_g + avg_b)/3 /avg_r
			k_g = (avg_r + avg_g + avg_b)/3 /avg_g
			k_b = (avg_r + avg_g + avg_b)/3 /avg_b
		for i in range(image.shape[0]):
			for j in range(image.shape[1]):
				if(i%2==0 and j%2==0):
					image[i][j] *=  k_r
				elif(i%2 ==1 and j%2 ==1):
					image[i][j] *= k_b
				else:
					image[i][j] *= k_g
		return np.where(image>255, 255, image)
	else:
		avg_r = np.average(image[:,:,0])
		avg_g = np.average(image[:,:,1])
		avg_b = np.average(image[:,:,2])
		if( k == 'fixed128'):
			k_r = 128/avg_r
			k_g = 128/avg_g
			k_b = 128/avg_b
		else:
			print("Dynamic k: %f"%((avg_r + avg_g + avg_b)/3 ))
			k_r = (avg_r + avg_g + avg_b)/3 /avg_r
			k_g = (avg_r + avg_g + avg_b)/3 /avg_g
			k_b = (avg_r + avg_g + avg_b)/3 /avg_b
		image[:,:,0] *= k_r
		image[:,:,1] *= k_g
		image[:,:,2] *= k_b
		return np.where(image>255, 255, image)
def gamma(rgb_image, gamma=1/2.2, mode = 'bundle'):
	assert np.max(rgb_image) <= 255, 'ERROR! rgb image input value larger than 255'
	if(mode == 'bundle'):
		return (255 * np.power(rgb_image/255, gamma)).astype('int')
	else: #seperate
		r = (255 * np.power(rgb_image[:,:,0]/255, 1/2.5)).astype('int')
		g = (255 * np.power(rgb_image[:,:,1]/255, 1/2.2)).astype('int')
		b = (255 * np.power(rgb_image[:,:,2]/255, 1/2.5)).astype('int')
		return np.stack([r,g,b],axis=2)


def output_image(rgb_image, in_max = 255, stage='demosaic', comment=''):
	assert stage in ['raw','mosaic','demosaic', 'white', 'gamma', 'denoise','pure_raw']
	comment = '_'+comment if comment!='' else comment
	scipy.misc.toimage(rgb_image, cmin=0, cmax=in_max).save(OUTPUT_FOLDER+IMAGE_FILE[0:5]+stage+comment+FILE_POSTFIX)
	print("Stage: %s %s: \"%s\"" % (stage, 'output image', comment))

def output_image_v2(rgb_image, stage='demosaic', comment=''):
	assert stage in ['raw','mosaic','demosaic', 'white', 'gamma', 'denoise','pure_raw']
	comment = '_'+comment if comment!='' else comment
	file_name = OUTPUT_FOLDER+IMAGE_FILE[0:-4]+'_'+stage+comment+FILE_POSTFIX
	imageio.imwrite(file_name, rgb_image)
	print("Stage: %s %s: \"%s\"" % (stage, 'output image', file_name))

def print_rgb_info(rgb):
	print("RGB channel info: avg_r: %f, avg_g: %f, avg_b: %f" % (np.average(rgb[:,:,0]), np.average(rgb[:,:,1]), np.average(rgb[:,:,2])))
def print_bayer_info(bayer):
	print("BAYER channel info: avg_r: %f, avg_g: %f, avg_b: %f" % (np.average(bayer[0::2,0::2]), np.average(bayer[1::2,0::2]+bayer[0::2,1::2])/2, np.average(bayer[1::2,1::2])))
def print_stage_string(stage='demosaic', comment=''):
	assert stage in ['raw','mosaic','demosaic', 'white', 'gamma', 'denoise']
	print("\nStage: %s %s" % (stage, comment))



#bayer = get_raw_data()
png = get_png()
bayer = mosaic_png(png)
bayer = bayer//1
output_image_v2(bayer, stage='mosaic', comment = 'png_to_bayer')

print_stage_string(stage = 'demosaic')
rgb = demosaic(bayer)
print_rgb_info(rgb)
output_image_v2(rgb, stage='demosaic', comment = '')

print_stage_string(stage = 'denoise')
rgb = denoise(rgb)
output_image_v2(rgb, stage='denoise', comment = '')


print_stage_string(stage = 'white')
rgb = whitebalance(rgb, input_type = 'rgb',k = 'dynamic')
output_image_v2(rgb, stage='white', comment = '')


print_stage_string(stage = 'gamma')
rgb = gamma(rgb, 1/2.2)
output_image_v2(rgb, stage='gamma', comment = '')

'''
print_rgb_info(demosaic_rawpy)
output_image(demosaic_rawpy, stage='demosaic', comment='rawpy_srgb_green')

#demosaic: bayer -> rgb
# bayer = bayer.astype('int')
print_stage_string(stage = 'demosaic')
rgb = demosaic(bayer)
print("RGB max value",np.max(rgb))
print_rgb_info(rgb)

#denoise 
# rgb = rgb.astype('int')
print_stage_string(stage = 'denoise')
# bayer = bm3d.bm3d(bayer, sigma_psd=30/255, stage_arg=bm3d.BM3DStages.HARD_THRESHOLDING)
rgb = denoise(rgb, method='avg')
print("RGB max value",np.max(rgb))

# rgb = bm3d.bm3d(rgb, sigma_psd=30/255, stage_arg=bm3d.BM3DStages.HARD_THRESHOLDING)

#output post-denoise for test-matrix 

# rgb_clip = rgb[:,0:2128,:]

# r_flat = rgb[:,:,0].flatten()
# g_flat = rgb[:,:,1].flatten()
# b_flat = rgb[:,:,2].flatten()
# pd.DataFrame(r_flat).to_csv("r.csv",header = 'r', index = None)
# pd.DataFrame(g_flat).to_csv("g.csv",header = 'g', index = None)
# pd.DataFrame(b_flat).to_csv("b.csv",header = 'b', index = None)

print_rgb_info(rgb)
output_image(rgb, stage='denoise', comment='before_regress_green')

rgb = rgb.astype('int')
rgb = testmatrix_normal(rgb, r_mean=24.97156, g_mean=17.22542, b_mean=15.42425, r_sd=29.61812, g_sd=21.35735, b_sd=17.66722)
# rgb = rgb.astype('int')
print_rgb_info(rgb)

# # # rgb = rgb.astype('int')
output_image(rgb, stage='denoise', comment='after_regress_green')

# # #white balance
print_stage_string(stage = 'white')
# # rgb_mo = whitebalance(rgb_mo,input_type = 'rgb',k = 'dynamic')
rgb = whitebalance(rgb, input_type = 'rgb',k = 'dynamic')

output_image(rgb, stage='white', comment='green')

# # # print("Max value of rgb", np.max(rgb_mo))
print("Max value of rgb", np.max(rgb))

# # # print_bayer_info(rgb_mo)
# # print_bayer_info(rgb)

# # #gamma correction 
rgb = rgb.astype('int')
print_stage_string(stage = 'gamma')
# # print("RGB max value",np.max(rgb_mo))
print("RGB max value",np.max(rgb))

# # # rgb_mo = gamma(rgb_mo, 1/2.2)
rgb = gamma(rgb, 1/2.2)
# # rgb_m = gamma(rgb_m, 1/2.2)

print_rgb_info(rgb)

output_image(rgb, stage='gamma', comment='green')
'''

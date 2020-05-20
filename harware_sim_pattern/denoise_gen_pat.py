import numpy as np


import scipy.misc
import csv

PROCESS_ROW = 4
WIN_RADIUS = 1

def temp_get_picture_numpy(mode="easy"):
	if(mode == "easy"):
		list1 = [i for i in range(10)]
		array2 =  np.array([list1 for i in range(PROCESS_ROW)])
		
		return np.stack((array2,array2,array2),axis=2)

def temp_append(rgb):
	print("rgb shape", rgb.shape)
	temp = np.concatenate((rgb[0:1,:,:],rgb),axis=0)
	print("temp shape", temp.shape)
	for i in range(1):
		print(temp[:,:,i])
	temp = np.concatenate((temp,[temp[-1,:,:]]),axis=0)
	print("temp shape", temp.shape)
	for i in range(1):
		print(temp[:,:,i])
	temp = np.concatenate((temp[:,0:1,:],temp),axis=1)
	print("temp shape", temp.shape)
	for i in range(1):
		print(temp[:,:,i])
	temp = np.concatenate((temp,temp[:,-1,:].reshape(temp.shape[0],1,3)),axis=1)
	print("temp shape", temp.shape)
	for i in range(1):
		print(temp[:,:,i])
	return temp

def temp_gen_denoise_input_pattern(rgb, file_name='denoise_input.pat'):
	with open(file_name, "w") as writer:
		for i in range(0,rgb.shape[0],PROCESS_ROW):
			big_row = temp_append(rgb)
			for j in range(big_row.shape[1]):
				for k in range(big_row.shape[0]):
					writer.write("{0:b}".format(big_row[k,j,0]).zfill(8)+" "+"{0:b}".format(big_row[k,j,1]).zfill(8)+" "+"{0:b}".format(big_row[k,j,2]).zfill(8)+'\n')

def temp_denoise(rgb):
	result = np.zeros(rgb.shape)
	rgb = temp_append(rgb)
	for i in range(WIN_RADIUS,rgb.shape[0]-WIN_RADIUS):
		for j in range(WIN_RADIUS,rgb.shape[1]-WIN_RADIUS):
			result[i-1,j-1,0] = np.average(rgb[i-1:i+2,j-1:j+2,0])
			result[i-1,j-1,1] = np.average(rgb[i-1:i+2,j-1:j+2,1])
			result[i-1,j-1,2] = np.average(rgb[i-1:i+2,j-1:j+2,2])

	return result.astype(int)

def temp_gen_denoise_golden_pattern(rgb, file_name='denoise_golden.pat'):
	with open(file_name, "w") as writer:
		for i in range(rgb.shape[1]):
			for j in range(rgb.shape[0]):
				writer.write("{0:b}".format(rgb[j,i,0]).zfill(8)+" "+"{0:b}".format(rgb[j,i,1]).zfill(8)+" "+"{0:b}".format(rgb[j,i,2]).zfill(8)+'\n')



rgb = temp_get_picture_numpy()
golden_rgb = temp_denoise(rgb)
for i in range(3):
	print(golden_rgb[:,:,i])
temp_gen_denoise_golden_pattern(golden_rgb)
temp_gen_denoise_input_pattern(rgb)

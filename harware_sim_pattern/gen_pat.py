import os
import numpy as np
import struct
import math
import scipy.misc
import csv
import rawpy

IMAGE_FILE = '20201_00_10s.ARW'
RAW_DATA_MAX = 16383
PROCESS_ROW = 4
WIN_RADIUS = 1
PIC_ROW = 1024
PIC_COL = 1024

def main():
#    print("Generating bayer...")
#    bayer = get_picture_numpy()
    print("Reading bayer...")
    bayer = get_raw_data()[0:PIC_ROW, 0:PIC_COL]
    print("Bayer size:", bayer.shape)
    bayer = padding(bayer)
    print("Demosaicking...")
    dem_rgb = demosaic(bayer)
    print("Demosaic size:", dem_rgb.shape)
    print("Denoising...")
    den_rgb = denoise(dem_rgb)
    print("Denoise size:", den_rgb.shape)
    print("Computing mean...")
    rgb_mean = mean(den_rgb)
    print("Single channel mean:", rgb_mean[0:3])
    print("Overall mean:", rgb_mean[3])
    print("Computing gain...")
    rgb_gain = gain(rgb_mean)
    print("Gain in 16 bits:", rgb_gain)
    print("White balancing...")
    wb_rgb = wb(rgb_gain, den_rgb)
    print("White balance size:", wb_rgb.shape)
    print("Gamma correcting...")
    gamma_rgb = gamma(wb_rgb)
    print("Gamma size:", gamma_rgb.shape)
    print("Generating pat file...")
    gen_demosaic_input_pattern(bayer)
    gen_demosaic_golden_pattern(dem_rgb)
#    gen_denoise_input_pattern(dem_rgb)
    gen_denoise_golden_pattern(den_rgb)
    gen_mean_golden_pattern(rgb_mean)
    gen_gain_golden_pattern(rgb_gain)
#    gen_wb_input_pattern(den_rgb)
    gen_wb_golden_pattern(wb_rgb)
#    gen_gamma_input_pattern(wb_rgb)
    gen_gamma_golden_pattern(gamma_rgb)
    print("Generation complete!")

def get_picture_numpy():
    np.random.seed(0)
    image = np.random.randint(256, size = (PIC_ROW, PIC_COL))
    return image

def padding(bayer):
    print("Before padding:", bayer.shape)
    temp = np.concatenate((bayer[0:2,:], bayer),axis=0)
    temp = np.concatenate((temp, temp[-2:,:]),axis=0)
    temp = np.concatenate((temp[:,0:2],temp),axis=1)
    temp = np.concatenate((temp[:,-2:], temp),axis=1)
    print("After padding:", temp.shape)
    return temp

def get_raw_data(file_name = IMAGE_FILE):
    assert os.path.exists(file_name), "ERROR! IMAGE_FILE: {} not found".format(file_name)
    raw = rawpy.imread(file_name)
    print("Pattern of bayer:\n", raw.raw_colors[0:5,0:5])
    im = raw.raw_image_visible.astype(np.float32)
    im = (im)/RAW_DATA_MAX*255
    im = im.astype(int)
    return im

def gen_demosaic_input_pattern(bayer, file_name='demosaic_input.pat'):
    with open(file_name, "w") as writer:
        for k in range(0, bayer.shape[0] - 4, 4):
            for j in range(bayer.shape[1]):
                for i in range(k, k + 8, 1):
                    writer.write("{0:b}".format(bayer[i,j]).zfill(8)+'\n')

def gen_denoise_input_pattern(rgb, file_name='denoise_input.pat'):
    with open(file_name, "w") as writer:
        for k in range(0, rgb.shape[0] - 4, 4):
            for j in range(rgb.shape[1]):
                for i in range(k, k + 6, 1):
                    writer.write("{0:b}".format(rgb[i,j,0]).zfill(8)+" "+"{0:b}".format(rgb[i,j,1]).zfill(8)+" "+"{0:b}".format(rgb[i,j,2]).zfill(8)+'\n')

def gen_wb_input_pattern(rgb, file_name='wb_input.pat'):
    with open(file_name, "w") as writer:
        for k in range(0, rgb.shape[0], 4):
            for j in range(rgb.shape[1]):
                for i in range(k, k + 4, 1):
                    writer.write("{0:b}".format(rgb[i,j,0]).zfill(8)+" "+"{0:b}".format(rgb[i,j,1]).zfill(8)+" "+"{0:b}".format(rgb[i,j,2]).zfill(8)+'\n')

def gen_gamma_input_pattern(rgb, file_name='gamma_input.pat'):
    with open(file_name, "w") as writer:
        for i in range(rgb.shape[0]):
            for j in range(rgb.shape[1]):
                writer.write("{0:b}".format(rgb[i,j,0]).zfill(8)+" "+"{0:b}".format(rgb[i,j,1]).zfill(8)+" "+"{0:b}".format(rgb[i,j,2]).zfill(8)+'\n')

def demosaic(bay, debug=0):
    r = np.zeros((bay.shape))
    g = np.zeros((bay.shape)) 
    b = np.zeros((bay.shape)) 
    last_row = bay.shape[0]
    last_col = bay.shape[1]
    for i in range(bay.shape[0]):
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
    return np.stack([r[1:-1 ,1:-1],g[1:-1 ,1:-1],b[1:-1 ,1:-1]],axis=2).astype(int)

def denoise(rgb):
    result = np.zeros(rgb.shape)
    for i in range(WIN_RADIUS, rgb.shape[0] - WIN_RADIUS):
        for j in range(WIN_RADIUS, rgb.shape[1] - WIN_RADIUS):
            result[i-1,j-1,0] = np.average(rgb[i-1:i+2,j-1:j+2,0])
            result[i-1,j-1,1] = np.average(rgb[i-1:i+2,j-1:j+2,1])
            result[i-1,j-1,2] = np.average(rgb[i-1:i+2,j-1:j+2,2])
    return result[:-2, :-2, :].astype(int)

def mean(rgb):
    avg_r = int(np.average(rgb[:,:,0]) // 1)
    avg_g = int(np.average(rgb[:,:,1]) // 1)
    avg_b = int(np.average(rgb[:,:,2]) // 1)
    avg_total = int((avg_r + avg_g + avg_b) // 3)
    return [avg_r, avg_g, avg_b, avg_total]

def gain(rgb_mean):
    avg_r = rgb_mean[0]
    avg_g = rgb_mean[1]
    avg_b = rgb_mean[2]
    avg_total = rgb_mean[3]
    k_r = avg_total / avg_r
    k_g = avg_total / avg_g
    k_b = avg_total / avg_b
    kr_fixed16b = float_to_fixed16b(k_r)
    kg_fixed16b = float_to_fixed16b(k_g)
    kb_fixed16b = float_to_fixed16b(k_b)
    return [fixed16b_to_float(kr_fixed16b), fixed16b_to_float(kg_fixed16b), fixed16b_to_float(kb_fixed16b)]

def float_to_fixed16b(num):
    bits = ''.join('{:0>8b}'.format(c) for c in struct.pack('!f', num))
    exp = 0
    fraction = 0
    for i in range(1, 9):
        exp = exp * 2 + int(bits[i])
    exp = exp - 127; #exponent bias = 127;
    for i in range(9, 32):
        fraction = fraction * 2 + int(bits[i])
    fraction = fraction + (1 << 23)
    if exp > 7:
        print("WARNING: gain overflow")
    fraction = fraction >> (15 - exp)
    return "{0:b}".format(fraction).zfill(16)

def wb(avg_gain, rgb):
    result = np.zeros(rgb.shape)
    k_r = avg_gain[0]
    k_g = avg_gain[1]
    k_b = avg_gain[2]
    kr_fixed16b = float_to_fixed16b(k_r)
    kg_fixed16b = float_to_fixed16b(k_g)
    kb_fixed16b = float_to_fixed16b(k_b)
    kr_fixed8b = kr_fixed16b[4:12]
    kg_fixed8b = kg_fixed16b[4:12]
    kb_fixed8b = kb_fixed16b[4:12]
    kr_float = fixed8b_to_float(kr_fixed8b)
    kg_float = fixed8b_to_float(kg_fixed8b)
    kb_float = fixed8b_to_float(kb_fixed8b)
    result[:,:,0] = rgb[:,:,0] * kr_float
    result[:,:,1] = rgb[:,:,1] * kg_float
    result[:,:,2] = rgb[:,:,2] * kb_float
    return result.astype(int)

def fixed16b_to_float(bits):
    terms = [2 ** i for i in range(7, -9, -1)]
    partial_product = [terms[i] if int(bits[i]) else 0 for i in range(7, -9, -1)]
    return sum(partial_product)

def fixed8b_to_float(bits):
    terms = [2 ** i for i in range(3, -5, -1)]
    partial_product = [terms[i] if int(bits[i]) else 0 for i in range(3, -5, -1)]
    return sum(partial_product)

def gamma(rgb):
    result = np.zeros(rgb.shape)
    gamma_list = [int(255 * math.pow(i / 255, 1 / 2.2)) for i in range(256)]
    for i in range(rgb.shape[0]):
        for j in range(rgb.shape[1]):
            for k in range(rgb.shape[2]):
                result[i,j,k] = gamma_list[rgb[i,j,k]]
    return result.astype(int)

def gen_demosaic_golden_pattern(rgb, file_name='demosaic_golden.pat'):
    with open(file_name, "w") as writer:
        for k in range(0, rgb.shape[0] - 4, 4):
            for j in range(rgb.shape[1]):
                for i in range(k, k + 6, 1):
                    writer.write("{0:b}".format(rgb[i,j,0]).zfill(8)+" "+"{0:b}".format(rgb[i,j,1]).zfill(8)+" "+"{0:b}".format(rgb[i,j,2]).zfill(8)+'\n')

def gen_denoise_golden_pattern(rgb, file_name='denoise_golden.pat'):
    with open(file_name, "w") as writer:
        for k in range(0, rgb.shape[0], 4):
            for j in range(rgb.shape[1]):
                for i in range(k, k + 4, 1):
                    writer.write("{0:b}".format(rgb[i,j,0]).zfill(8)+" "+"{0:b}".format(rgb[i,j,1]).zfill(8)+" "+"{0:b}".format(rgb[i,j,2]).zfill(8)+'\n')

def gen_wb_golden_pattern(rgb, file_name='wb_golden.pat'):
    with open(file_name, "w") as writer:
        for i in range(rgb.shape[0]):
            for j in range(rgb.shape[1]):
                writer.write("{0:b}".format(rgb[i,j,0]).zfill(8)+" "+"{0:b}".format(rgb[i,j,1]).zfill(8)+" "+"{0:b}".format(rgb[i,j,2]).zfill(8)+'\n')

def gen_gamma_golden_pattern(rgb, file_name='gamma_golden.pat'):
    with open(file_name, "w") as writer:
        for i in range(rgb.shape[0]):
            for j in range(rgb.shape[1]):
                writer.write("{0:b}".format(rgb[i,j,0]).zfill(8)+" "+"{0:b}".format(rgb[i,j,1]).zfill(8)+" "+"{0:b}".format(rgb[i,j,2]).zfill(8)+'\n')

def gen_mean_golden_pattern(rgb_mean, file_name='mean_golden.pat'):
    with open(file_name, "w") as writer:
        writer.write("{0:b}".format(rgb_mean[0]).zfill(8)+" "+"{0:b}".format(rgb_mean[1]).zfill(8)+" "+"{0:b}".format(rgb_mean[2]).zfill(8)+'\n')
        writer.write("{0:b}".format(rgb_mean[3]).zfill(8))

def gen_gain_golden_pattern(rgb_gain, file_name='gain_golden.pat'):
    with open(file_name, "w") as writer:
        writer.write(float_to_fixed16b(rgb_gain[0])+" "+float_to_fixed16b(rgb_gain[1])+" "+float_to_fixed16b(rgb_gain[2]))

if __name__ == '__main__':
    main()

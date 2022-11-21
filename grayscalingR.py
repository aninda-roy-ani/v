# -*- coding: utf-8 -*-
"""
Created on Wed Apr  7 20:12:52 2021

@author: Dell
"""


import glob
from PIL import Image
import os

path = glob.glob("F:/thesis/matlab-deep-learning-mtcnn-face-detection-a0a8ecc/code/mtcnn/+mtcnn/croppedR/*.jpg") #It is the path to images from where it will read
outpath = "F:/thesis/matlab-deep-learning-mtcnn-face-detection-a0a8ecc/code/mtcnn/+mtcnn/toTestR/" ##It is the path to images to where it will write
for file in path:
    image = Image.open(file)
    image = image.resize((200, 200))
    imgGray = image.convert('L')
    
    src_fname, ext = os.path.splitext(file)  # split filename and extension
    # construct output filename, basename to remove input directory
    save_fname = os.path.join(outpath, os.path.basename(src_fname)+'.jpg')
    imgGray.save(save_fname)

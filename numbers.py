#!/usr/bin/env python
# generates the score sheet
import os
from PIL import Image,ImageFont,ImageDraw

size = 260, 24

def base():
  # this function just generates a reference
  # so you know where to place the other numbers
  img=Image.new('RGBA',size,color='black')
  #img.putalpha(255)
  draw=ImageDraw.Draw(img)
  font=ImageFont.truetype("cour.ttf", 32)
  y=-6
  dx=18
  draw.text((1+ 0*dx,y),'0',(64,192,255),font)
  draw.text((1+ 1*dx,y),'0',(64,192,255),font)
  draw.text((1+ 2*dx,y),'0',(64,192,255),font)
  draw.text((1+ 3*dx,y),':',(192,192,0),font)
  draw.text((1+ 4*dx,y),'0',(255,0,0),font)
  draw.text((1+ 5*dx,y),'0',(255,0,0),font)
  draw.text((1+ 6*dx,y),'0',(255,0,0),font)
  draw.text((1+ 7*dx,y),'/',(192,192,0),font)
  draw.text((1+ 8*dx,y),'0',(0,255,0),font)
  draw.text((1+ 9*dx,y),'0',(0,255,0),font)
  draw.text((1+10*dx,y),'0',(0,255,0),font)
  draw.text((1+11*dx,y),':',(0,255,0),font)
  draw.text((1+12*dx,y),'0',(0,255,0),font)
  draw.text((1+13*dx,y),'0',(0,255,0),font)
  img.save('base.png')

def empty():
  # the empty score sheet, hence the characters : and /
  # use the base output to determine the locations
  img=Image.new('RGBA',size,color='white')
  img.putalpha(255)
  draw=ImageDraw.Draw(img)
  font=ImageFont.truetype("cour.ttf", 32)
  y=-6
  dx=18
  # here 3, 7, 11 are the locations of from above
  draw.text((1+ 3*dx,y),':',(192,192,0),font)
  draw.text((1+ 7*dx,y),'/',(192,192,0),font)
  draw.text((1+ 11*dx,y),':',(0,255,0),font)
  img.save('timer'+os.sep+'empty.png')

def number(loc=0,num=0,color=(0,0,0)):
  # this funciton will generate a number. The resulting
  # file will be named with the location first, and its
  # value last
  img=Image.new('RGBA',size,color='white')
  img.putalpha(0)
  draw=ImageDraw.Draw(img)
  font=ImageFont.truetype("cour.ttf", 32)
  y=-6
  dx=18
  draw.text((1+ loc*dx,y),'%i'%num,color,font)
  img.save('timer'+os.sep+'%i%i.png'%(loc,num))

base()
empty()
# one could have done the range within the number
# function and called it numbers ...
# blue score - 3 digits
for i in range(10): number(0,i,(64,192,255))
for i in range(10): number(1,i,(64,192,255))
for i in range(10): number(2,i,(64,192,255))
# red score - 3 digits
for i in range(10): number(4,i,(255,0,0))
for i in range(10): number(5,i,(255,0,0))
for i in range(10): number(6,i,(255,0,0))
# minutes (3 digits) and seconds
for j in [8,9,10,12,13]:
    for i in range(10): number(j,i,(0,255,0))
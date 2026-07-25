from PIL import Image,ImageDraw,ImageFont
import numpy as np

class Cutesy:
    def __init__(self,image):
        self.compensation=0.55
        self.cell_size=10
        self.cell_w=self.cell_size
        self.cell_h=int(self.cell_size/self.compensation)
        self.img=Image.open(image)
        self.cols=100
        self.aspect=self.img.height/self.img.width
        self.rows=int(self.cols*self.aspect*self.compensation)
        self.small=self.img.resize((self.cols,self.rows),Image.LANCZOS)
        self.pixels=np.array(self.small.convert("RGB"))
        self.gray = 0.299*self.pixels[...,0] + 0.587*self.pixels[...,1] + 0.114*self.pixels[...,2]
        self.DIGIT_RAMP="1 7 3 4 9 5 2 6 0 8".split()
        self.W,self.H=self.small.size[0]*self.cell_w,self.small.size[1]*self.cell_h
        self.canvas=Image.new("RGB",(self.W,self.H),color="black")
        self.draw=ImageDraw.Draw(self.canvas)
        self.font=ImageFont.truetype("Font/DejaVuSansMono-Bold.ttf",int(self.cell_size*1.3))

    def brightness(self,brightness):
        bucket=int((255-brightness)/255*len(self.DIGIT_RAMP))
        bucket=min(bucket,len(self.DIGIT_RAMP)-1)
        return self.DIGIT_RAMP[bucket]
    
    def edit_sizes(self,cols,cell):
        self.cols=cols
        self.cell_size=cell

    def preview(self):
        for r in range(self.gray.shape[0]):
            row = ""
            for c in range(self.gray.shape[1]):
                brightness = self.gray[r, c]
                digit = self.brightness(brightness)
                row += digit
            print(row)

    def checker(self):
        for r in range(self.gray.shape[0]):
            for c in range(self.gray.shape[1]):
                brightness=self.gray[r,c]
                digit=self.brightness(brightness)
                x=c*self.cell_w
                y=r*self.cell_h
                #r_val,g_val,b_val=self.pixels[r,c]
                self.draw.text((x,y), digit, font=self.font, fill=(int(brightness),)*3)
                #self.draw.text((x,y),digit,font=self.font,fill=(int(r_val),int(g_val),int(b_val)))
        self.canvas.save("output.png")
        print("saved output.png")


    def checkTTF(self):
        print(self.font.path)
        print(self.font.size)

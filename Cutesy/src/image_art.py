from PIL import Image
import numpy as np

class Cutesy:
    def __init__(self,image):
        self.img=Image.open(image)
        self.cols=60
        self.compensation=0.55
        self.aspect=self.img.height/self.img.width
        self.rows=int(self.cols*self.aspect*self.compensation)
        self.small=self.img.resize((self.rows,self.cols))
        self.pixels=np.array(self.small.convert("RGB"))
        self.gray=self.pixels.mean(axis=2)
        self.DIGIT_RAMP="1 7 3 4 9 5 2 6 0 8".split()

    def brightness(self,brightness):
        bucket=int((255-brightness)/255*len(self.DIGIT_RAMP))
        bucket=min(bucket,len(self.DIGIT_RAMP)-1)
        return self.DIGIT_RAMP[bucket]

    def checker(self):
        for b in [10, 60, 130, 200, 250]:
            print(b, "->",self.brightness(b))

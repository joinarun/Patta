from PIL import Image
import pytesseract

class ProcessCaptcha:
    def Captchatotext(self, captchafile):
       
       original = Image.open(captchafile)
       #original.show()
       
       left = 442
       top = 723
       right = 616
       bottom = 775
       
       cropped_example = original.crop((left, top, right, bottom))
       text = pytesseract.image_to_string(cropped_example, lang = 'eng')
       #cropped_example.show()
       #cropped_example.save('mycaptcha.png')
       #print(text)
       return text
    


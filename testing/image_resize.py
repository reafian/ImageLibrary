from PIL import Image

try:
	image = Image.open("/Users/richard/Desktop/1979.jpg")
	image = image.resize((500,500),Image.ANTIALIAS)
	image.save(fp="newimage.jpg")
except IOError:
	print("Unable to open image")

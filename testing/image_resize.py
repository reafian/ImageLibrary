from PIL import Image
import sys

sizes=["1000","600","500"]

argument_total=format(len(sys.argv))

#print(f"total number of arguments = {argument_total}")
#print(sys.argv)
#for argument in sys.argv:
#	print(argument)

#for size in sizes:
#	print(size)

try:
	name=str(sys.argv[1])
	image = Image.open(name)
	name_list=name.split(".")
#	print(name)
#	print(name_list)
	prefix=name_list[0]
	suffix=name_list[1]
#	print(prefix)
#	print(suffix)
	if image.height == image.width:
		for size in sizes:
			if image.height > int(size):
				image = image.resize((int(size),int(size)),Image.ANTIALIAS)
				image.save(fp=prefix+"_"+size+"."+suffix)
	else:
		print("Image height is not equal to image width")
except IOError:
	print("Unable to open image")

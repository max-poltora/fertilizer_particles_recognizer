# Load required libraries
library(magick)
library(raster)
library(EBImage)

# Folder structure
imgdir <- "C:/Users/user/Desktop/Fertilizer particles/Images/Dark" 
mskdir <- "C:/Users/user/Desktop/Fertilizer particles/Masks/Dark"
bdir <- "C:/Users/user/Desktop/Fertilizer particles/Background/White"
imgdest <- "C:/Users/user/Desktop/Fertilizer particles/Images"
mskdest <- "C:/Users/user/Desktop/Fertilizer particles/Masks"

# Some masks had resolutions different from their corresponding images due to flipping and cropping at the first step augmentation process. The loop below resizes masks of those images.
for(n in 1:length(dir(imgdir))){
	im = paste0(imgdir, "/", dir(imgdir)[n]) %>% image_read() %>% image_info()
	msk = paste0(mskdir, "/", dir(mskdir)[n]) %>% image_read() %>% image_info()
	check = im$width == msk$width
	if(check==FALSE){
		message(paste0("resizing ", n, " mask"))
		paste0(mskdir, "/", dir(mskdir)[n]) %>% image_read() %>% image_resize(geometry_size_pixels(width = im$width, height = im$height, preserve_aspect=FALSE)) %>% image_write(paste0(mskdir, "/", dir(mskdir)[n]))
	}
}

# The loop below first cuts out the background and merges fertilizer particles images to other backgrounds.
for(j in 1:length(dir(bdir))){
	for(i in 1:length(dir(imgdir))){
		img = paste0(imgdir, "/", dir(imgdir)[i]) %>% image_read()
		msk = paste0(mskdir, "/", dir(mskdir)[i]) %>% image_read()
		img = img %>% image_composite(msk %>% image_transparent("white")) %>% image_transparent("black")
		b = paste0(bdir, "/", dir(bdir)[j]) %>% image_read()
		
		if(image_info(img)$width > image_info(b)$width){
			img = img %>% image_rotate(90)
			msk = msk %>% image_rotate(90)
		}
		
		img = c(b, img) %>% image_flatten()
		msk = c(image_blank(image_info(b)$width, image_info(b)$height, "black"), msk) %>% image_flatten()
		img %>% image_write(paste0(imgdest, "/", strsplit(dir(imgdir)[i], "[.]")[[1]][1], "_", j,".jpg"), format="jpeg", quality=100)
		msk %>% image_write(paste0(mskdest, "/", strsplit(dir(imgdir)[i], "[.]")[[1]][1], "_", j,".jpg"), format="jpeg", quality=100)
	}
}

library(jsonlite)
library(png)
library(base64enc)
library(raster)
library(imager)

anndir <- "C:/Users/user/Desktop/Fertilizer particles/Dataset_initial/Annotations"
imgdir <- "C:/Users/user/Desktop/Fertilizer particles/Dataset_initial/Images"
mskdir <- "C:/Users/user/Desktop/Fertilizer particles/Dataset_initial/Masks"

n=1
for(n in n:length(dir(imgdir))){
	setwd(imgdir)
	img <- load.image(dir()[n])
	setwd(anndir)
	json <- fromJSON(dir()[n])
	data <- json$objects$bitmap$data
	corner <- json$objects$bitmap$origin
	
	i=1
	shapes <- raster(extent(0,dim(img)[1], 0, dim(img)[2]), ncol=dim(img)[1], nrow=dim(img)[2])
	for(i in i:length(corner)){
		if(!is.na(data[i])){
			img2<-readPNG(memDecompress(base64decode(data[i]), type="gzip"))
			r <- brick(img2)
			r <- dropLayer(r, c(2:4))
			extent(r) <- c(xmin=corner[[i]][1], xmax=corner[[i]][1]+dim(r)[2], ymin=corner[[i]][2], ymax=corner[[i]][2]+dim(r)[1])
			r <- flip(r, "y")
			values(r) <- values(r)*i
			r[r==0] <- NA
			shapes <- merge(shapes, r)
			i=i+1
		} else {
			i=i+1
		}
	}
	bound <- boundaries(shapes, type="outer", classes=TRUE)
	bound[bound==1] <- 2
	bound[bound==0] <- 1
	bound[bound==2] <- 0
	bound[is.na(bound[])] <- 0
	bound <- flip(bound, "y")
	mask <- as.cimg(bound)
	save.image(mask, paste0(mskdir, "/", strsplit(dir()[n], "[.]")[[1]][1], ".jpg"), quality=1)
	n=n+1
}

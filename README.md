# Fertilizer particles recognizer
## Introduction
Fertilizer can be defined as any material of natural (organic fertilizer) or synthetic (inorganic, chemical or mineral fertilizer) origin that is applied to soil or to plant tissues in order to provide nutrients to a crop. Nutrients are food or building blocks for plant body. Most industrially manufactured fertilizers are available in spherical or irregularly shaped particles ranging from 1 mm to 6 mm in diameter. The quality of commercially available fertilizers is measured by a number of parameters. Among the most important features are chemical content and granulometric composition. Chemical analysis is an important measure of the degree of compliance with various international and national standards, while particles size distribution by fraction can tell, if a product is prone to dusting, cacking or segregating during handling and storage. Granulometry is also a valuable indicator of potential issues during processes of fertilizer blending and spreading. Generally, commercial batches of inorganic fertilizers are randomly tested along supply chain to monitor their consistence against declared specifications. Sometimes, there is a need in alternative rapid test of a product, due to lack of financial or temporal resources for proper laboratory inspection. As such, measurement of particle size distribution based on visual analysis of digital images of fertilizer granules, might become a helpful tool for inspectors, managers and farmers.

## Obectives
This project is performed for self-learning purposes and to gain practical experience in neural networks usage for images segmentation. In general, major obective can be formulated as following question: is it possible to assess particle sizes of a random fertilizer sample by simply pouring it onto a surface and making a picture with a smartphone camera. This process can be devided into several stages, which are listed below in more details. 
<p align="center">
  <img src="https://github.com/max-poltora/fertilizer_particles_recognizer/blob/main/Example%20pictures/Segmentation.gif" height="300px" alt="check check">
  <em>Picture of a fertilizer spill with each particle being recognized and pictured with different colours</em>
</p>
I started with making pictures of spills of various fertilizers. Below is a couple of images as an example:



What I aim is, basically, to recognize every single particle on an image, like follows:



<img src="https://github.com/max-poltora/fertilizer_particles_recognizer/blob/main/Example%20pictures/IMG_20200626_121552.jpg" height="300px"> <img src="https://github.com/max-poltora/fertilizer_particles_recognizer/blob/main/Example%20pictures/an_1.jpg" width="300px" height="300px">

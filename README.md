# Fertilizer particles recognizer
## Introduction
<p align="justify">
Fertilizer can be defined as any material of natural (organic fertilizer) or synthetic (inorganic, chemical or mineral fertilizer) origin that is applied to the soil or to plant tissues in order to provide nutrients to a crop. Nutrients are food or building blocks for plant body. Most industrially manufactured fertilizers are available in spherical or irregularly shaped particles ranging from 1 mm to 6 mm in diameter. The quality of commercially available fertilizers is measured by a number of parameters. Among the most important features are chemical content and granulometric composition. Chemical analysis is an important measure of the degree of compliance with various international and national standards, while particles distribution by fraction can tell, if a product is prone to dusting, cacking or segregating during handling and storage. Granulometry is also a valuable indicator of potential issues during processes of fertilizer blending and spreading. Generally, commercial batches of inorganic fertilizers are randomly tested along supply chain to monitor their consistence against declared specifications. Sometimes, there is a need in alternative rapid test of a product, due to lack of financial or temporal resources for proper laboratory inspection. As such, measurement of particle size distribution based on visual analysis of digital images of fertilizer granules, might become a helpful tool for inspectors, managers and farmers.
  </p>
  
## Obectives
<p align="justify">
This project is performed for self-learning purposes and to gain practical experience in neural networks usage for images segmentation. In general, major obective can be formulated as following question: is it possible to assess particle sizes of a random fertilizer sample by simply pouring it onto a surface and making a picture with a smartphone camera? Entire process was devided into several stages, which are listed below in more details. 
  </p>
  
<p align="center">
<img src="https://github.com/max-poltora/fertilizer_particles_recognizer/blob/main/Example%20files/Segmentation.gif" height="300px"> <br />
<em>Picture of a fertilizer spill with each particle being identiffied and segmented with different colours</em>
  </p>

## Workflow
#### 1. Generating the dataset
  - Fertilizers were grouped by colour into two categories: dark coloured (reddish or brownish) and light coloured (whitish or greyish). They were spilled portion by portion over table surfaces: dark coloured sample – on white surface and light coloured sample – on dark surface. Particles were distributed by hand as even as possible. Further, a smartphone camera was located horizontally 20 cm above the table surface with help of a ruler and a level camera app.
  - Each particle was annotated using online labelling service by [Supervisely](https://supervise.ly/). Since the number of particles in each image varied from 190 to 620, which made the labelling time consuming, two-step augmentation procedure was performed thereafter over 9 images.
  - At first augmentation stage images were flipped and randomly cropped using [Supervisely](https://supervise.ly/) data transformation tool. Then, generated images and their corresponding masks in the form of .jpeg and .json files were dowbloaded to a local machine for further evaluation.
  - Json files were converted to masks images as discribed in [Masks_from json to image.R](https://github.com/max-poltora/fertilizer_particles_recognizer/blob/main/Masks_from%20json%20to%20image.R) file.
  - Further, pool of dark and light backgrounds were created and a dataset generated using the script documented in [Generate dataset.R](https://github.com/max-poltora/fertilizer_particles_recognizer/blob/main/Generate%20dataset.R) file.

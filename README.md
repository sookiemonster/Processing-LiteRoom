# APCSFinalProject
Our prototype document.  
[LiteRoom: The Image Manipulator Program](https://docs.google.com/document/d/1loHmnPx4b_RIys0d_C-07HIXoZBVQuqASQAtE_pxfTs/edit?usp=sharing)

**1.** Group Name  
Yagami Lite

**2.** Group Members  
Daniel Sooknanan & Jonathan Wu

**3.** Brief Description  
LiteRoom (our version of Adobe’s Lightroom) is an image editing program that’s useful for color correction and color grading. Within the program there will be sliders that can be used to adjust certain aspects of the image, as well as a graph representing data from the image.

### Development Log

5/24/2021  
Daniel - Created all the Slider subclasses necessary for proof of concept and made sure they generally work.  

Jonathan - Created a Navigator class as well as two buttons necessary for loading and saving images. I also worked on resizing an image if it was larger than the editor in our program. I also made it allow to process one image at a time an infinite amount of time.

5/25/2021  
Jonathan - Enhanced the load and saving buttons by adding error messages when the user performs an invalid action. Also centered the image when loading the image.

Daniel - Added HSL to RGB conversions for sliders & added label option to WindowObjects. Fixed merge conflicts between jBranch & dBranch and updated demo & main branches.

5/26/2021 

Daniel - Optimized draw() a lot, increasing the fps from roughly 9fps to minimum of 24fps for large (4000 x 2000) images. Added a update interval which only calls draw() every specified number of frames. Added better visuals to siders to more effectively convey their function.  

Jonathan - Started working the "zoom" partion of the navigator class.

5/27/2021

Jonathan - Got the image to display in the "zoom" box. Start working on the part that zooms in on the specific part of the image.

Daniel - Added lightness, saturation, & sharpness sliders. Updated WindowObject & slider organization. 

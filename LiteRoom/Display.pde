private PImage img, smallImage;
private float xCor, yCor, zoomX, zoomY;

public class Display {
  
  public Display(String file) {
    img = loadImage(file);
    smallImage = img;
  }
  
  public Display(PImage newImage) {
    img = newImage;
    smallImage = newImage;
  }
  
  public void display() {
  }
  
  public float canvasX() {
    xCor = 288 + ((1344 - img.width)/2);
    return xCor;
  }
  
  public float canvasY() {
    yCor = (1054 - img.height)/2;
    return yCor;
  }
  
  public float getZoomX() {
    zoomX = 11 + ((267 - smallImage.width)/2);
    return zoomX;
  }
  
  public float getZoomY() {
    zoomY = 11 + ((199 - smallImage.height)/2);
    return zoomY;
  }
  
  public void smallDisplay() {
    float smallX = (267 - smallImage.width)/2;
    float smallY = (199 - smallImage.height)/2;
    image(smallImage, 11 + smallX, 11 + smallY);
  }
  
  public PImage resize(PImage img) {
    while (img.width > 1920-280-280 || img.height >= 1080) {
      if (img.width > 1920-288-288) {
        img.resize(1920-288-288,0);
      } else if (img.height >= 1080) {
        img.resize(0,1054);
      }
    }
    return img;
  }
  
  public PImage resizeSmall(PImage img) {
    if (smallImage.width > 267) {
      smallImage.resize(267,0);
    } else if (img.height > 199) {
      smallImage.resize(0,199);
    }
    return img;
  }
  
}

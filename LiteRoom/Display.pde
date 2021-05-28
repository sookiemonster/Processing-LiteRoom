private PImage img;

public class Display {
  
  public Display(String file) {
    img = loadImage(file);
  }
  
  public Display(PImage newImage) {
    img = newImage;
  }
  
  public void display() {
    int newX = (1344 - img.width)/2;
    int newY = (1080 - img.height)/2;
    image(img, 288 + newX, 0 + newY);
  }
  
  public void 
  
  public PImage resize(PImage img) {
    if (img.width > 1920-288-288) {
      img.resize(1920-288-288,0);
    } else if (img.height > 1080) {
      img.resize(0,1080);
    }
    return img;
  }
  
}

private PImage img;
private boolean imgPresent = false;

public class Display {
  public Display(String file) {
    img = loadImage(file);
    imgPresent = true;
  }
  
  public void display() {
    image(img, 288, 0);
  }
  
  public PImage resize(PImage img) {
    if (img.width > 1920-288-288) {
      img.resize(1920-288-288,0);
    } else if (img.height > 1080) {
      img.resize(0,1080);
    }
    return img;
  }
 
  public boolean hasImg() {
    return imgPresent;
  }
}

private PImage img;
private PImage smallImage;

public class Display {
  
  public Display(String file) {
    img = loadImage(file);
    smallImage = img;
  }
  
  public Display(PImage newImage) {
    img = newImage;
    smallImage = img;
  }
  
  public void display() {
    int newX = (1344 - img.width)/2;
    int newY = (1080 - img.height)/2;
    image(img, 288 + newX, 0 + newY);
    if (smallImage.width > 288 || smallImage.height >200) {
      resizeSmall();
    }
    smallDisplay();
  }
  
  public void smallDisplay() {
    float smallX = (267 - smallImage.width)/2;
    float smallY = (199 - smallImage.height)/2;
    image(smallImage, 11 + smallX, 11 + smallY);
  }
  
  public PImage resize(PImage img) {
    if (img.width > 1920-288-288) {
      img.resize(1920-288-288,0);
    } else if (img.height > 1080) {
      img.resize(0,1080);
    }
    return img;
  }
  
  public void resizeSmall() {
    if (smallImage.width > 267) {
      smallImage.resize(267,0);
    } else if (img.height > 199) {
      smallImage.resize(0,199);
    }
    return;
  }
}

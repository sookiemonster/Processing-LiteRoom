public class VBSlider extends Slider {
  
  private final color left = color(0,0,5), right = color(0,0,70);
  private float diff;
  
  public VBSlider(float x, float y) {
    super(x,y, "Brightness");
  }
  
  public void display() {
    super.gradient2(left, right);
    super.display();
  }
  
  public boolean drag() {
    diff = (this.getPosition() - 75.0) / w;
    return super.drag();
  }
  
  public color apply(color c) {
    return c;
  }
  
  public color apply(int i, color c, int imgWidth, int imgHeight) {
    colorMode(RGB, 256, 256, 256);
    int x = pixelsToX(i, imgWidth);
    int y = pixelsToY(i, imgWidth);
    
    float brighten = map(distSquared(x, y, imgHeight/2, imgWidth/2), 0, min(imgHeight/2, imgWidth/2) * min(imgHeight/2, imgWidth/2), 0, 1) * diff + 1; 
    
    return color(red(c) * brighten, green(c) * brighten, blue(c) * brighten);
  }
  
  private float distSquared(float x1, float y1, float x2, float y2) {
    return ((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1));
  }
  
  private int pixelsToX(int i, int imgWidth) {
    return i / imgWidth;
  }
  
  private int pixelsToY(int i, int imgWidth) {
    return i % imgWidth;
  }
  
}

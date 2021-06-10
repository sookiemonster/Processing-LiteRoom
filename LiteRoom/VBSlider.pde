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
  
  public void update() {
    diff = (this.getPosition() - 75.0) / w;
  }
  
  public boolean drag() {
    update();
    return super.drag();
  }
  
  public color apply(color c) {
    return c;
  }
  
  public color apply(int i, color c, int imgWidth, int imgHeight, float roundness) {
    colorMode(RGB, 256, 256, 256);
    float x = pixelsToX(i, imgWidth);
    float y = pixelsToY(i, imgWidth);
    
    float cX = imgHeight / 2.0;
    float cY = imgWidth / 2.0;
    
    float a = imgHeight / 2.0;
    float b = lerp(imgWidth / 2.0 + imgWidth / 5.0, imgHeight / 2.0, roundness);
    
    float dist = (((x - cX) * (x - cX)) / (a * a)) + (((y - cY) * (y - cY)) / (b * b));
    float brighten = diff * dist + 1;
    
    return color(red(c) * brighten, green(c) * brighten, blue(c) * brighten);
  }
 
  
  private int pixelsToX(int i, int imgWidth) {
    return i / imgWidth;
  }
  
  private int pixelsToY(int i, int imgWidth) {
    return i % imgWidth;
  }
  
}

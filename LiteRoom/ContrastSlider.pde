public class ContrastSlider extends Slider {
  
  private final color left = color(0,0,5), right = color(0,0,70); 
  private float factor;
  
  public ContrastSlider(float x, float y) {
    super(x, y, "Contrast");
  }
  
  public void display() {
    super.gradient2(left, right);
    super.display();
  }
  
  public void update() {
    float diff = this.getPosition() - w/2.0;
    factor = (259.0 * (diff + 255.0)) / (255.0 * (259.0 - diff));
  }
  
  public boolean drag() {
    update();
    return super.drag();
  }
  
  public color apply(color c) {
    colorMode(RGB, 256, 256, 256);
    return color(factor * (red(c) - 128) + 128, factor * (green(c) - 128) + 128, factor * (blue(c) - 128) + 128);
  }
  
}

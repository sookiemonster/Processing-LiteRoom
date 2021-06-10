public class SaturationSlider extends Slider { 
  
  private final color left = color(0, 0, 0), right = color(0, 100, 100); 
  private float satDiff;
  
  public SaturationSlider(float x, float y) {
    super(x, y, "Saturation");
  }
  
  public void display() {
    super.gradient2(left, right);
    super.display();
  }
  
  public void update() {
    satDiff = (this.getPosition() - 75.0);
  }
  
  public boolean drag() {
    update();
    return super.drag();
  }
  
  public color apply(color c) {
    colorMode(HSB, 360, 100, 100);
    if (satDiff > 0) {
      return color(hue(c), saturation(c) + satDiff * calcTolerance(saturation(c)), brightness(c));
    } else if (this.getPosition() == 0) {
      return color(hue(c), 0, brightness(c));
    }
    return color(hue(c), saturation(c) + satDiff, brightness(c));
  }
  
  private float calcTolerance(float s) {
    return s/100;
  }
  
}

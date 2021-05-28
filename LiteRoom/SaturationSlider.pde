public class SaturationSlider extends Slider { 
  
  private final color left = color(0, 0, 0), right = color(0, 100, 100); 
  private float satDiff;
  private float tolerance = 20;
  
  public SaturationSlider(float x, float y) {
    super(x, y, "Saturation");
  }
  
  public void display() {
    super.gradient2(left, right);
    super.display();
  }
  
  public boolean drag() {
    satDiff = this.getPosition() - 75.0;
    return super.drag();
  }
  
  public color apply(color c) {
    float l = lightness(red(c), green(c), blue(c));
    colorMode(HSB, 360, 100, 100);
    if (saturation(c) < tolerance && satDiff > 0) {
      return color(hue(c), saturation(c) + satDiff * (1 - (tolerance - saturation(c))/10.0), brightness(c));
    } else if (this.getPosition() == 0) {
      return color(hue(c), 0, brightness(c));
    }
    return color(hue(c), saturation(c) + satDiff, brightness(c));
  }
  
  
}

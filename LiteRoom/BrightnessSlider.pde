public class BrightnessSlider extends Slider {
  
  private final color left = color(0,0,5), right = color(0,0,70); 
  
  public BrightnessSlider(float x, float y) {
    super(x, y, "Brightness");
  }
  
  public void display() {
    super.gradient2(left, right);
    super.display();
  }
  
  private float adjustment() {
    return (this.getPosition() - (w / 2.0)) / (w / 4.0);
  }
  
  public color apply(color c) {
    colorMode(RGB, 256, 256, 256);
    float n = pow(2.0, adjustment());
    return color((int)(red(c) * n), (int)(green(c) * n), (int)(blue(c)* n));
  }
  
}

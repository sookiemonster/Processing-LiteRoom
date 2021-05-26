public class BrightnessSlider extends Slider {
  
  public BrightnessSlider(float x, float y) {
    super(x, y, "Brightness");
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

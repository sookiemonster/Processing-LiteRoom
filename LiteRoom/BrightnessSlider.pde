public class BrightnessSlider extends Slider {
  
  public BrightnessSlider(float x, float y) {
    super(x, y, "Brightness");
  }
  
  private int adjustment() {
    return this.getPosition() - 50;
  }
  
  public color apply(color c) {
    colorMode(HSB, 360, 100, 100);
    return color(hue(c), saturation(c), constrain(brightness(c) + this.adjustment(), 0, 100));
  }
  
}

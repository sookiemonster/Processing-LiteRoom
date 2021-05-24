public class TemperatureSlider extends Slider {
  
  public TemperatureSlider(float x, float y) {
    super(x, y, "Temperature");
  }
  
  private int adjustment() {
    return this.getPosition() - 75;
  }
  
  public color apply(color c) {
    colorMode(RGB, 256, 256, 256);
    return color(red(c), green(c), blue(c) + adjustment());
  }
  
}

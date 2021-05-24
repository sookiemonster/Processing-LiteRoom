public class TintSlider extends Slider {
  
  public TintSlider(float x, float y) {
    super(x, y, "Tint");
  }
  
  private int adjustment() {
    return this.getPosition() - 75;
  }
  
  public color apply(color c) {
    colorMode(RGB, 256, 256, 256);
    return color(red(c), green(c) + adjustment(), blue(c));
  }
  
}

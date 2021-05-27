public class TintSlider extends Slider {
  
  private final color left = color(287, 86, 100), right = color(120, 90, 100);
  private int tintDiff;
  
  public TintSlider(float x, float y) {
    super(x, y, "Tint");
  }
  
  public void display() {
    super.gradient3(left, right);
    super.display();
  }
  
  public boolean drag() {
    tintDiff = this.getPosition() - 75;
    return super.drag();
  }
  
  public color apply(color c) {
    colorMode(RGB, 256, 256, 256);
    return color(red(c), green(c) + tintDiff, blue(c));
  }
  
}

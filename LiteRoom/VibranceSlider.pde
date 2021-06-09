public class VibranceSlider extends Slider { 
  
  private final color left = color(0, 0, 0), right = color(0, 100, 100); 
  private float vibDiff;
  
  public VibranceSlider(float x, float y) {
    super(x, y, "Vibrance");
  }
  
  public void display() {
    super.gradient2(left, right);
    super.display();
  }
  
  public boolean drag() {
    vibDiff = (this.getPosition() - 75.0) / 4;
    return super.drag();
  }
  
  public color apply(color c) {
    colorMode(HSB, 360, 100, 100);
    return color(hue(c), saturation(c) + vibDiff * calcTolerance(c, saturation(c)), brightness(c));
  }
  
  private float calcTolerance(color c, float s) {
    return constrain((-1 * s) / 80 + 1, 0, 1) * lightnessTolerance(c);
  }
  
  private float lightnessTolerance(color c) {
    return 1 - lightness(red(c), green(c), blue(c));
  }
  
}

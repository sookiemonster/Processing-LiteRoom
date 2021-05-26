public class TemperatureSlider extends Slider { 
  
  private final color left = color(238, 90, 90), right = color(56, 90, 90); //<>//
  
  public TemperatureSlider(float x, float y) {
    super(x, y, "Temperature");
  }
  
  public void display() {
    super.gradient3(left, right);
    super.display();
  }
  
  private int adjustment() {
    return this.getPosition() - 75;
  }
  
  public color apply(color c) {
    colorMode(RGB, 256, 256, 256);
    return color(red(c), green(c), blue(c) + adjustment());
  }
  
}

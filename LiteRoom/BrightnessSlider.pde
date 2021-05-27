public class BrightnessSlider extends Slider {
  
  private final color left = color(0,0,5), right = color(0,0,70); 
  private float brightnessFactor;
  
  public BrightnessSlider(float x, float y) {
    super(x, y, "Brightness");
  }
  
  public void display() {
    super.gradient2(left, right);
    super.display();
  }
  
  private float adjustment() {
    return (this.getPosition() - (w / 2.0)) / (w / 3.0);
  }
  
  public void update() {
    brightnessFactor = pow(2.0, adjustment());
  }
  
  public boolean drag() {
    update();
    return super.drag();
  }
  
  public color apply(color c) {
    colorMode(RGB, 256, 256, 256);
    return color((int)(red(c) * brightnessFactor), (int)(green(c) * brightnessFactor), (int)(blue(c)* brightnessFactor));
  }
  
}

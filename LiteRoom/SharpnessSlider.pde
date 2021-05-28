public class SharpnessSlider extends Slider { 
  
  private final color left = color(0,0,5), right = color(0,0,70);
  private float sharpDiff;
  
  public SharpnessSlider(float x, float y) {
    super(x, y, "Sharpness");
  }
  
  public SharpnessSlider(float x, float y, int[] pInitial, int[] pBlur, int[] pSharp) {
    super(x, y, "Sharpness");

  }
  
  public void display() {
    super.gradient2(left, right);
    super.display();
  }
  
  public boolean drag() {
    sharpDiff = map(this.getPosition() - 75, -75, 75, -2, 2);
    return super.drag();
  }
  
  public float getDiff() {
    return sharpDiff;
  }
  
  public color apply(color c) {
    return c;
  }
}

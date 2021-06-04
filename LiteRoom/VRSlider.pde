public class VRSlider extends Slider {
  
  private final color left = color(0,0,5), right = color(0,0,70);
  private float diff;
  
  public VRSlider(float x, float y) {
    super(x,y, "Roundess");
  }
  
  public void display() {
    super.gradient2(left, right);
    super.display();
  }
  
  public boolean drag() {
    diff = map(this.getPosition(), 0, w, 0, 1);
    return super.drag();
  }
  
  public color apply(color c) {
    return c;
  }
  
  public float getRoundness() {
    return diff;
  }
}

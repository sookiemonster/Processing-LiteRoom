public class LightnessSlider extends Slider {
  
  private final color left = color(0,0,5), right = color(0,0,70);
  private final float margin = .1;
  private float lightnessFactor, minLight, maxLight;
  
  public LightnessSlider(float x, float y, String label, float minLight, float maxLight) {
    super(x, y, label);
    this.minLight = minLight;
    this.maxLight = maxLight;
  }
  
  public void display() {
    super.gradient2(left, right);
    super.display();
  }
  
  public boolean drag() {
    lightnessFactor = (this.getPosition() - 75.0) / (5 * w) + 1;
    return super.drag();
  }
  
  public color apply(color c) {
    colorMode(RGB, 256, 256, 256);
    float l = lightness(red(c), green(c), blue(c));
    
    if (minLight <= l && l <= maxLight) {
      return color(red(c) * lightnessFactor, green(c) * lightnessFactor, blue(c) * lightnessFactor);
    } else if (minLight - l <= margin && minLight - l >= 0) {
      return lerpColor(c, color(red(c) * lightnessFactor, green(c) * lightnessFactor, blue(c) * lightnessFactor),  calcMargin(minLight - l));
    } else if (l - maxLight <= margin && l - maxLight >= 0) {
      return lerpColor(c, color(red(c) * lightnessFactor, green(c) * lightnessFactor, blue(c) * lightnessFactor),  calcMargin(l - maxLight));
    }
    return c;
  }
  
  private float calcMargin(float n) {
    return (-1.0 / margin) * n + 1;
  }
  
}

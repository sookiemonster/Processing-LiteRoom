public class HueSlider extends Slider {
  
  private final color left;
  private final float margin = 10, range = 15, change = 75;
  private float hueDiff, minHue, maxHue;
  
  public HueSlider(float x, float y, float target) {
    super(x, y, "Hue");
    
    float tempMin = target - change;
    if (tempMin < 0) {
      tempMin = 360 - abs(tempMin);
    }
    this.left = color(tempMin, 100, 100);
    
    this.minHue = wrapColor(target - range);
    this.maxHue = (target + range) % 360;
  }
  
  public void display() {
    super.gradientWrap(left, 100);
    super.display();
  }
  
  public boolean drag() {
    hueDiff = map(this.getPosition() - 75.0, -75, 75, -1 * change, change);
    return super.drag();
  }
  
  public color apply(color c) {
    colorMode(HSB, 360, 100, 100);
    float h = hue(c);
    
    if (minHue < maxHue) {
      if (minHue <= h && h <= maxHue) {
        return color(wrapColor((h + hueDiff) % 360), saturation(c), brightness(c));
      }
    } else {
      if (minHue <= h || maxHue >= h) {
        return color(wrapColor((h + hueDiff) % 360), saturation(c), brightness(c));
      } else if (abs(h - minHue) <= margin) {
        return color(wrapColor((h + hueDiff * calcMargin(abs(h - minHue))) % 360), saturation(c), brightness(c));
      } else if (abs(maxHue - h) <= margin) {
        return color(wrapColor((h + hueDiff * calcMargin(abs(maxHue - h))) % 360), saturation(c), brightness(c));
      }
    }
    return c;
  }
  
  private float calcMargin(float n) {
    return (-1.0 / margin) * n + 1;
  }
  
  private float wrapColor(float n) {
    if (n > 360) {
      return (n - 360);
    } else if (n < 0) {
      return 360 + n;
    }
    return n;
  }
  
}

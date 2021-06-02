public class HueSlider extends Slider {
  
  private final color left;
  private final float margin = 50, range = 30, change = 75;
  private float hueDiff, minHue, maxHue;
  private boolean on;
  
  public HueSlider(float x, float y, float target, boolean on) {
    super(x, y, "Hue");
    this.on = on;
    
    float tempMin = target - change;
    if (tempMin < 0) {
      tempMin = 360 - abs(tempMin);
    }
    this.left = color(tempMin, 100, 100);
    
    this.minHue = wrapColor(target - range);
    this.maxHue = (target + range) % 360;
  }
  
  public void toggleOn() {
    on = !on;
  }
  
  public void setOn(boolean b) {
    this.on = b;
  }
  
  public void display() {
    if (on) {
      super.gradientWrap(left, 100);
      super.display();
    }
  }
  
  public boolean drag() {
    if (on) {
      hueDiff = map(this.getPosition() - 75.0, -75, 75, -1 * change, change);
      return super.drag();
    }
    return false;
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

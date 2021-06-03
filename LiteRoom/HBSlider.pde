public class HBSlider extends Slider {
  
  private final color left = color(0,0,0), right = color(0, 0, 100);
  private final float margin = 25, range = 30, change = 30;
  private float diff, minHue, maxHue;
  
  public HBSlider(float x, float y, float target, boolean on) {
    super(x, y, "Brightness");
    this.on = on;
    
    float tempMin = target - change;
    if (tempMin < 0) {
      tempMin = 360 - abs(tempMin);
    }
    
    this.minHue = wrapColor(target - range);
    this.maxHue = (target + range) % 360;
  }
  
  public void display() {
    if (on) {
      super.gradient2(left, right);
      super.display();
    }
  }
  
  public boolean drag() {
    if (on) {
      diff = (this.getPosition() - 75.0) / w;
      return super.drag();
    }
    return false;
  }
  
  public color apply(color c) {
    colorMode(HSB, 360, 100, 100);
    float h = hue(c);
    float s = saturation(c);
    colorMode(RGB, 256, 256, 256);
    
    if (minHue < maxHue) {
      if (minHue <= h && h <= maxHue) {
        return color(red(c) * brighten(s), green(c) * brighten(s), blue(c) * brighten(s));
      } 
      else if (abs(h - minHue) <= margin) {
        float tempMargin = brightenMargin(abs(h - minHue), s);
        return color(red(c) * tempMargin, green(c) * tempMargin, blue(c) * tempMargin);
      } else if (abs(maxHue - h) <= margin) {
        float tempMargin = brightenMargin(abs(maxHue - h), s);
        return color(red(c) * tempMargin, green(c) * tempMargin, blue(c) * tempMargin);
      } 
    } else {
      if (minHue <= h || maxHue >= h) {
       return color(red(c) * brighten(s), green(c) * brighten(s), blue(c) * brighten(s));
      } 
      else if (abs(h - minHue) <= margin) {
        float tempMargin = brightenMargin(abs(h - minHue), s);
        return color(red(c) * tempMargin, green(c) * tempMargin, blue(c) * tempMargin);
      } else if (abs(maxHue - h) <= margin) {
        float tempMargin = brightenMargin(abs(maxHue - h), s);
        return color(red(c) * tempMargin, green(c) * tempMargin, blue(c) * tempMargin);
      } 
    }
    return c;
  }
  
  private float calcMargin(float hDiff) {
    return (-1.0 / margin) * hDiff + 1;
  }
  
  private float brighten(float s) {
    return (calcTolerance(s) * diff) + 1;
  }
  
  private float brightenMargin(float hDiff, float s) {
    return (calcTolerance(s) * diff * calcMargin(hDiff)) + 1;
  }
  
  private float calcTolerance(float s) {
    return s/100;
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

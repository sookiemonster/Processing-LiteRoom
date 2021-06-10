public class HSSlider extends Slider {
  
  private final color left, right;
  private final float margin = 20, range = 30, change = 30;
  private float satDiff, minHue, maxHue;
  
  public HSSlider(float x, float y, float target, boolean on) {
    super(x, y, "Saturation");
    this.on = on;
    this.left = color(target, 10, 10);
    this.right = color(target, 99, 99);
    
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
  
  public void update() {
    satDiff = this.getPosition() - 75.0;
  }
  
  public boolean drag() {
    if (on) {
      update();
      return super.drag();
    }
    return false;
  }
  
  public color apply(color c) {
    colorMode(HSB, 360, 100, 100);
    float h = hue(c);
    
    if (minHue < maxHue) {
      if (minHue <= h && h <= maxHue) {
        return color(h, saturation(c) + satDiff * calcTolerance(saturation(c)), brightness(c));
      } else if (abs(h - minHue) <= margin) {
        return color(h, saturation(c) + (satDiff * calcMargin(abs(h - minHue))) * calcTolerance(saturation(c)), brightness(c));
      } else if (abs(maxHue - h) <= margin) {
        return color(h, saturation(c) + (satDiff * calcMargin(abs(maxHue - h))) * calcTolerance(saturation(c)), brightness(c));
      } 
    } else {
      if (minHue <= h || maxHue >= h) {
        return color(h, saturation(c) + satDiff * calcTolerance(saturation(c)), brightness(c));
      } else if (abs(h - minHue) <= margin) {
        return color(h, saturation(c) + (satDiff * calcMargin(abs(h - minHue))) * calcTolerance(saturation(c)), brightness(c));
      } else if (abs(maxHue - h) <= margin) {
        return color(h, saturation(c) + (satDiff * calcMargin(abs(maxHue - h))) * calcTolerance(saturation(c)), brightness(c));
      } 
    }
    return c;
  }
  
  private float calcTolerance(float s) {
    return s/100;
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

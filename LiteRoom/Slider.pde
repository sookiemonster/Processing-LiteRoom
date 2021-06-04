public abstract class Slider implements Interactable {
  
  protected final color primary = color(0, 0, 100);
  protected final int w = 150, h = 5, 
      handleWidth = 6, handleHeight = 9,
      padding = 14;
  private int position;
  protected float x, y;
  private String label;
  private boolean pressed, hovering;
  protected boolean on = true;
  
  public Slider(float x, float y, String s) {
    this.x = x;
    this.y = y;
    this.label = s;
    position = w / 2;
  }
  
  public void setX(float n) {
    this.x = n;
  }
  
  public void setY(float n) {
    this.y = n;
  }
  
  public void display() {
    rectMode(CORNER);
    outline();
    handle();
    label();
  }
  
  public void outline() {
    rectMode(CORNER);
    stroke(0);
    noFill();
    rect(x, y, w, h);
  }
  
  private void gradient2(color c1, color c2) {
    for (float i = 0; i < w; i++) {
      color temp = lerpColor(c1, c2, (i / w));
      stroke(hue(temp), saturation(temp), brightness(temp));
      line(x + i, y, x + i, y + h);
    }
  }
  
  private void gradient3(color c1, color c2) {
    color mid1 = color(hue(c1), 1, brightness(c1));
    color mid2 = color(hue(c2), 1, brightness(c2));
    for (float i = 0; i < w; i++) {
      color temp;
      if (i < w/2) {
        temp = lerpColor(c1, mid1, (i / w) * 2);
      } else {
        temp = lerpColor(mid2, c2, ((i-w/2) / w) * 2);
      }
      stroke(hue(temp), saturation(temp), brightness(temp));
      line(x + i, y, x + i, y + h);
    }
  }
  
  private void gradientWrap(color c1, float diff) {
    colorMode(HSB, 360, 100, 100);
    float tempHue = hue(c1);
    for (float i = 0; i < w; i++) {
      color temp;
      temp = color(tempHue % 360, 100, 100);
      stroke(hue(temp), saturation(temp), brightness(temp));
      line(x + i, y, x + i, y + h);
      tempHue += diff / w;
    }
  }
  
  public void handle() {
    stroke(0);
    if (pressed) {
      fill(0, 0, 40);
    } else if (hovering) {
      fill (0, 0, 60);
    } else {
      fill(0, 0, 80);
    }
    triangle(x + position - handleWidth, y + handleHeight, x + position, y, x + position + handleWidth, y + handleHeight);
  }
    
  public void label() {
    fill(primary);
    textSize(12);
    textAlign(RIGHT, CENTER);
    text(label, x - padding, y);
  }
  
  public boolean drag() {
    if (inRect(mouseX, mouseY, x, y, x + w, y + h + 3) || pressed) {
      if (mousePressed) {
        position = (int)constrain((mouseX - x), 0, w);
        pressed = true;
        return true;
      } else if (!pressed) {
        hovering = true;
      }
    } else {
      hovering = false;
    }
    return false;
  }
   
  public void clearMouse() {
    pressed = false;
    hovering = false;
  }
  
  public boolean inRect(float px, float py, float x1, float y1, float x2, float y2) {
    return (px >= x1 && py >= y1 && px <= x2 && py <= y2);
  }
  
  public int getPosition() {
    return position;
  }
  
  public boolean isPressed() {
    return pressed;
  }
  
  // 0 <= s <= 1
  // 0 <= l <= 1
  public color toRGB(float h, float s, float l) {
    if (s == 0) {
      return color(l * 255, l * 255, l * 255);
    } else {
      float temp1, temp2, nH, nR, nG, nB;
      if (l < .5) {
        temp1 = l * (1 + s);
      } else {
        temp1 = l + s - (l * s);
      }
      temp2 = (2 * l) - temp1;
      nH = h / 360;
      nR = nH + .333;
      nG = nH;
      nB = nH - .333;
      if (nR > 1) {
        nR -= 1;
      }
      if (nB < 0) {
        nB += 1;
      }
      return color(convertChannel(nR, temp1, temp2) * 255, convertChannel(nG, temp1, temp2) * 255, convertChannel(nB, temp1, temp2) * 255);
    }
  }
  
  private float convertChannel(float channel, float temp1, float temp2) {
    if (6 * channel < 1) {
      return temp2 + (temp1 - temp2) * 6 * channel;
    } else if (2 * channel < 1) {
      return temp1;
    } else if (3 * channel < 2) {
      return temp2 + (temp1 - temp2) * (.666 - channel) * 6;
    } else {
      return temp2;
    }
  }
  
  public float lightness(float r, float g, float b) {
    float nR = r / 255;
    float nG = g / 255;
    float nB = b / 255;
    float x = (Math.round(((max(nR, nG, nB) + min(nR, nG, nB)) / 2.0) * 10));
    x = x/10;
    return x; 
  }
  
  public float getHeight() {
    return this.h + 2;
  }
  
  public boolean isChanged() {
    return getPosition() != w / 2;
  }
  
  public void clear() {
    this.position = w / 2;
  }
  
  public void toggleOn() {
    on = !on;
  }
  
  public void setOn(boolean b) {
    this.on = b;
  }
  
  public abstract color apply(color c);
  
  //public abstract color apply(color c, float weight);
}

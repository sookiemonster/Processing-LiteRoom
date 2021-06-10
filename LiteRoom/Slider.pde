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
  
  public boolean onSlider(float pX, float pY) {
    return inRect(pX, pY, x, y, x + w, y + h + 3);
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
  

  public float lightness(float r, float g, float b) {
    float nR = r / 255;
    float nG = g / 255;
    float nB = b / 255;
    return (max(nR, nG, nB) + min(nR, nG, nB)) / 2.0; 
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
  
  public abstract void update();
  
}

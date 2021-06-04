public class WindowObject extends Window {
  
  protected float w, h, x, y;
  private String label;
  private final int textSize = 19;
  
  // Define the x, y, and height of the element. Width is predetermined by padding & the width of the sidebars.
  public WindowObject(float x, float y, float h) {
    w = sideBarWidth - (2 * padding);
    this.x = x;
    this.y = y;
    this.h = h;
  }
  
  public WindowObject(float x, float y, float h, String label) {
    w = sideBarWidth - (2 * padding);
    this.x = x;
    this.y = y;
    this.h = h;
    this.label = label;
  }
  
  public void display() {
    if (label != null) {
      displayLabel();
      rectMode(CORNER);
      fill(secondary);
      stroke(0);
      rect(x, y + textSize + padding, w, h);
    } else {
      rectMode(CORNER);
      fill(secondary);
      stroke(0);
      rect(x, y, w, h);
    }
  }
  
  public void displayLabel() {
    fill(tertiary);
    textAlign(RIGHT, CENTER);
    textSize(textSize);
    text(label, x + w - (padding * 2), y + padding / 2);
  }
   
  public float getHeight() {
    if (label != null) {
      return h + textSize + padding;
    }
    return h;
  }
  
  public void setHeight(float h) {
    this.h = h;
  }
  
  public float getX() {
    return x;
  }
  
  public float getY() {
    return y;
  }
  
  public float getInteriorY() {
    if (label != null) {
      return y + 5 * padding;
    }
    return y;
  }
  
  public void addY(float n) {
    y += n;
  }
  
  public void setX(float n) {
    x = n;
  }
  
  public void setY(float n) {
    y = n;
  }
  
  public boolean inRect(float px, float py, float x1, float y1, float x2, float y2) {
    return (px >= x1 && py >= y1 && px <= x2 && py <= y2);
  }
}

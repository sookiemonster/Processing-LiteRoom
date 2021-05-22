public class WindowObject extends Window {
  
  protected float w, h, x, y;
  
  // Define the x, y, and height of the element. Width is predetermined by padding & the width of the sidebars.
  public WindowObject(float x, float y, float h) {
    w = sideBarWidth - (2 * padding);
    this.x = x;
    this.y = y;
    this.h = h;
  }
  
  public void display() { 
    rectMode(CORNER);
    fill(secondary);
    noStroke();
    rect(x, y, w, h);
  }
   
  public float getHeight() {
    return h;
  }
  
  public float getX() {
    return x;
  }
  
  public float getY() {
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
}

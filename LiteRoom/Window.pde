public class Window {
  
  // Define colors used within the window and child elements
  protected final color primary = color(0, 0, 17), secondary = color(0, 0, 40), tertiary = color(0, 0, 60);
  protected final float sideBarWidth = 288, padding = 10;
  protected float frameHeight, frameWidth;
  
  
  public Window() {
    frameHeight = height * .9;
    frameWidth = width - (2 * sideBarWidth);
  }
  
  public void display() {
    background(primary);
    rectMode(CORNERS);
    noStroke();
    fill(tertiary);
    rect(sideBarWidth, 0, width - sideBarWidth, height);
  }
  
  public void updateSize() {
    frameHeight = height * .9;
    frameWidth = width - (2 * sideBarWidth);
  }
  
  public float getWidth() {
    return frameWidth;
  }
  
  public float getHeight() {
    return frameHeight;
  }
  
  public float getPadding() {
    return padding;
  }
  
  public float getSideBarWidth() {
    return sideBarWidth;
  }
}

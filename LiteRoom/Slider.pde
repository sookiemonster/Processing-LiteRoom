abstract class Slider implements Interactable {
  
  protected final color primary = color(0, 0, 100);
  private final int w = 150, h = 5, 
      roundness = 4, 
      handleWidth = 6, handleHeight = 9,
      padding = 14;
  private int position;
  private float x, y;
  private String label;
  private boolean pressed, hovering;
  
  public Slider(float x, float y, String s) {
    this.x = x;
    this.y = y;
    this.label = s;
    position = w / 2;
  }
  
  public void display() {
    rectMode(CORNER);
    stroke(0,0,20);
    fill(0, 0, 60);
    rect(x, y, w, h, roundness);
    handle();
    label();
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
  
  public int getValue() {
    return position;
  }
  
  public boolean isPressed() {
    return pressed;
  }
  
  public void apply(PImage src, float x, float y) {
    
  }
}

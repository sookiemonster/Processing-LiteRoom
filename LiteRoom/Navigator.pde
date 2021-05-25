public class Navigator implements Interactable {
  protected final color primary = color(0, 0, 20);
  private final int w = 268, h = 30, 
      padding = 10;
  private float x, y;
  private String label;
  private boolean pressed, hovering, loadedImg;
  
  public String title() {
    return label;
  }
  
  public boolean isHovering() {
    hovering = inRect(mouseX, mouseY, x, y, x + w, y + h + 3);
    return hovering;
  } //<>//
  
  public boolean isPressed() {
    return pressed;
  }
  
  public Navigator(float x, float y, String s) {
    this.x = x;
    this.y = padding+y;
    this.label = s;
  }
  
  public void display() {
    rectMode(CORNER);
    stroke(0,0,20);
    fill(0, 0, 40);
    handle();
    rect(x, y, w, h);
    label();
  }
 
  
  public void handle() {
    stroke(0);
    if (isHovering() && mousePressed == true) {
      pressed = true;
      fill(0, 0, 40);
      if (title().equals("Load Image") && loadedImg == false) {
        selectInput("Select a file to process: ", "fileSelected");
        clearMouse();
        return;
      }
    } else if (isHovering() && mousePressed == false) {
      pressed = false;
      fill(0, 0, 60);
    } else {
      clearMouse();
      fill(0, 0, 80);
    }
  }

  void fileSelected(File selection) {
    if (selection == null) {
      println("Window was closed or the user hit cancel.");
      loadedImg = false;
    } else {
      println("User selected " + selection.getAbsolutePath());
    }
  }
   
  public void clearMouse() {
    pressed = false;
    hovering = false;
  }
  
  public boolean inRect(float px, float py, float x1, float y1, float x2, float y2) {
    return (px >= x1 && py >= y1 && px <= x2 && py <= y2);
  }
  
  public void label() {
    fill(primary);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(label, x+(w/2), y+(h/2));
  }
}

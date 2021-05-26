public class Navigator implements Interactable {
  protected final color primary = color(0, 0, 20);
  private final int w = 268, h = 30, padding = 10;
  private int saveCount = 0;
  private float x, y;
  private String label;
  private boolean pressed, hovering;
  private boolean hasImage = false; //<>//
  private boolean error1 = false;
  private boolean error2 = false;
  private PImage currentImage; 
  
  private int incSave() {
    return saveCount++;
  } 
  
  public String title() {
    return label;
  }
  
  public boolean isHovering() {
    hovering = inRect(mouseX, mouseY, x, y, x + w, y + h + 3);
    return hovering;
  } 
  
  public boolean isPressed() {
    return pressed;
  }
  
  public Navigator(float x, float y, String s, PImage picture) {
    this.x = x;
    this.y = padding+y;
    this.label = s;
    currentImage = picture;
  }
  
  public Navigator(PImage img) {
    currentImage = img;
  }
  
  public void display() {
    rectMode(CORNER);
    stroke(0,0,20);
    fill(0, 0, 40);
    handle();
    rect(x, y, w, h);
    label();
    if (currentImage != null && title().equals("Load Image") && (isHovering() || isPressed())) {
      error1 = true;
      errorMsg();
    } else if (currentImage == null && title().equals("Save Image") && (isHovering() || isPressed())) {
      error2 = true;
      errorMsg();
    } else {
      error1 = false;
      error2 = false;
    }
  }

  public void handle() {
    stroke(0);
    if (isHovering() && mousePressed == true) {
      pressed = true;
      fill(0, 0, 40);
    } else if (isHovering() && mousePressed == false) {
      pressed = false;
      fill(0, 0, 60);
    } else {
      clearMouse();
      fill(0, 0, 80);
    }
  }
  
  public boolean imgPresent() {
    return hasImage;
  }
  
  public void storeImage(PImage img) {
    currentImage = img;
  }
  
  public void buttonFunction(String s, PImage img) {
    if (s.equals("Load Image")) {
      selectImage(img);
    } else if (s.equals("Save Image")) {
      saveImage(img);
    }
    clearMouse();
  }
  
  public void selectImage(PImage img) {
    if (img == null) {
      selectInput("Select an image file: ", "fileSelected");
      error1 = false;
    }
  }
  
  public void saveImage(PImage image) {
    if (image != null) {
      int newX = (1344 - img.width)/2;
      int newY = (1080 - img.height)/2;
      PImage temp = get(288 + newX, 0 + newY, image.width, image.height);
      temp.save("image" + incSave() +".png");
    }
  }

  public void clearMouse() {
    pressed = false;
    hovering = false;
  }
  
  public boolean inRect(float px, float py, float x1, float y1, float x2, float y2) {
    return (px >= x1 && py >= y1 && px <= x2 && py <= y2);
  }
  
  public void errorMsg() {
    if (error1) {
      fill(0,90,120);
      textSize(18);
      textAlign(CENTER, CENTER);
      text("Canvas must be empty.", x+(w/2), y-h/2-6);
    } else if (error2) {
      fill(0,90,120);
      textSize(18);
      textAlign(CENTER, CENTER);
      text("Can't save without an image.", x+(w/2), y-(2*h));
    }
  }
  
  public void label() {
    fill(primary);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(label, x+(w/2), y+(h/2));
  }
  
  public boolean drag() {
    return false;
  }
}

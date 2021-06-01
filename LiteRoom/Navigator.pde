public class Navigator implements Interactable { //<>// //<>// //<>//
  protected final color primary = color(0, 0, 20);
  private float w = 268, h = 30, padding = 10;
  private int saveCount = 0;
  private float x, y, mouseXCor, mouseYCor, c1, c2, c3, c4, cx1, cx2, cy1, cy2;
  private int resizeW, resizeH;
  private int adsf = 0;
  private String label;
  private boolean pressed, hovering, drawZoom, zoomQ;
  private boolean hasImage = false;
  private boolean zooming = false;
  private boolean toggleZoom = false;
  private boolean error1 = false;
  private boolean error2 = false;
  private PImage currentImage, zoomImage, tempZoom, edit; 
  
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
  
  public void addEditImage(PImage img) {
    edit = img;
  }
  
  public void setImage(PImage img) {
    currentImage = img;
    hasImage = true;
  }
  
  public void setZoom(PImage img, float x, float y, int resizeW, int resizeH, boolean continueZoom) {
    zoomQ = continueZoom;
    if (continueZoom) {
      zoomImage = img;
      this.resizeW = resizeW;
      this.resizeH = resizeH;
      cx1 = x;
      cx2 = x + zoomImage.width;
      cy1 = y;
      cy2 = y + zoomImage.height;
      zoomX = zoomImage.width / 2;
      zoomY = zoomImage.height / 2;
    } else {
      drawZoom = false;
    }

  }
  
  public Navigator(float x, float y, String s, PImage picture) {
    this.x = x;
    this.y = padding+y;
    this.label = s;
    currentImage = picture;
  }
  
  public Navigator(float x, float y, String s) {
    this.x = x;
    this.y = padding+y;
    this.label = s;
  }
  
  public Navigator(float x, float y, float w, float h, String s) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = s;
  }
  
  public void newZoom(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public boolean returnZoom() {
    return drawZoom;
  }
  
  public void display() {
    rectMode(CORNER);
    stroke(0,0,20);
    fill(0, 0, 40);
    handle();
    drawZoom();
    noStroke();
    if (zoomQ == false && zoomImage != null && title().equals("Zoom Box") && isHovering()) {
      drawZoom = true;
    } 
     adsf = adsf + 1;
    if (zooming == true && zoomImage != null) {
      if (drawZoom) {
        fill(0, 0, 40, 61);
        drawZoomBox();
        tempZoom = zoomImage.get((int)(mouseXCor-cx1),(int)(mouseYCor-cy1),(int)zoomX,(int)zoomY);
        tempZoom.resize(resizeW, resizeH);
        image(tempZoom, canvasX(), canvasY());
      } else {
        image(edit, canvasX(), canvasY());
      }

    }
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
  
  public void drawZoom() {
    if (title().equals("Zoom Box")) {
      noStroke();
      fill(255, 0, 0, 0);
      rect(x, y, w, h);
    } else {
      rect(x, y, w, h);
      label();
    }
    if (currentImage != null) {
      if (zoomImage != null && title().equals("Zoom Box") && !isHovering()) {
        if (zooming == false) {
          fill(120, 0, 0, 121);  
          float smallerX = x + (zoomImage.width/4);
          float smallerY = y + (zoomImage.height/4);
          c1 = smallerX;
          c2 = smallerX + zoomImage.width/2;
          c3 = smallerY;
          c4 = smallerY + zoomImage.height/2;
          rect(smallerX, smallerY, zoomX, zoomY);
        }  
      } else if (zoomImage != null && title().equals("Zoom Box") && isHovering()) {
         c1 = mouseX - zoomX/2;
         c2 = mouseX + zoomX/2;
         c3 = mouseY - zoomY/2;
         c4 = mouseY + zoomY/2;
         if (rectInRect(c1,cx1,c2,cx2,c3,cy1,c4,cy2)) {
           if (mousePressed && toggleZoom == false) {
            toggleZoom = true;
            mouseXCor = mouseX - (zoomImage.width/4);
            mouseYCor = mouseY - (zoomImage.height/4);
            zooming = true;
            drawZoom = true;
           } else if (mousePressed && toggleZoom) {
            mouseXCor = mouseX - (zoomImage.width/4);
            mouseYCor = mouseY - (zoomImage.height/4);
            drawZoom = true;
           } else if (mousePressed == false && toggleZoom == false) {
            if (zooming == false) {
              fill(120, 0, 0, 121);     
            } else {
              fill(255, 0, 0, 0);
            }
            rect(mouseX - (zoomX/2), mouseY - (zoomY/2), zoomX, zoomY);  
           } else if (mousePressed == false && toggleZoom) {
            fill(120, 0, 0, 121);
            rect(mouseX - (zoomX/2), mouseY - (zoomY/2), zoomX, zoomY);  
          }
         }

      }
    }
  }
  
  public boolean doWeDraw() {
    return drawZoom;
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
  
  public void zoomBox() {
    if (imgPresent() == true) {
      return;
    }
  }
  
  public void drawZoomBox() {
    rect(mouseXCor, mouseYCor, zoomX, zoomY);
  }
  
  public boolean imgPresent() {
    return hasImage;
  }
  
  public void storeImage(PImage img) {
    currentImage = img;
    hasImage = true;
  }
  
  public void buttonFunction(String s, PImage img) {
    if (s.equals("Load Image")) {
      selectImage(img);
    } else if (s.equals("Save Image")) {
      saveImage(img);
    } else if (s.equals("Clear Image")) {
      zooming = false;
      toggleZoom = false;
    } else if (s.equals("Reset Zoom")) {
      //zooming = false;
      //toggleZoom = false;
    }
    clearMouse();
  }
  
  public void clear() {
    currentImage = null;
    zoomImage = null;
    tempZoom = null;
  }
  
  public void selectImage(PImage img) {
    if (img == null) {
      selectInput("Select an image file: ", "fileSelected");
      error1 = false;
    }
  }
  
  public void saveImage(PImage image) {
    if (currentImage != null) {
      int newX = (1344 - img.width)/2;
      int newY = (1054 - img.height)/2;
      PImage temp = get(288 + newX, 0 + newY, image.width, image.height);
      temp.save("image" + incSave() +".png");
    }
  }

  public void clearMouse() {
    pressed = false;
    hovering = false;
  }
  
  public boolean rectInRect(float c1, float cx1, float c2, float cx2, float c3, float cy1, float c4, float cy2){
    return (c1 >= cx1 && c2 <= cx2 && c3 >= cy1 && c4 <= cy2);
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
  
  public float canvasX() {
    xCor = 288 + ((1344 - img.width)/2);
    return xCor;
  }
  
  public float canvasY() {
    yCor = (1054 - img.height)/2;
    return yCor;
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

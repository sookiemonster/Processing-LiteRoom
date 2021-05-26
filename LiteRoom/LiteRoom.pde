import java.util.*;

Window frame; //Setup the window
PImage currentImage, edit;
ArrayList<WindowObject> left = new ArrayList<WindowObject>(2);
ArrayList<WindowObject> right = new ArrayList<WindowObject>(8);
ArrayList<Interactable> elements = new ArrayList<Interactable>(2);
ArrayList<Slider> adjustments = new ArrayList<Slider>(2);
Interactable selectedElement;
boolean selected = false;
boolean doOnce = false;
Display preview, editPreview;

void setup() {
  size(1920, 1080);
  colorMode(HSB, 360, 100, 100); // Set the color mode to Hue (360 degrees), Saturation (0-100), Brightness (0-100)
  surface.setTitle("LiteRoom"); // Set the title of the window to "Processing Room"
  frame = new Window(); 
  
  elements.add(new Navigator(frame.getPadding(), 966, "Load Image", currentImage));
  elements.add(new Navigator(frame.getPadding(), 1005, "Save Image", currentImage));
  
  setupLeft();
  setupRight();
  spaceWindowObjects();
  
  
  elements.add(new BrightnessSlider(right.get(1).getX() + 100, right.get(1).getY() + 50));
  adjustments.add((Slider)elements.get(2));
  
  elements.add(new TemperatureSlider(right.get(1).getX() + 100, right.get(1).getY() + 80)); 
  adjustments.add((Slider)elements.get(3));
  
  elements.add(new TintSlider(right.get(1).getX() + 100, right.get(1).getY() + 110)); 
  adjustments.add((Slider)elements.get(4));

}

void draw() {
  frame.updateSize();
  frame.display();           
  drawWindowObjects();
  drawElements();
  if (currentImage != null) {
    edit = currentImage.copy();
    adjust();
    editPreview = new Display(edit);
  }
}


// Create Window Objects on the left side
void setupLeft() {
  float padding = frame.getPadding();
  left.add(new WindowObject(padding, padding, 200));
  left.add(new WindowObject(padding, 0, 100));
  left.add(new WindowObject(padding, 0, 100));
}

// Create Window Objects on the right side
void setupRight() {
  float rightX = frame.getSideBarWidth() + frame.getWidth() + frame.getPadding();
  right.add(new WindowObject(rightX, frame.getPadding(), 200, "Histogram"));
  right.add(new WindowObject(rightX, 0, 500, "Adjustments"));
  right.add(new WindowObject(rightX, 0, 100));
}

// Move Window Objects in relation to each other (subsequent objects are padding px below each other)
void spaceWindowObjects() {
  for (int i = 1; i < left.size(); i++) {
    left.get(i).setY(left.get(i - 1).getY() + left.get(i - 1).getHeight() + frame.getPadding());
  }
  for (int i = 1; i < right.size(); i++) {
    right.get(i).setY(right.get(i - 1).getY() + right.get(i - 1).getHeight() + frame.getPadding());
  }
}

// Displays the Window Objects
void drawWindowObjects() {
  for (WindowObject w : left) {
    w.display();
  }
  float rightX = frame.getSideBarWidth() + frame.getWidth() + frame.getPadding(); 
  for (WindowObject w : right) {
    if (w.getX() != rightX) { // If the window is resized & the right elements aren't in the right position, move them
      w.setX(rightX);
    }
    w.display();
  }
  if (currentImage != null) {
    if ((currentImage.height > 1080) || (currentImage.width > 1920-288-288)) {
      currentImage = preview.resize(currentImage);
    } 
    if (edit != null) {
      editPreview.display();
    } else {
      preview.display();
    }
  }
}

// What happens during file selection
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    String filename = "" + selection;
    if (filename.indexOf(".gif") != -1 || filename.indexOf(".jpg") != -1 || filename.indexOf(".tga") != -1 || filename.indexOf(".png") != -1) {
      preview = new Display(filename);
      currentImage = loadImage(filename);
    }
  }
}

// Draws all elements. If an element is being dragged, no other elements will be dragged.
void drawElements() {
  if (selectedElement != null) {
    selectedElement.drag();
  }
  for (Interactable n : elements) {
    if (n instanceof Navigator) {
      if (currentImage != null && ((Navigator)n).imgPresent() == false) {
        ((Navigator)n).storeImage(currentImage);
      }
      if (n.isPressed() && doOnce == false) { //<>//
        ((Navigator)n).buttonFunction(((Navigator)n).title(), currentImage);
        doOnce = true;
      } //<>// //<>//
    }
   if (selectedElement == null && n.drag()) {
      selectedElement = n;
    }
  n.display(); 
  }  
}
 //<>//
void mouseReleased() {
  for (Interactable n : elements) {
    n.clearMouse();
  }
  selectedElement = null;
  doOnce = false;
}

void adjust() {
  for (int i = 0; i < edit.width; i++) {
    for (int j = 0; j < edit.height; j++) {
      for (Slider n : adjustments) {
        edit.set(i, j, n.apply(edit.get(i,j)));
        colorMode(HSB, 360, 100, 100);
      }
    }
  }
}

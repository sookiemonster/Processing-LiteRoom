import java.util.*;

Window frame; //Setup the window
ArrayList<WindowObject> left = new ArrayList<WindowObject>(2);
ArrayList<WindowObject> right = new ArrayList<WindowObject>(8);
ArrayList<Interactable> elements = new ArrayList<Interactable>(2);
boolean selected = false;
//Slider selectedElement;

void setup() {
  size(1920, 1080);
  colorMode(HSB, 360, 100, 100); // Set the color mode to Hue (360 degrees), Saturation (0-100), Brightness (0-100)
  surface.setTitle("LiteRoom"); // Set the title of the window to "Processing Room"
  frame = new Window(); 
  //elements.add(new Slider(100, 30, "Hue")); //Test purposes -- Working on Slider
  //elements.add(new Slider(100, 50, "Saturation")); //Test purposes -- Working on Slider
  elements.add(new Navigator(frame.getPadding(), 966, "Load Image"));
  elements.add(new Navigator(frame.getPadding(), 1005, "Save Image"));
  setupLeft();
  setupRight();
  spaceWindowObjects();
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
}

void draw() {
  frame.updateSize();
  frame.display();           
  drawWindowObjects();
  drawElements();
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
  right.add(new WindowObject(rightX, frame.getPadding(), 200));
  right.add(new WindowObject(rightX, 0, 500));
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
}

// Draws all elements. If an element is being dragged, no other elements will be dragged.
void drawElements() {
  //if (selectedElement != null) {
  // selectedElement.drag();
  //}
  for (Interactable n : elements) {
    n.display();
    //selectInput("Select a file to process: ", "fileSelected");
  }
  //for (Slider n : elements) {
  //  if (!selected && n.drag()) {
  //    selected = true;
  //    selectedElement = n;
  //  }
  //  n.display();
  //}
}

void mouseReleased() {
  //for (Slider n : elements) {
  //  n.clearMouse();
  //}
 //selectedElement = null;
  //selected = false;
}

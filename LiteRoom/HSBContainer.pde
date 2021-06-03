public class HSBContainer extends WindowObject {
 
  public ArrayList<Slider[]> sliders = new ArrayList<Slider[]>();
  private int[] hues = new int[]{
    0,   // Reds
    30,  // Oranges
    60,  // Yellows
    120, // Greens
    180, // Aquas
    240, // Blues
    280, // Purples
    320  // Magentas
    };
  
  private final int boxWidth = 19, boxHeight = 8;
  private int selectedIndex = 0;
  
  public HSBContainer(float x, float y) {
    super(x, y, 150, "HSB Adjustments");
    for (int i : hues) {
      sliders.add(new Slider[]{new HueSlider(x + 100, this.getInteriorY() + boxHeight, i, false), 
        new HSSlider(x + 100, this.getInteriorY() + boxHeight + this.getHeight() + padding * 2, i, true),
        new HBSlider(x + 100, this.getInteriorY() + boxHeight + this.getHeight() * 2 + padding * 2, i, true)});
    }
    switchSelected();
  }
  
  public void display() {
    super.display();
    click();
    switchSelected();
    for (int i = 0; i < hues.length; i++) {
      if (i == selectedIndex) {
        fill(hues[i], 100, 100);
      } else {
        fill(hues[i], 50, 40);
      }
      stroke(0);
      rectMode(CORNER);
      rect(x + (i * (boxWidth + padding)) + padding * 2, this.getInteriorY(), boxWidth, boxHeight);
    }
  }
  
  public void setY(float n) {
    super.setY(n);
    updateSliderLocation();
  }
  
  private void updateSliderLocation() {
    for (Slider[] arr : sliders) {
      for (int i = 0; i < arr.length; i++) {
        arr[i].setY(this.getInteriorY() + boxHeight + (padding * 2.5) + (i * arr[i].getHeight() * 4));
      }
    }
  }
  
  public void click() {
    if (mousePressed) {
      for (int i = 0; i < hues.length; i++) {
        if (inRect(mouseX, mouseY, x + (i * (boxWidth + padding)) + padding * 2, this.getInteriorY(), x + (i * (boxWidth + padding)) + padding * 2 + boxWidth, this.getInteriorY() + boxHeight)) {
          selectedIndex = i;
          break;
        }
      }
    }
  }
  
  private boolean inRect(float px, float py, float x1, float y1, float x2, float y2) {
    return (px >= x1 && py >= y1 && px <= x2 && py <= y2);
  }
  
  private void switchSelected() {
    for (int i = 0; i < sliders.size(); i++) {
      for (Slider n : sliders.get(i)) {
        if (i == selectedIndex) {
          n.setOn(true);
        } else {
          n.setOn(false);
        }
      }
    }
  }
}

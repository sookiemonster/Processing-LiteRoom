public class Histogram {
  private HashMap<Float, Integer> histogram;
  private ArrayList<Float> value;
  private Integer[] count;
  private int maxCount = 0;
  
  public Histogram(HashMap<Float, Integer> map) {
    this.histogram = map;
  }
  
  public Histogram() {}
  
  public void display() {
    histoText();
    histoBox();
    if (histogram != null) {
      value = new ArrayList<Float>();
      count = new Integer[101];
      bars();
      histoBars();
    }
  }
  
  public void bars() {
    for (Float num : histogram.keySet()) {
      value.add(num);
    }
    Collections.sort(value);
    for (float v : value) {
      if (histogram.get(v) >= maxCount) {
        maxCount = histogram.get(v);
      }
      count[(int)(v*100)] = histogram.get(v);
    }
  }
  
  public void histoText() {
    fill(0,0,0);
    textSize(12);
    textAlign(LEFT, CENTER);
    text("Darkness", 1642+5, 230-2);
    fill(0,0,90);
    text("Lightness", 1642+203+5, 230-2);   
  }
  
  public void histoBox() {
    fill(0,0,15);
    noStroke();
    rect(1642+5, 44 ,259,176);
  }
  
  public void histoBars() {
    color strokeColor = color(0,0,80);
    stroke(strokeColor);
    float xPos = 259;
    xPos = xPos / 101;
    float yPos = 176;
    fill(0,0,80);
    for (int i = 0; i <= 100; i++) {
      try {
         float diff = (maxCount - count[i]);
         diff = diff / maxCount;
         rect(1647 + (xPos * i), 44 + (yPos * diff), xPos, yPos - (176 * diff));
      } catch (IndexOutOfBoundsException e) {
         //rect(1647 + (xPos * i), 44 + (yPos), xPos, 0, 0);
      } catch (NullPointerException e) {
         //rect(1647 + (xPos * i), 44 + (yPos), xPos, 0, 0);
      }
    }
  }
  
  public void clear() {
    histogram = null;
    value = null;
    count = null;
  }
  
}

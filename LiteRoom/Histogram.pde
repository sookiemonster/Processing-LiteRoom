public class Histogram {
  private HashMap<Float, Integer> histogram;
  private ArrayList<Float> value;
  private ArrayList<Integer> count;
  private int totalPixels;
  
  public Histogram(HashMap<Float, Integer> map, int pixelCount) {
    this.histogram = map;
    totalPixels = pixelCount;
  }
  
  public Histogram() {}
  
  public void display() {
    histoText();
    histoBox();
    if (histogram != null) {
      value = new ArrayList<Float>();
      count = new ArrayList<Integer>();
      bars();
      histoBars();
    }
  }
  
  public void bars() {
    for (Float num : histogram.keySet()) {
      value.add(num);
      count.add(histogram.get(num));
    }
    Collections.sort(value);
    Collections.sort(count);
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
    int max = Collections.max(count);
    float xPos = 259;
    xPos = xPos /value.size();
    float yPos = 176;
    fill(0,0,80);
    for (int i = 0; i < value.size(); i++) {
      float diff = (max - count.get(i));
      diff = diff / max;
      rect(1647 + (xPos * i), 44 + (yPos * diff), xPos, yPos - (176 * diff));
    }
  }
  
  public void clear() {
    histogram = null;
    value = null;
    count = null;
  }
  
}

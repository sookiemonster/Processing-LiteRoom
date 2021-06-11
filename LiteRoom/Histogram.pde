public class Histogram {
  private HashMap<Float, Integer> histogram, red, blue, green;
  private ArrayList<Float> value, rValue, bValue, gValue;
  private Integer[] count, rCount, bCount, gCount;
  private int maxCount = 0, rMax = 0, bMax, gMax;
  
  public Histogram(HashMap<Float, Integer> map, HashMap<Float, Integer> redMap, HashMap<Float, Integer> blueMap, HashMap<Float, Integer> greenMap) {
    if (map != null || red != null || blue != null || green != null) {
      this.clear();
    }
    this.histogram = map;
    this.red = redMap;
    this.blue = blueMap;
    this.green = greenMap;
  }
  
  public Histogram() {}
  
  public void display() {
    histoText();
    histoBox();
    if (histogram != null) {
      value = new ArrayList<Float>();
      rValue = new ArrayList<Float>();
      bValue = new ArrayList<Float>();
      gValue = new ArrayList<Float>();
      count = new Integer[101];
      rCount = new Integer[101];
      bCount = new Integer[101];
      gCount = new Integer[101];
      bars();
      histoBars();
    }
  }
  
  public void bars() {
    for (Float num : histogram.keySet()) {
      value.add(num);
    }
    for (float r : red.keySet()) {
      rValue.add(r);
    }
    for (float b : blue.keySet()) {
      bValue.add(b);
    }
    for (float g : green.keySet()) {
      gValue.add(g);
    }
    Collections.sort(value);
    Collections.sort(rValue);
    Collections.sort(bValue);
    Collections.sort(gValue);
    for (float v : value) {
      if (this.histogram.get(v) >= maxCount) {
        maxCount = histogram.get(v);
      }
      count[(int)(v*100)] = histogram.get(v);
    }
    for (float r : rValue) {
      if (this.red.get(r) >= rMax) {
        rMax = this.red.get(r);
      }
      rCount[(int)(r*100)] = this.red.get(r);
    }
    for (float b : bValue) {
      if (this.blue.get(b) >= bMax) {
        bMax = this.blue.get(b);
      }
      bCount[(int)(b*100)] = this.blue.get(b);
    }
    for (float g : gValue) {
      if (this.green.get(g) >= gMax) {
        gMax = this.green.get(g);
      }
      gCount[(int)(g*100)] = this.green.get(g);
    }
  }
  
  public void histoText() {
    fill(0,0,0);
    textSize(12);
    textAlign(LEFT, CENTER);
    text("Blacks", 1642+5, 230-2);
    fill(0,0,90);
    text("Highlights", 1642+203, 230-2);   
  }
  
  public void histoBox() {
    fill(0,0,15);
    noStroke();
    rect(1642+5, 44 ,259,176);
  }
  
  public void histoBars() {
    float xPos = 259;
    xPos = xPos / 101;
    float yPos = 176;
    for (int i = 0; i <= 100; i++) {
      try {
        color strokeColor = color(0,0,80,40);
        stroke(strokeColor);
        float diff = (maxCount - count[i]);
        diff = diff / maxCount;
        fill(0,0,80,180);
        rect(1647 + (xPos * i), 44 + (yPos * diff), xPos, yPos - (176 * diff));
      } catch (IndexOutOfBoundsException e) {} 
        catch (NullPointerException e) {}
        
      try {
        color strokeColor = color(0,120,120,40);
        stroke(strokeColor);
        float rDiff = (rMax - rCount[i]);
        rDiff = rDiff / rMax;
        fill(0,120,120,100);
        rect(1647 + (xPos * i), 44 + (yPos * rDiff), xPos, yPos - (176 * rDiff));
      } catch (IndexOutOfBoundsException e) {} 
        catch (NullPointerException e) {}
        
      try {
        color strokeColor = color(200,180,120,40);
        stroke(strokeColor);
        float bDiff = (bMax - bCount[i]);
        bDiff = bDiff / bMax;
        fill(200,180,120,100);
        rect(1647 + (xPos * i), 44 + (yPos * bDiff), xPos, yPos - (176 * bDiff));
      } catch (IndexOutOfBoundsException e) {} 
        catch (NullPointerException e) {}
        
      try {
        color strokeColor = color(120,120,120,40);
        stroke(strokeColor);
        float gDiff = (gMax - gCount[i]);
        gDiff = gDiff / gMax;
        fill(120,120,120,100);
        rect(1647 + (xPos * i), 44 + (yPos * gDiff), xPos, yPos - (176 * gDiff));
      } catch (IndexOutOfBoundsException e) {} 
        catch (NullPointerException e) {}
    }
  }
  
  public void clear() {
    histogram = null;
    red = null;
    blue = null;
    value = null;
    rValue = null;
    bValue = null;
    rCount = null;
    bCount = null;
    count = null;
  }
  
}

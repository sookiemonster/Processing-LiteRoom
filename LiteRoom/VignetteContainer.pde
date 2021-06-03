public class VignetteContainer extends WindowObject {
 
  public ArrayList<Slider> sliders = new ArrayList<Slider>();
  
  public VignetteContainer(float x, float y) {
    super(x, y, 120, "Vignette");
    sliders.add(new VBSlider(x + 100, this.getInteriorY() + this.getHeight() + padding * 2));
  }
  
  public void display() {
    super.display();
  }
  
  public void setY(float n) {
    super.setY(n);
    updateSliderLocation();
  }
  
  private void updateSliderLocation() {
    for (int i = 0; i < sliders.size(); i++) {
      sliders.get(i).setY(this.getInteriorY() + (i * sliders.get(0).getHeight() * 2));
    }
  }
  
}

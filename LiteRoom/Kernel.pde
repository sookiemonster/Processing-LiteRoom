public class Kernel {
  float[][]kernel;
  
  public Kernel(float[][]init) {
    kernel = init;
  }
  
  color calcNewColor(PImage img, int x, int y) {
    if (x > 0 && x < img.width - 1 && y > 0 && y < img.height - 1) {
      int r = 0;
      int g = 0;
      int b = 0;
      for (int i =  x - 1; i < x + 2; i++) {
        for (int j = y - 1; j < y + 2; j++) {
          color c = img.get(i,j);
          r+= (kernel[i - x + 1][j - y + 1] * red(c));
          g+= (kernel[i - x + 1][j - y + 1] * green(c));
          b+= (kernel[i - x + 1][j - y + 1] * blue(c));
        }
      }
      return color(r, g, b);
    }
    return img.get(x, y);
  }

  void apply(PImage source, PImage destination) {
    colorMode(RGB, 256, 256, 256);
    for (int x = 0; x < source.width; x++) {
      for (int y = 0; y < source.height; y++) {
        destination.set(x, y + 1, calcNewColor(source, x, y));
      }
    }
    colorMode(HSB, 360, 100, 100);
  }
}

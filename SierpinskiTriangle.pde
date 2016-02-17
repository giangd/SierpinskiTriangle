Colors c;
//colors class makes program not run incompletely in web browser
public void setup() {
	size(500,500);
	noStroke();
  c = new Colors(true);
  background(0);
  sierpinski(0,height,500);

}

// public void draw() { //doesnt work on web browser
//   c.run();
// 	background(c.getDifferentColor());
//   fill(c.getColor());
//   sierpinski(0,height,500);
// }

public void sierpinski(int x, int y, int len) {
  if (len <= 10) {
    // c.run();
    // fill(c.getColor());
  	triangle(x,y,x+len/2,y-len,x+len,y);
  } else {
    // c.run();  
    // fill(c.getColor());
  	sierpinski(x, y, len/2);
  	sierpinski(x+len/2, y, len/2);
  	sierpinski(x+len/4, y-len/2, len/2);
  }
}

class NiceColor {
  float x, y, w, val, rate;
  int max = 255;
  float minimum = .75;
  float maximum = 1.5;
  boolean random;
  
  boolean goBack = false;

  NiceColor(float x, float y, float w, float val, float rate) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.val= val;
    this.rate = rate;
  }

  NiceColor(float val, float rate, boolean random) {
    this.val = val;
    this.rate = rate;
    this.random = random;
  }

  void changeVal() {
    if (goBack) {
      val -= rate;
    } else {
      val += rate;
    }
  }

  float getVal() {
    return val;
  }

  void maxVal() {
    if (val >= max) {
      goBack = true;
      if (random)
        rate = random(minimum, maximum);
    } else if (val <= 0) {
      goBack = false;
      if (random)
        rate = random(minimum, maximum);
    }
  }

  void display() {
    rect(x, y, w, -val);
  }

  void run() { //changes color doesnt display graph
    changeVal();
    maxVal();
  }
}

class Colors {
  NiceColor[] rgb = new NiceColor[3];

  Colors(int startingVal, int startingRate, boolean random) {
    // rgb = {new NiceColor(startingVal, startingRate, random), new NiceColor(startingVal, startingRate, random), new NiceColor(startingVal, startingRate, random)}; //doesnt work?

    for (int i = 0; i < 3; i++) {
      rgb[i] = new NiceColor(startingVal, startingRate, random);
    }
  }

  Colors(boolean random) {
    for (int i = 0; i < 3; i++) {
      rgb[i] = new NiceColor((float)(Math.random()*256), 1.5, random);
    }
  }

  void run() {
    for (NiceColor c : rgb) {
      c.run();
    }
  }

  color getColor() {
    return color(rgb[0].getVal(), rgb[1].getVal(), rgb[2].getVal());
  }

  color getDifferentColor() {
    return color(rgb[1].getVal(), rgb[2].getVal(), rgb[0].getVal());
  }
}
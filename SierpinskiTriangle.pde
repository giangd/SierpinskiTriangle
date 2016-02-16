BreathingColors c;

public void setup() {
	size(500,500);
	noStroke();
  c = new BreathingColors(true);
}
public void draw() {
	background(c.getDifferentColor());
  c.run();
  fill(c.getColor());
  sierpinski(0,height,500);
}
public void mouseDragged() {

}
public void sierpinski(int x, int y, int len) {
  if (len <= 10) {
  	// fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  	triangle(x,y,x+len/2,y-len,x+len,y);
  } else {
  	// fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
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

class BreathingColors {
  NiceColor[] rgb = new NiceColor[3];

  BreathingColors(int startingVal, int startingRate, boolean random) {
    // rgb = {new NiceColor(startingVal, startingRate, random), new NiceColor(startingVal, startingRate, random), new NiceColor(startingVal, startingRate, random)}; //gib mi ehwor dun no y

    for (int i = 0; i < 3; i++) {
      rgb[i] = new NiceColor(startingVal, startingRate, random);
    }
  }

  BreathingColors(boolean random) {
    for (int i = 0; i < 3; i++) {
      rgb[i] = new NiceColor((float)(Math.random()*256), 1, random);
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
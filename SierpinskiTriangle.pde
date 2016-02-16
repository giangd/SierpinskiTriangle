public void setup() {
	size(500,500);
	noStroke();
}
public void draw() {
	background(210);
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

//140 finish
GraphBar r;
GraphBar g;
GraphBar b;

void setup() {
  //size(900, 255);
  size(500, 500);
  noStroke();
  r = new GraphBar(0, height, width/3, 0, 1.0);
  g = new GraphBar(width/3, height, width/3, 255/3, 1.0);
  b = new GraphBar(width/1.5, height, width/3, 255/1.5, 1.0);
}


void draw() {
  //background(0);
  //background(r.getVal(), g.getVal(), b.getVal());

  fill(r.getVal(), g.getVal(), b.getVal());
  r.display();
  g.display();
  b.display();

  r.changeVal();
  g.changeVal();
  b.changeVal();

  r.maxVal(255);
  g.maxVal(255);
  b.maxVal(255);
  fill(r.getVal(), g.getVal(), b.getVal());
  rect(0,0,width,height);
}

class GraphBar { //enter value as positive number
  float x, y, w, val, rate;
  float minimum = .75;
  float maximum = 1.5;
  
  boolean goBack = false;

  GraphBar(float x, float y, float w, float val, float rate) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.val= val;
    this.rate = rate;
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

  //void modulus(float mod) {
  //  float tempVal = val%mod;
  //  if (tempVal == 0) {
  //    goBack = true;
  //  }
  //}

  void maxVal(float max) {
    if (val >= max) {
      goBack = true;
      rate = random(minimum, maximum);
    } else if (val <= 0) {
      goBack = false;
      rate = random(minimum, maximum);
    }
    //println(rate);
  }

  void display() {
    rect(x, y, w, (-val));
  }
}

class NiceColor {
  float x, y, w, val, rate;
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

  void maxVal(float max) {
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
}

class BreathingColor {
  NiceColor[] rgb;

  BreathingColor(int startingVal, int startingRate boolean random) {
    rgb = {new NiceColor(startingVal)}
  }
}
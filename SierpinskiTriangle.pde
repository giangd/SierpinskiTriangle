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
  if (len <= 20) {
  	fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  	triangle(x,y,x+len/2,y-len,x+len,y);
  } else {
  	fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  	sierpinski(x, y, len/2);
  	sierpinski(x+len/2, y, len/2);
  	sierpinski(x+len/4, y-len/2, len/2);
  }
}
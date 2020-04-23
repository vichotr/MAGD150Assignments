// If we want to draw one widget:
// Widget w;

// If we want to draw a lot of widgets:
Widget[] ws;
int count;

void setup() {
  surface.setResizable(true);
  surface.setTitle("Objects");
  pixelDensity(displayDensity());
  size(420, 420);
  background(32);
  colorMode(HSB, 359, 99, 99);
  
  // If we want to draw one widget:
  //w = new Widget();

  // If we want to draw a lot of widgets:
  count = max(width, height) / 7;
  ws = new Widget[count];
  for(int i = 0; i < count; ++i) {
    ws[i] = new Widget();
  }
}

void draw() {
  fill(0, 0, 24, 24);
  rect(0, 0, width, height);
  
  // If we want to draw one widget:
  //w.draw();
  
  // If we want to draw a lot of widgets:
  for(int i = 0; i < count; ++i) {
    ws[i].draw();
  }
}
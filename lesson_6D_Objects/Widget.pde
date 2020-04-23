// An object is built from a blueprint, which is called a class.
// This class contains qualities - called fields - and behaviors
// - methods - which any object created from the blueprint can
// access. The advantage of working with objects is that you can
// bundle collections of related behaviors and qualities together.

class Widget {

  // These are fields which each widget will have.

  float x, y, radius, xSpeed, ySpeed, xDir, yDir;
  color fill;

  // The following two functions are special functions called
  // constructors. Notice that, unlike other functions they are
  // not preceded by a void or datatype. The first constructor
  // has no parameters, while the second requires x, y and radius.
  // This is so that the person who creates a widget can customize
  // each widget created.

  Widget() {

    // One constructor can call another constructor using
    // this(). This way, you can provide options to people
    // who use the class you've written without having to
    // repeat code.

    this(random(30, width - 30), 
      random(30, height - 30), 
      random(5, 30));
  }

  Widget(float x, float y, float radius) {

    // Inside this function, x, y and radius have local
    // scope, meaning that they will go away when the function
    // is finished. These variables contain information
    // passed in from the outside program at time of
    // construction. So how do we distinguish these variables
    // which will go away from the x, y and radius variables
    // above which belong to each object created by the
    // constructor? We use the this keyword and the dot accessor.

    this.x = x;
    this.y = y;
    this.radius = radius;

    xSpeed = random(1, radius / 5.0);
    ySpeed = random(1, radius / 5.0);

    float theta = random(TWO_PI);
    xDir = cos(theta);
    yDir = sin(theta);

    // Choose a random color while using HSB color mode lets
    // us more easily pick the range of potential colors.

    fill = color(random(50, 250), 
      random(60, 100),
      100);
  }

  // Were you to put an object created from this class
  // into a println statement, the default message that
  // would appear in the console would look like
  // lesson_6D_Objects$Widget@38332697 . Overriding this
  // public String toString() function lets you decide
  // what information will appear that is more helpful.

  public String toString() {
    return "[ " +x + ", " + y + ", " + radius + " ]";
  }

  void draw() {
    bounce();

    pushStyle();
    noStroke();
    ellipseMode(RADIUS);

    // Draw the main circle.

    fill(fill);
    ellipse(x, y, radius, radius);

    // Draw two lighter spots inside the main circle.

    fill(0, 0, 100, 54);
    ellipse(x, y, radius * 2 / 3.0, radius * 2 / 3.0);
    fill(0, 0, 100, 76);
    ellipse(x, y, radius / 3.0, radius / 3.0);
    popStyle();
  }

  void bounce() {
    // Movement is position plus speed times direction.

    x += xSpeed * xDir;
    y += ySpeed * yDir;

    // If the ball's center +/- its radius is less than
    // or greater than the edges of the screen, then
    // the ball changes direction.

    if (x - radius < 0 || x + radius > width) {
      xDir *= -1;
      //xSpeed *= 0.95;
    }
    if (y - radius < 0 || y + radius > height) {
      yDir *= -1;
      //ySpeed *= 0.95;
    }
  }
}
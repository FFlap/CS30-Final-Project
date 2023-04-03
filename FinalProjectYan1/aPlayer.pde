public class aPlayer extends aGameObject {
  private float jump, velocityX, velocityY, originalJump;
  private int speed;
  private boolean jumpToggle, moveRight, moveLeft;

  // Original Constructed Variables
  private int originalSetL, originalSetW, originalSpeed;

  public aPlayer(int visibility, int setX, int setY, int setL, int setW, float jump, int speed) {
    super(visibility, setX, setY, setL, setW);
    this.jump = jump;
    this.originalSetL = setL;
    this.originalSetW = setW;
    this.originalSpeed = speed;
    this.originalJump = jump;
  }


  public void reset() {
    setL = originalSetL;
    setW = originalSetW;
    speed = originalSpeed;
    jump = originalJump;
  }




  public void setX(int newX) {
    this.setX = newX;
  }

  public void setY(int newY) {
    this.setY = newY;
  }

  public void moveRight() {
    moveRight = true;
  }

  public void moveLeft() {
    moveLeft = true;
  }

  public void jump() {
    if (!jumpToggle) { // Only jump if not currently jumping
      jumpToggle = true;
      velocityY = -jump;
    }
  }

  public void stopLeft() {
    moveLeft = false;
  }

  public void stopRight() {
    moveRight = false;
  }


  public void land() {
    velocityY = 0;
    jumpToggle = false;
  }

  @Override
    public void display() {
    if (visibility == 0 || visibility == getViewVisibility()) {
      fill(255);
      stroke(0);
      strokeWeight(0);
      rect(setX, setY, setL, setW);

      if (moveRight == true) {
        setX = setX + speed;
      }

      if (moveLeft == true) {
        setX = setX - speed;
      }
      setX = constrain(setX, 0, width - setL);


      // Jump
      velocityY += 0.5;

      if (velocityY >= setW) {
        velocityY--;
      } 

      setY += velocityY;

      if (velocityY > 0.5) {
        jumpToggle = true;
      }
    }
  }

  public void data() {
    println(velocityY);
  }
}

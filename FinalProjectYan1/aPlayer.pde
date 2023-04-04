public class aPlayer extends aGameObject {
  private float jump, velocityX, velocityY, originalJump;
  private int speed,jumpNum;
  private boolean jumpToggle, moveRight, moveLeft, moveUp, moveDown, flight, ladder;

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
    flight = false;
    jumpNum = 0;
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

  public void moveUp() {
    moveUp = true;
  }

  public void moveDown() {
    moveDown = true;
  }

  public void stopUp() {
    moveUp = false;
  }

  public void stopDown() {
    moveDown = false;
  }

  public void jump() {
    if (!jumpToggle || flight || jumpNum >= 1) {
      jumpToggle = true;
      velocityY = -jump;
      jumpNum--;
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
    for (aPowerup pow : powerups) {
      if (pow.getType() == "setJump" && pow.activatedPowerup == true) {
        jumpNum = pow.setPowerupValue;
        break;
      }
    }
  }

  @Override
    public void display() {
    if (visibility == 0 || visibility == getViewVisibility()) {
      fill(255);
      noStroke();
      rect(setX, setY, setL, setW);
      ladder = false;




      if (moveRight == true) {
        setX = setX + speed;
      }

      if (moveLeft == true) {
        setX = setX - speed;
      }
      setX = constrain(setX, 0, width - setL);

      if (moveUp) {
        setY = setY - speed;
      }

      if (moveDown) {
        setY = setY + speed;
      }


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
    println("VelocityY: " + velocityY);
    println("jumpToggle: " +jumpToggle);
    println("ladder: " +ladder);
  }
}

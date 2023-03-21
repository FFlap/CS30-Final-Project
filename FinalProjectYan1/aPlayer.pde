public class aPlayer {
  private float boxX, boxY, jump, velocityX, velocityY;
  private int boxSize, speed;
  private boolean jumpToggle, moveRight, moveLeft = false;

  //Orignal Constructed Variables
  private int orignalBoxSize, orignalSpeed;
  private float orignalJump;


  public aPlayer(float jump, int boxSize, int speed) {
    this.jump = jump;
    this.boxSize = boxSize;
    this.speed = speed;
    this.orignalBoxSize = boxSize;
    this.orignalSpeed = speed;
    this.orignalJump = jump;
  }
  
  public void reset(){ 
    boxSize = orignalBoxSize;
    speed = orignalSpeed;
    jump = orignalJump;
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

  public void  stopLeft() {
    moveLeft = false;
  }

  public void  stopRight() {
    moveRight = false;
  }


  public void display() {
    fill(255);
    stroke(0);
    strokeWeight(0);
    rect(player.boxX, player.boxY, player.boxSize, player.boxSize);


    if (moveRight == true) {
      boxX = boxX +  speed;
    }

    if (moveLeft == true) {
      boxX = boxX - speed;
    }
    boxX = constrain(boxX, 0, width - boxSize);


    // Jump
    velocityY += 0.5;
    boxY += velocityY;

    if (!jumpToggle) {
      jumpToggle = true;
    }
  }






  public void data() {

    println(velocityY);
  }
}

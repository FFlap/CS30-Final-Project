public class aPlayer {
  private float boxX, boxY, jump, maxJumpHeight;
  private int boxSize, speed;
  private boolean jumpToggle, moveRight, moveLeft = false;



  public aPlayer(float boxX, float boxY, float jump, int boxSize, int speed) {
    this.boxX = boxX;
    this.boxY = boxY;
    this.jump = jump;
    this.maxJumpHeight = jump;
    this.boxSize = boxSize;
    this.speed = speed;
  }

  public void moveRight() {
    moveRight = true;
  }

  public void moveLeft() {
    moveLeft = true;
  }

  public void jump() {
    jumpToggle = true;
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


    //Jump
    if (jumpToggle == true) {
      jump--;
      boxY = boxY - jump;
      //println(jump);
    }

    if (jump <= - maxJumpHeight) {
      jumpToggle = false;
      // println("Jump equal to -15!");
      jump = maxJumpHeight;
    }
  }





  public void data() {
    println(jump);
    println(speed);
  }
}

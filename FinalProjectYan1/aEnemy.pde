public class aEnemy extends aGameObject {
  private String setType;
  private float velocityY;
  public boolean moveRight, moveLeft;
  public boolean alive = true;

  public aEnemy(String setType, int visibility, int setX, int setY, int setL, int setW) {
    super(visibility, setX, setY, setL, setW);
    this.setType = setType;
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


  public void stopLeft() {
    moveLeft = false;
  }

  public void stopRight() {
    moveRight = false;
  }


  public void land() {
    velocityY = 0;
  }






  @Override
    public void display() {
    if (visibility == 0 || visibility == getViewVisibility() && alive) {
      noStroke();

      switch(setType) {
      case "red":
        fill(#C93F3F);
        println(alive);

        break;

      default:
        break;
      }




      rect(setX, setY, setL, setW);
      if (moveRight) {

        setX += 5;
      }

      if (moveLeft) {
        setX -= 5;
      }
      setX = constrain(setX, 0, width - setL);


      velocityY += 0.5;
      setY += velocityY;
    }
  }
}

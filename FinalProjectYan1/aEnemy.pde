public class aEnemy extends aGameObject {
  private String setType;
  private float speed, velocityY, jump;
  private boolean moveRight, moveLeft, jumpToggle, flight, projectileMove;
  private boolean alive = true;
  private float projectileX, projectileY, projectileL, projectileW, projectileSpeedX, projectileSpeedY, projectileAngle, projectileTimer;

  public aEnemy(String setType, int visibility, int setX, int setY) {
    super(visibility, setX, setY, 0, 0);
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
    jumpToggle = false;
  }

  public void jump() {
    if (!jumpToggle || flight) {
      jumpToggle = true;
      velocityY = -jump;
    }
  }

  public void handleCollision(aProjectile projectile) {
    if ((visibility == 0 || visibility == getViewVisibility()) && projectile.projectileActive) {

      if (projectile.getX() + projectile.getL() > getX() && projectile.getX() < getX() + getL() &&
        projectile.getY() + projectile.getW() > getY() && projectile.getY() < getY() + getW()) {
        alive = false;
      }
    }
  }





  @Override
    public void display() {
    if ((visibility == 0 || visibility == getViewVisibility()) && alive) {
      noStroke();

      switch(setType) {
      case "red":
        fill(#C93F3F);
        setL = 40;
        setW = 40;
        speed = 2;
        break;

      case "blue":
        fill(#02A1D8);
        setL = 40;
        setW = 40;
        jump = 10;
        flight = true;
        speed = 4;
        break;


      case "purple":
        fill(#A13BC1);
        setL = 40;
        setW = 40;
        jump = 10;
        speed = 5;
        break;

      case "demise":

        setL = 100;
        setW = 30;
        speed = 5;
        velocityY = 0;

        projectileL = 30;
        projectileW = 30;

        if ( world.levelTimer % 75 == 0) {
          projectiles.add(new aProjectile("enemy", 0, getX(), getY(), 30, 30));
        }
        fill(#05A010);


      default:
        break;
      }




      rect(setX, setY, setL, setW);
      if (moveRight) {

        setX += speed;
      }

      if (moveLeft) {
        setX -= speed;
      }
      setX = constrain(setX, 0, width - setL);


      velocityY += 0.5;
      setY += velocityY;
      targetPlayer();
    }
  }




  int closeX = 0;
  int closeY = 0;
  public void targetPlayer() {
    if (world.levelTimer % 10 == 0) {
      for (aPlayer player : players) {
        //if ( closeX < player.getX()) {
        closeX = player.getX();
        // }
        //if ( player.getY() > closeY  ) {
        closeY = player.getY();
        // }
      }
      println(closeY);
      println(getY());
    }

    if (world.levelTimer % 10 == 0) {

      if (closeX > getX()) {
        stopLeft();
        moveRight();
        closeX = 0;
      } else {
        stopRight();
        moveLeft();
        closeX = 0;
      }
    }

    if ( world.levelTimer % 25 == 0) {


      if ( getY() > closeY) {
        jump();
        closeY = 0;
      }
    }
  }

  public void data() {
    if (world.levelTimer % 500 == 0) {
    }
  }
}

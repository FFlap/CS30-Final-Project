public class aEnemy extends aGameObject {
  private String setType;
  private float speed, velocityY, jump;
  private boolean moveRight, moveLeft, jumpToggle, flight;
  private boolean alive = true;

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
        if (projectile.setType == "player") {
          alive = false;
        }
      }
    }
  }

  public void projectileLeft(int x, int y, int num) {
    int projectileSize = 20;
    if (num == 0) {
      return;
    }



    projectileLeft(x  + projectileSize, y - projectileSize, num - 1);
    projectiles.add(new aProjectile("orange", 0, x, y, projectileSize  * num, projectileSize));
  }

  public void projectileRight(int x, int y, int num) {
    int projectileSize = 20;
    if (num == 0) {
      return;
    }


    projectiles.add(new aProjectile("orange", 0, x, y, projectileSize  * num, projectileSize));
    projectileRight(x, y - projectileSize, num - 1);
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

      case "green":
        fill(#05A010);
        setL = 100;
        setW = 30;
        speed = 5;
        velocityY = 0;

        if ( world.levelTimer % 75 == 0) {
          projectiles.add(new aProjectile("purple", 0, getX(), getY(), 20, 20));
          projectiles.add(new aProjectile("purple", 0, getX() + getL() / 2, getY(), 20, 20));
          projectiles.add(new aProjectile("purple", 0, getX() + getL(), getY(), 20, 20));
        }

        break;


      case "yellow":
        fill(#FFF646);
        setL = 80;
        setW = 100;
        speed = 5;
        velocityY = 0;

        if ( world.levelTimer % 100 == 0) {
          projectileLeft(getX(), getY(), 3);
          projectileRight(getX()+ 40, getY(), 3);
        }


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
      // println(closeY);
      //println(getY());
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

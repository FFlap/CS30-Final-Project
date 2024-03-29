public class aPlatform extends aGameObject {
  protected int platformStart, platformDistance, platformColor;
  private float platformSpeed;
  protected Boolean platformCheck, platformInfinite;
  private String setType, platformDirection;

  public aPlatform(String setType, int visibility, int setX, int setY, int setL, int setW, int platformColor) {
    super(visibility, setX, setY, setL, setW);
    this.platformColor = platformColor;
    this.setType = setType;
  }

  public aPlatform(String setType, int visibility, int setX, int setY, int setL, int setW, String platformDirection, int platformDistance, float platformSpeed, int platformColor) {
    super(visibility, setX, setY, setL, setW);
    this.platformDistance = platformDistance;
    this.platformDirection = platformDirection;
    this.platformSpeed = platformSpeed;
    this.platformColor = platformColor;
    this.setType = setType;
  }

  public aPlatform(String setType, int visibility, int setX, int setY, int setL, int setW, String platformDirection, boolean platformInfinite, float platformSpeed, int platformColor) {
    super(visibility, setX, setY, setL, setW);
    this.platformInfinite = platformInfinite;
    this.platformDirection = platformDirection;
    this.platformSpeed = platformSpeed;
    this.platformColor = platformColor;
    this.setType = setType;
  }



  @Override
    public void display() {
    if (visibility == 0 || visibility == getViewVisibility()) {
      noStroke();
      fill(platformColor);
      rect(setX, setY, setL, setW);

      if (platformDistance >= 1) {

        switch(platformDirection) {
        case "horizontal":
          if (platformStart == 0) {
            platformStart = setX;
          }

          setX += platformSpeed;
          if (setX > platformDistance) {
            platformSpeed = -platformSpeed;
          } else if (setX < platformStart) {
            platformSpeed = -platformSpeed;
          }
          break;

        case "vertical":
          if (platformStart == 0) {
            platformStart = setY;
          }
          setY += platformSpeed;
          if (setY > platformDistance) {
            platformSpeed = -platformSpeed;
          } else if (setY < platformStart) {
            platformSpeed = -platformSpeed;
          }
          break;

        default:

          break;
        }
      }

      if (platformDirection != null && platformInfinite != null) {

        switch(platformDirection) {
        case "horizontal":
          if (platformInfinite) {
            setX += platformSpeed;
          } else {
            setX -= platformSpeed;
          }
          break;

        case "vertical":
          if (platformInfinite) {
            setY += platformSpeed;
          } else {
            setY -= platformSpeed;
          }
          break;

        default:

          break;
        }
      }
    }
  }

  // SAT AABB collision detection to resolve corner cases. 
  //NOTE: I DID NOT CREATE any code relating to xOverlap and yOverlap. Concept of the collsion retreived from: https://gamedev.stackexchange.com/questions/29786/a-simple-2d-rectangle-collision-algorithm-that-also-determines-which-sides-that
  public void handleCollision(aPlayer player) {
    if (visibility == 0 || visibility == getViewVisibility()) {
      float xOverlap = Math.min(player.getX() + player.getL() - getX(), getX() + getL() - player.getX());
      float yOverlap = Math.min(player.getY() + player.getW() - getY(), getY() + getW() - player.getY());
      switch(setType) {

      case "platform":
        if (xOverlap > 0 && yOverlap > 0) {
          if (xOverlap < yOverlap) {
            // Resolve the collision horizontally
            if (player.getX() < getX()) {
              player.stopRight();
              player.setX(getX() - player.getL());
            } else {
              player.stopLeft();
              player.setX(getX() + getL());
            }
          } else {
            // Resolve the collision vertically
            if (player.getY() < getY()) {
              player.land();
              player.tempMoveRight = false;
              player.tempMoveLeft = false;
              player.setY(getY() - player.getW());
            } else {
              player.velocityY = 0;
              player.setY(getY() + getW());
            }
          }
        }
        break;

      case "oneway":
        if (player.getY() + player.getW() > getY() && player.getY() < getY() && player.getX() + player.getL() > getX() && player.getX() < getX() + getL()) {
          player.land();
          player.setY(getY() - player.getW());
        }
        break;

      case "walljump":
        if (xOverlap > 0 && yOverlap > 0) {
          if (xOverlap < yOverlap) {
            // Resolve the collision horizontally
            if (player.getX() < getX()) {
              player.stopRight();
              player.setX(getX() - player.getL());
              player.jumpNum = 1;
              player.velocityY = 0.25;
            } else {
              player.stopLeft();
              player.setX(getX() + getL());
              player.jumpNum = 1;
              player.velocityY = 0.25;
            }
          } else {
            // Resolve the collision vertically

            if (player.getY() < getY()) {
              player.land();
              player.setY(getY() - player.getW());
            } else {
              player.velocityY = 0;
              player.setY(getY() + getW());
            }
          }
        }

        break;
      }
    }
  }

 //NOTE: I DID NOT CREATE any code relating to xOverlap and yOverlap. Concept of the collsion retreived from: https://gamedev.stackexchange.com/questions/29786/a-simple-2d-rectangle-collision-algorithm-that-also-determines-which-sides-that
  public void handleCollision(aEnemy enemy) {
    if (visibility == 0 || visibility == getViewVisibility()) {
      float xOverlap = Math.min(enemy.getX() + enemy.getL() - getX(), getX() + getL() - enemy.getX());
      float yOverlap = Math.min(enemy.getY() + enemy.getW() - getY(), getY() + getW() - enemy.getY());
      switch(setType) {

      case "platform":
        case "walljump":


          if (xOverlap > 0 && yOverlap > 0) {
          if (xOverlap < yOverlap) {
            // Resolve the collision horizontally
            if (enemy.getX() < getX()) {
              enemy.stopRight();
              enemy.setX(getX() - enemy.getL());
            } else {
              enemy.stopLeft();
              enemy.setX(getX() + getL());
            }
          } else {
            // Resolve the collision vertically
            if (enemy.getY() < getY()) {
              enemy.land();
              enemy.setY(getY() - enemy.getW());
            } else {
              enemy.velocityY = 0;
              enemy.setY(getY() + getW());
            }
          }
        }
        break;

      case "oneway":
        if (enemy.getY() + enemy.getW() > getY() && enemy.getY() < getY() && enemy.getX() + enemy.getL() > getX() && enemy.getX() < getX() + getL()) {
          enemy.land();
          enemy.setY(getY() - enemy.getW());
        }
        break;
      }
    }
  }


  public void data() {
    if (world.levelTimer % 100 == 0) {
      println("Time: " + world.levelTimer/100 + "s Check: " + platformStart);
    }
  }
}

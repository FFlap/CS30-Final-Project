public class aPlayer extends aGameObject {
  private float jump, velocityY, originalJump;
  private int speed, jumpNum, playerNum, selectedPlayer;
  private boolean jumpToggle, tempMoveRight, tempMoveLeft, moveRight, moveLeft, moveUp, moveDown, allowDown, flight, ladder;
  private float gravity = 0.5;

  // Original Constructed Variables
  private int originalSetL, originalSetW, originalSpeed;

  public aPlayer(int visibility, int setX, int setY, int setL, int setW, int jump, int speed, int playerNum) {
    super(visibility, setX, setY, setL, setW);
    this.playerNum = playerNum;
    this.originalSetL = setL;
    this.originalSetW = setW;
    this.originalJump = jump;
    this.originalSpeed = speed;
    this.jump = jump;
    this.speed = speed;
  }


  public void reset() {

    setL = originalSetL;
    setW = originalSetW;
    speed = originalSpeed;
    jump = originalJump;
    flight = false;
    jumpNum = 0;
  }

  public boolean getLadder() {
    return ladder;
  }


  public void setX(int newX) {
    this.setX = newX;
  }

  public void setY(int newY) {
    this.setY = newY;
  }

  public void setSelected(int selectedPlayer) {
    this.selectedPlayer = selectedPlayer;
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
    if ((!jumpToggle || flight || jumpNum > 0) && playerNum == selectedPlayer) {
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

    if (!(moveDown && allowDown)) {

      velocityY = 0;
      jumpToggle = false;
      for (aPowerup pow : powerups) {
        if (pow.getType() == "setJump" && pow.activatedPowerup == true) {
          jumpNum = pow.setPowerupValue;
          break;
        }
      }
    }
  }

  public void handleCollision(aProjectile projectile) {
    if ((visibility == 0 || visibility == getViewVisibility()) && projectile.projectileActive) {

      if (projectile.getX() + projectile.getL() > getX() && projectile.getX() < getX() + getL() &&
        projectile.getY() + projectile.getW() > getY() && projectile.getY() < getY() + getW()) {

        if (projectile.setType != "player") {
          world.reset();
        }
      }
    }
  }
 //NOTE: I DID NOT CREATE any code relating to xOverlap and yOverlap. Concept of the collsion retreived from: https://gamedev.stackexchange.com/questions/29786/a-simple-2d-rectangle-collision-algorithm-that-also-determines-which-sides-that
  public void handleCollision(aEnemy enemy) {
    if ((visibility == 0 || visibility == getViewVisibility()) && enemy.alive) {
      float xOverlap = Math.min(enemy.getX() + enemy.getL() - getX(), getX() + getL() - enemy.getX());
      float yOverlap = Math.min(enemy.getY() + enemy.getW() - getY(), getY() + getW() - enemy.getY());

      if (xOverlap > 0 && yOverlap > 0) {
        if (xOverlap < yOverlap) {
          // Resolve the collision horizontally
          if (enemy.getX() < getX()) {
            world.reset();
          } else {
            world.reset();
          }
        } else {
          // Resolve the collision vertically
          if (enemy.getY() < getY()) {
            world.reset();
          } else {
            if (enemy.setType == "red") {
              enemy.alive = false;
            }
          }
        }
      }
    }
  }

  @Override
    public void display() {
    if ((visibility == 0 || visibility == getViewVisibility())) {




      switch(playerNum) {
      case 0:
        fill(255);
        noStroke();
        rect(setX, setY, setL, setW);
        break;
      case 1:
        fill(#7AFF0F);
        for (aPowerup pow : powerups) {
          if (pow.getType() == "newPlayer" && pow.activatedPowerup) {
            noStroke();
            rect(setX, setY, setL, setW);
          }
        }
        break;
      default:
        break;
      }




      if (playerNum == selectedPlayer) {
        if (moveRight || tempMoveRight) {
          setX = setX + speed;
        }

        if (moveLeft || tempMoveLeft) {
          setX = setX - speed;
        }
        setX = constrain(setX, 0, world.worldWidth - setL);

        if (moveUp && ladder) {
          setY = setY - speed;
        }

        if ((moveDown && ladder) || (moveDown && allowDown)) {
          setY = setY + speed;
        }
      }

      // Jump
      if (!jumpToggle && gravity < 0.5) {
        gravity = 0.5;
      }
      velocityY += gravity;
      if (velocityY >= setW) {
        velocityY--;
      }


      setY += velocityY;

      if (setY > height + setW) {
        world.reset();
      }

      if (velocityY > gravity && !ladder && !moveUp) {
        jumpToggle = true;
      }
    }
  }

  public void data() {
    if (world.levelTimer % 100 == 0) {
      println("jumpNum: " + jumpNum);

    }
  }
}

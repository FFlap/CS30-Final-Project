public class aPowerup extends aGameObject {

  private float setPowerupValue;
  private float projectileX, projectileY, projectileSpeedX, projectileSpeedY, projectileAngle, projectileTimer;
  private String setType;
  private boolean activatedPowerup, projectileMove;

  public aPowerup(String setType, int visibility, int setX, int setY) {
    super(visibility, setX, setY, 20, 20); 
    this.setType = setType;
  }

  public aPowerup(String setType, int visibility, int setX, int setY, int setPowerupValue) {
    super(visibility, setX, setY, 20, 20); 
    this.setType = setType;
    this.setPowerupValue = setPowerupValue;
  }

  public String getType() {
    return setType;
  }

  public float getProjectileX() {
    return projectileX;
  }

  public float getProjectileY() {
    return projectileY;
  }




  public void glassesPowerupToggle() {


    if (getViewVisibility() == 2) {
      setViewVisibility(1);
    } else if (getViewVisibility() == 1) {
      setViewVisibility(2);
    }
    updateVisibility();
  }

  public void setProjectileAngle(int projectileMouseX, int projectileMouseY) {
    for (aPlayer player : players) {
      this.projectileX =  player.getX();
      this.projectileY =   player.getY();
    }
    this.projectileAngle = atan2(projectileMouseY - projectileY, projectileMouseX - projectileX);
  }

  public void handleCollision(aPlayer player) {
    if (visibility == 0 || visibility == getViewVisibility()) {
      if (player.getX() + player.getL() > getX() && player.getX() < getX() + getL() &&
        player.getY() + player.getW() > getY() && player.getY() < getY() + getW()) {
        switch(setType) {
        case "highJump":
          activatedPowerup = true;
          player.jump = setPowerupValue;
          break;

        case "glasses":
          activatedPowerup = true;
          if (getViewVisibility() == 0) {
            setViewVisibility(1);
          }
          break;

        case"levelUnlock":
          activatedPowerup = true;
          break;

        case "projectile":
          activatedPowerup = true;
          break;
        }
      }
    }
  }

  public void display() {
    if (visibility == 0 || visibility == getViewVisibility()) {
      switch(setType) {

      case "highJump":


        if (!activatedPowerup) {
          fill(#4DCEFF);
          rect(setX, setY, 20, 20);
          fill(#151515);
          rect(setX + 5, setY + 5, 10, 10);
        }



        break;

      case "glasses":

        if (!activatedPowerup) {
          fill(#FF9912);
          rect(setX, setY, 20, 20);
          fill(#151515);
          rect(setX + 5, setY + 5, 10, 10);
        } else {
          fill(255);
          textSize(15);
          text("Toggle your glasses power On/Off \n by pressing R!", 420, 430);
        }


        break;




      case "levelUnlock":
        if (activatedPowerup ==  false) {
          fill(#FFDF24);
          rect(setX, setY, 20, 20);
          fill(#151515);
          rect(setX + 5, setY + 5, 10, 10);
        } else {
          setViewVisibility(2);
          updateVisibility();
        }



        break;

      case "projectile":

        if (activatedPowerup ==  false) {
          fill(#7B4CEA);
          rect(setX, setY, 20, 20);
          fill(#151515);
          rect(setX + 5, setY + 5, 10, 10);
        } else {
          fill(255);
          textSize(15);
          text("Click anywhere you want to shoot!", 230, 430);

          if (projectileMove == true) {


            projectileTimer++;
            if (projectileTimer == 50) {
              projectileMove = false;
              projectileTimer = 0;
            }

            //Projectile
            fill(#7B4CEA);
            rectMode(CENTER);
            rect(projectileX, projectileY, 20, 20);
            rectMode(CORNER);

            projectileSpeedX = setPowerupValue * cos(projectileAngle);

            projectileSpeedY = setPowerupValue * sin(projectileAngle);
            projectileX += projectileSpeedX;

            projectileY += projectileSpeedY;
          }
        }

        break;


      default:
        println("Invalid setType");
      }
    }
  }

  public void data() {
    if (world.levelTimer % 100 == 0) {
      println("Time: " + world.levelTimer/100 + "s Check: " +  getViewVisibility());
    }
  }
}

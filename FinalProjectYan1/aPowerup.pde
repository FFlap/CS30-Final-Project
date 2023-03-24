public class aPowerup {
  private float setX, setY, setPowerupValue, togglePowerup, visibility;
  private float projectileX, projectileY, projectileSpeedX, projectileSpeedY, projectileAngle, projectileTimer;
  private String setType;
  private boolean activatedPowerup, projectileMove;
  public aPowerup() {
  }
  public aPowerup(String setType, int visibility, int setX, int setY) {
    this.visibility = visibility;
    this.setType = setType;
    this.setX = setX;
    this.setY = setY;
  }


  public aPowerup(String setType, int visibility, int setX, int setY, int setPowerupValue) {
    this.setType = setType;
    this.visibility = visibility;
    this.setX = setX;
    this.setY = setY;
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


    if (togglePowerup == 2) {
      togglePowerup = 1;
    } else if (togglePowerup == 1) {
      togglePowerup = 2;
    }
  }

  public void setProjectileAngle(int projectileMouseX, int projectileMouseY) {
    this.projectileX = player.boxX;
    this.projectileY = player.boxY;
    this.projectileAngle = atan2(projectileMouseY - projectileY, projectileMouseX - projectileX);
  }

  public void display() {
    switch(setType) {

    case "highJump":

      if (activatedPowerup == false && player.boxX >= setX - 15 && player.boxX <= setX + 15 && player.boxY <= setY + 35 && player.boxY >= setY - 15) {
        activatedPowerup = true;
      }

      if (activatedPowerup == true) {
        player.jump = setPowerupValue;
      } else {
        fill(#FF9912);
        rect(setX, setY, 20, 20);
      }



      break;

    case "glasses":

      if (togglePowerup == 0) {
        fill(#FF9912);
        rect(setX, setY, 20, 20);
      }

      if (togglePowerup == 1) {

        fill(255);
        textSize(15);
        text("Toggle your glasses power On/Off \n by pressing R!", 420, 430);
      } else if (togglePowerup == 2) {
        for (aPlatform plat : platforms) {
          if (plat.visibility == 1) {
            plat.display();
          }
        }
        //Objects
        for (aObject obj : objects) {
          if (obj.visibility == 1) {
            obj.display();
          }
        }
      }

      if (togglePowerup == 0 && player.boxX >= setX - 15 && player.boxX <= setX + 15 && player.boxY <= setY + 35 && player.boxY >= setY - 15) {
        togglePowerup = 1;
      }




      break;




    case "levelUnlock":
      if (activatedPowerup ==  false) {
        fill(#FFDF24);
        rect(setX, setY, 20, 20);
        fill(#151515);
        rect(setX + 5, setY + 5, 10, 10);
      } else {
        for (aPlatform plat : platforms) {
          if (plat.visibility == 1) { 
            plat.display();
          }
        }
        for (aObject obj : objects) {
          if (obj.visibility == 1) { 
            obj.display();
          }
        }
      }

      if (activatedPowerup == false && player.boxX >= setX - 15 && player.boxX <= setX + 15 && player.boxY <= setY + 35 && player.boxY >= setY - 15) {
        activatedPowerup = true;
      }

      break;

    case "projectile":

      if (activatedPowerup == false && player.boxX >= setX - 15 && player.boxX <= setX + 15 && player.boxY <= setY + 35 && player.boxY >= setY - 15) {
        activatedPowerup = true;
      }
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

  public void data() {
    if (world.levelTimer % 100 == 0) {
      println("Time: " + world.levelTimer/100 + "s Check: " +  togglePowerup);
    }
  }
}

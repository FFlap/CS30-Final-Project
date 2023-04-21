public class aPowerup extends aGameObject {

  private int setPowerupValue;
  private String setType;
  private boolean activatedPowerup;

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





  public void glassesPowerupToggle() {


    if (getViewVisibility() == 2) {
      setViewVisibility(1);
    } else if (getViewVisibility() == 1) {
      setViewVisibility(2);
    }
    updateVisibility();
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
        case "flight":
          activatedPowerup = true;
          player.flight = true;
          break;
        case "setJump":
          activatedPowerup = true;
          player.jumpNum = 2;
          break;

        case "newPlayer":

          if (!activatedPowerup) {
          }
          activatedPowerup = true;
          break;
        default:
          activatedPowerup = true;
        }
      }
    }
  }

  public void display() {
    if (visibility == 0 || visibility == getViewVisibility()) {
      noStroke();
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
        }

        break;

      case "flight":
        if (activatedPowerup ==  false) {
          fill(#FFFFFF);
          rect(setX, setY, 20, 20);
          fill(#151515);
          rect(setX + 5, setY + 5, 10, 10);
        }
        break;

      case "setJump":

        if (activatedPowerup ==  false) {
          fill(#356744);
          rect(setX, setY, 20, 20);
          fill(#151515);
          rect(setX + 5, setY + 5, 10, 10);
        }
        break;

      case "changeWindow":

        if (activatedPowerup ==  false) {
          fill(#B4B3B2);
          rect(setX, setY, 20, 20);
          fill(#151515);
          rect(setX + 5, setY + 5, 10, 10);
        } else {
          GUI.setTransitionWindow(800, 800);
          if(width == 800){
          world.worldWidth = 800;
          }
        }
        break;

      case "newPlayer":


        if (activatedPowerup ==  false) {
          fill(#7AFF0F);
          rect(setX, setY, 20, 20);
          fill(#151515);
          rect(setX + 5, setY + 5, 10, 10);
        } else {
          fill(255);
          textSize(15);
          text("Use number pad to change characters! eg. 1, 2", 431, 40);
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

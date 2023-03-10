public class aPowerup {
  private int setX, setY;
  private String setType;
  private boolean activatedPowerup;
  public aPowerup(String setType, int setX, int setY) {
    this.setType = setType;
    this.setX = setX;
    this.setY = setY;
  }

  public void display() {
    switch(setType) {

    case "highJump":

      if (activatedPowerup == false && player.boxX >= setX - 15 && player.boxX <= setX + 15 && player.boxY <= setY + 35 && player.boxY >= setY - 15) {
        activatedPowerup = true;
      }

      if (activatedPowerup == true) {
        player.maxJumpHeight = 21;
      } else {
        fill(255, 0, 0);
        rect(setX, setY, 20, 20);
      }



      break;

    default:
      println("Invalid setType");
    }
  }

  public void data() {
    if (levelTimer % 100 == 0) {
      println("Time: " + levelTimer/100 + "s Check: " +  activatedPowerup);
    }
  }
}

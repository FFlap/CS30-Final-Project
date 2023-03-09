public class aPowerup {
  private int setX, setY;
  private String setType;
  private boolean activatedPowerup;
  public aPowerup(String setType, int setX, int setY, boolean activatedPowerup) {
    this.setType = setType;
    this.setX = setX;
    this.setY = setY;
    this.activatedPowerup = activatedPowerup;
  }

  public void display() {
    switch(setType) {

    case "highJump":
    if(!activatedPowerup){
      fill(255, 0, 0);
      rect(setX, setY, 20, 20);
      if(player.boxX >= setX - 15 && player.boxX <= setX + 15 && player.boxY <= setY + 15 && player.boxY >= setY - 15) {
          higherjump = true;
      }
    } else {
      
     jumpheight = 21;
      
    }
      
    
      break;

    default:
      println("Invalid setType");
    }
  }
}

public class aPlatform {
  private int platformX, platformY, platformW, platformL, platformNum, platformColor, platformNumCheck;
  private boolean platformCheck;

  public aPlatform(int platformX, int platformY, int platformW, int platformL, int platformNum, int platformColor) {
    this.platformX = platformX;
    this.platformY = platformY;
    this.platformW = platformW;
    this.platformL = platformL;
    this.platformNum = platformNum;
    this.platformColor = platformColor;
  }

/*

 Checks Number Meaning :
 
 Check 1 = Ground
 
 Check 2 = Platform 1
 
 Check 3 = Platform 2
 
 Check 4 = Platform 3
 
 Check 5 = Platform 4
 
 Check 6 = Platform 5
 
 Check 7 = Platform 1 Level 2
 
 Check 8 = Platform 2 Level 2
 
 Check 9 = Platform 3 Level 2
 
 Check 999 = Just a of range platform check to see if the player is in the air now
 etc...
 */

  public void display() {
    fill(platformColor);
    rect(platformX, platformY, platformW, platformL);






    if (  player.boxY <= (platformY + player.boxSize)  &&   player.boxY >= (platformY - player.boxSize) && player.boxX > (platformX - player.boxSize) && player.boxX < (platformX + platformW)) {
      platformCheck = true;
    } else {
      platformCheck = false;
    }

    if (platformCheck == true) {
      check = platformNum;
      player.boxY =  (platformY - player.boxSize);
    }

    if ( player.boxY <= (platformY + platformL - player.boxSize) &&  player.boxY >= (platformY - player.boxSize) && player.boxX >= (platformX - player.boxSize) && player.boxX <= (platformX - player.boxSize /2 )) {
      player.stopRight();
      player.boxX = (platformX - player.boxSize);
    }

    if ( player.boxY <= (platformY + platformL - player.boxSize) &&  player.boxY >= (platformY - player.boxSize) && player.boxX <= (platformX + platformW) && player.boxX >= (platformX + (platformW) - player.boxSize /2 )) {
      player.stopLeft();
      player.boxX = (platformX + (platformW));
    }



    if (  player.boxY <= (platformY +  platformL) &&  player.boxY >= (platformY + player.boxSize)  && player.boxX > (platformX - player.boxSize) && player.boxX < (platformX + platformW)) {
      player.jump = -7;
    }


    if ( player.boxX >= (platformX + platformW) && check == platformNum || player.boxX <= (platformX - player.boxSize) && check == platformNum) {
      check = 999;
      player.jump = -7;
      player.jumpToggle = true;
    } 

    if (check == 999 && player.jump < player.maxJumpHeight) {
      player.jump = -7;
      player.jumpToggle = true;
    }
  }
}

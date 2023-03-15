public class aPlatform {
  private int visibility, platformStart, platformX, platformX2, platformY, platformW, platformL, platformColor;
  private boolean platformCheck;

  public aPlatform(int visibility, int platformX, int platformY, int platformL, int platformW, int platformColor) {
    this.visibility = visibility;
    this.platformX = platformX;
    this.platformStart = platformX;
    this.platformY = platformY;
    this.platformW = platformW;
    this.platformL = platformL;
    this.platformColor = platformColor;
  }

  public aPlatform(int visibility, int platformX, int platformX2, int platformY, int platformL, int platformW, int platformColor) {
    this.visibility = visibility;
    this.platformX = platformX;
    this.platformX2 = platformX2;
    this.platformY = platformY;
    this.platformW = platformW;
    this.platformL = platformL;
    this.platformColor = platformColor;
  }

  public void display() {
    fill(platformColor);
    rect(platformX, platformY, platformL, platformW);

    if (platformX2 >= 1 ) {
      if (platformX > platformStart + platformX2) {
        platformX -= 1;
      }
        if (platformX < platformStart) {
          platformX += 1;
        }
      }


      //Check if on top of platform
      if (player.boxY <= platformY  && player.boxY >= (platformY - player.boxSize) && player.boxX > (platformX) && player.boxX < (platformX + platformL)) {
        platformCheck = true;
      } else {
        platformCheck = false;
      }


      //If on platform make the player stay on it rather than fall
      if (platformCheck == true) {
        player.jumpToggle = false;
        player.velocityY = 0;
        player.boxY =  (platformY - player.boxSize);
      }



      //Left Side
      if (player.boxY >= (platformY - player.boxSize ) && player.boxY <= (platformY + platformW) && player.boxX >= (platformX - player.boxSize) && player.boxX <= (platformX )) {
        player.stopRight();
        player.boxX = (platformX - player.boxSize);
      }
      //Right Side
      if (player.boxY >= (platformY - player.boxSize)  && player.boxY <= (platformY + platformW) && (player.boxX + player.boxSize) >= (platformX + platformL) && player.boxX <= (platformX + platformL)) {
        player.stopLeft();
        player.boxX = (platformX + platformL);
      }



      //Bottom
      if (player.boxY + player.boxSize >= (platformY + platformW)  && player.boxY <= (platformY +  platformW) && player.boxX > (platformX - player.boxSize) && player.boxX < (platformX + platformL)) {
        player.velocityY += 0.5;
        player.boxY = (platformY + platformW);
      }
    }


    public void data() {
      if (levelTimer % 100 == 0) {
        println("Time: " + levelTimer/100 + "s Check: " +   platformX);
      }
    }
  }

public class aPlatform {
  private int visibility, platformStart, platformX, platformY, platformW, platformL, platformDirection, platformColor;
  float platformSpeed;
  private boolean platformCheck, platformSwitch;
  public aPlatform(int visibility, int platformX, int platformY, int platformL, int platformW, int platformColor) {
    this.visibility = visibility;
    this.platformX = platformX;
    this.platformY = platformY;
    this.platformW = platformW;
    this.platformL = platformL;
    this.platformColor = platformColor;
  }

  public aPlatform(int visibility, int platformX, int platformY, int platformL, int platformW, int platformDirection, float platformSpeed, int platformColor) {
    this.visibility = visibility;
    this.platformX = platformX;
    this.platformStart = platformX;
    this.platformDirection = platformDirection;
    this.platformY = platformY;
    this.platformW = platformW;
    this.platformL = platformL;
    this.platformSpeed = platformSpeed;
    this.platformColor = platformColor;
  }

  public void display() {
    fill(platformColor);
    rect(platformX, platformY, platformL, platformW);

    if (platformDirection >= 1 ) {
      if (platformX <= platformDirection && platformSwitch == true) {
        platformX += platformSpeed;
      } else if (platformX >= platformDirection && platformSwitch == true) {
        platformSwitch = false; 
        platformX -= platformSpeed;
      } else if (platformX >= platformStart && platformSwitch == false) {
        platformX -= platformSpeed;
      } else if (platformX <= platformStart && platformSwitch == false) {
        platformSwitch = true;
        platformX += platformSpeed;
      }
    }


    // Check if on top of platform
    if (player.boxY + player.boxSize >= platformY && player.boxY < platformY && player.boxX + player.boxSize > platformX && player.boxX < platformX + platformL) {
      platformCheck = true;
    } else {
      platformCheck = false;
    }

    // If on platform make the player stay on it rather than fall
    if (platformCheck) {
      player.jumpToggle = false;
      player.velocityY = 0;
      player.boxY = platformY - player.boxSize;
    }

    //Bottom
    if (player.boxY + player.boxSize > platformY  +  platformW && player.boxY < platformY +  platformW && player.boxX + player.boxSize  > (platformX) && player.boxX < (platformX + platformL)) {
      player.velocityY = 0;
      player.velocityY += 0.5;
      player.boxY = (platformY + platformW);
    }


    if (player.boxY + player.boxSize > platformY && player.boxY < platformY + platformW) {
      //Left side
      if (player.boxX + player.boxSize > platformX && player.boxX < platformX) {
        player.stopRight();
        player.boxX = platformX - player.boxSize;
      }

      //Right side
      if (player.boxX < platformX + platformL && player.boxX + player.boxSize > platformX + platformL) {
        player.stopLeft();
        player.boxX = platformX + platformL;
      }
    }
  }


  public void data() {
    if (levelTimer % 100 == 0) {
      println("Time: " + levelTimer/100 + "s Check: " +   platformStart);
    }
  }
}

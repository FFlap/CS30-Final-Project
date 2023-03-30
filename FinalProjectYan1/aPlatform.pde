public class aPlatform {
  protected int visibility, platformStart, platformX, platformY, platformW, platformL, platformDistance, platformColor;
  private float platformSpeed;
  protected Boolean platformCheck, platformInfinite;
  private String platformDirection;
  public aPlatform(int visibility, int platformX, int platformY, int platformL, int platformW, int platformColor) {
    this.visibility = visibility;
    this.platformX = platformX;
    this.platformY = platformY;
    this.platformW = platformW;
    this.platformL = platformL;
    this.platformColor = platformColor;
  }

  public aPlatform(int visibility, int platformX, int platformY, int platformL, int platformW, String platformDirection, int platformDistance, float platformSpeed, int platformColor) {
    this.visibility = visibility;
    this.platformX = platformX;
    this.platformDistance = platformDistance;
    this.platformY = platformY;
    this.platformW = platformW;
    this.platformL = platformL;
    this.platformDirection = platformDirection;
    this.platformSpeed = platformSpeed;
    this.platformColor = platformColor;
  }

  public aPlatform(int visibility, int platformX, int platformY, int platformL, int platformW, String platformDirection, boolean platformInfinite, float platformSpeed, int platformColor) {
    this.visibility = visibility;
    this.platformX = platformX;
    this.platformInfinite = platformInfinite;
    this.platformY = platformY;
    this.platformW = platformW;
    this.platformL = platformL;
    this.platformDirection = platformDirection;
    this.platformSpeed = platformSpeed;
    this.platformColor = platformColor;
  }




    public void display() {
      fill(platformColor);
      rect(platformX, platformY, platformL, platformW);

      if (platformDistance >= 1) {

        switch(platformDirection) {
        case "horizontal":
          if (platformStart == 0) {
            platformStart = platformX;
          }

          platformX += platformSpeed;
          if (platformX > platformDistance) {
            platformSpeed = -platformSpeed;
          } else if (platformX < platformStart) {
            platformSpeed = -platformSpeed;
          }
          break;

        case "vertical":
          if (platformStart == 0) {
            platformStart = platformY;
          }
          platformY += platformSpeed;
          if (platformY > platformDistance) {
            platformSpeed = -platformSpeed;
          } else if (platformY < platformStart) {
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
            platformX += platformSpeed;
          } else {
            platformX -= platformSpeed;
          }
          break;

        case "vertical":
          if (platformInfinite) {
            platformY += platformSpeed;
          } else {
            platformY -= platformSpeed;
          }
          break;

        default:

          break;
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
      if (world.levelTimer % 100 == 0) {
        println("Time: " + world.levelTimer/100 + "s Check: " +   platformStart);
      }
    }
  }

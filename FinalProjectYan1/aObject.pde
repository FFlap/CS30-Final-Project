public class aObject {
  private int visibility, setX, setY, setW, setL, setX2, setY2, setTeleportX, setTeleportY, setTeleportX2, setTeleportY2, objectValue;
  private int objectToggle = 1;
  private String setType;

  public aObject(String setType, int visibility, int setX, int setY) {
    this.visibility = visibility;
    this.setX = setX;
    this.setY = setY;
    this.setType = setType;
  }

  public aObject(String setType, int visibility, int setX, int setY, int objectValue) {
    this.visibility = visibility;
    this.setX = setX;
    this.setY = setY;
    this.setType = setType;
    this.objectValue = objectValue;
  }

  public aObject(String setType, int visibility, int setX, int setY, int setL, int setW) {
    this.visibility = visibility;
    this.setX = setX;
    this.setY = setY;
    this.setW = setW;
    this.setL = setL;
    this.setType = setType;
  }

  public aObject(String setType, int visibility, int setX, int setY, int setX2, int setY2, int setTeleportX, int setTeleportY, int setTeleportX2, int setTeleportY2  ) {
    this.visibility = visibility;
    this.setType = setType;
    this.setX = setX;
    this.setY = setY;
    this.setX2 = setX2;
    this.setY2 = setY2;
    this.setTeleportX = setTeleportX;
    this.setTeleportY = setTeleportY;
    this.setTeleportX2 = setTeleportX2;
    this.setTeleportY2 = setTeleportY2;
  }


  public String getType() {
    return setType;
  }

  public void display() { 

    switch(setType) {

    case "deathZone": 
      fill(255, 0, 0);
      rect(setX, setY, setL, setW);
      if (player.boxY >= setY - 15 && player.boxY <= (setY + setL) && player.boxX >= setX && player.boxX <= (setX + setL)) {
        levelTimer = 0;
      }
      break;

    case "portal":
      fill(0, 101, 255);
      rect(setX, setY, 10, 60);
      fill(255);
      rect(setX, setY + 5, 5, 50);

      if (player.boxY <= (setY + 60) && player.boxY >= setY - 5 && player.boxX > setX  - 15 && player.boxX < (setX + 25)) {
        player.boxX = setTeleportX;
        player.boxY = setTeleportY;
      }

      fill(255, 154, 0);
      rect(setX2, setY2, 60, 10);
      fill(255);
      rect(setX2 + 5, setY2, 50, 5);

      if (player.boxY <= setY2 + 15 && player.boxY >= setY2 - 20 && player.boxX >= setX2 - 15 && player.boxX <= setX2 + 50) {
        player.boxX = setTeleportX2;
        player.boxY = setTeleportY2;
      }


      break;

    case "jumpBoost":
      fill(#4DCEFF);
      rect(setX, setY, 35, 9);
      if (player.boxY <= setY + 15 &&  player.boxY >= setY - 25 && player.boxX >= setX - 15 && player.boxX <= setX + 30) {
        player.jump = objectValue;
        player.jump();
        player.jump = 15;
      }

      break;


    case "projectileTarget":
      fill(#FF3E3E);
      rect(setX, setY, setL, setW);
      fill(255);
      rect(setX + 10, setY + 10, setL - 20, setW -20);
      fill(#FF3E3E);
      rect(setX + 15, setY + 15, setL - 30, setW -30);

      for (aPowerup pow : powerups) {
        if (pow.getType() == "projectile") {
          if ( pow.getProjectileY() <= (setY + setW) && pow.getProjectileY() >= (setY - 20) && pow.getProjectileX() >= (setX - 20) && pow.getProjectileX() <= (setX + setL)  + 20) {

            if (objectToggle == 2) {
              objectToggle = 1;
            } else  {
              objectToggle = 2;
            }

            pow.projectileMove = false;
            pow.projectileX = 0;
            pow.projectileY = 0;
          }

        }
      }

      if (objectToggle == 1) {
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


      if (objectToggle == 2) { 

        for (aPlatform plat : platforms) {
          if (plat.visibility == 2) { 
            plat.display();
          }
        }
        //Objects
        for (aObject obj : objects) {
          if (obj.visibility == 2) { 
            obj.display();
          }
        }
      }




      break;

    case "podium": 
      fill(218, 165, 32);
      rect(setX, setY, 35, 9);

      if (player.boxY <= setY + 15 &&  player.boxY >= setY - 25 && player.boxX >= setX - 15 && player.boxX <= setX + 30) {
        level++;
        levelTimer = 0;
        if (level >= levelUnlocked) {
          json = new JSONObject();
          json.setInt("levelUnlocked", level);
          saveJSONObject(json, "data/data.json");
        }
      }


      break;
    default:
      println("Invalid setType");
    }
  }

  public void data() {
    println(setX2);
    println(setY2);
  }
}

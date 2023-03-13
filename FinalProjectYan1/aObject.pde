public class aObject {
  private int setX, setY, setW, setL, setX2, setY2, setTeleportX, setTeleportY, setTeleportX2, setTeleportY2, objectValue;
  private String setType;


  public aObject(String setType, int setX, int setY) {
    this.setX = setX;
    this.setY = setY;
    this.setType = setType;
  }

  public aObject(String setType, int setX, int setY, int objectValue) {
    this.setX = setX;
    this.setY = setY;
    this.setType = setType;
    this.objectValue = objectValue;
  }

  public aObject(String setType, int setX, int setY, int setL, int setW) {
    this.setX = setX;
    this.setY = setY;
    this.setW = setW;
    this.setL = setL;
    this.setType = setType;
  }

  public aObject(String setType, int setX, int setY, int setX2, int setY2, int setTeleportX, int setTeleportY, int setTeleportX2, int setTeleportY2  ) {
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

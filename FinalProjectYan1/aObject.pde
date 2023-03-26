public class aObject {
  private int visibility, setX, setY, setW, setL, setX2, setY2, setL2, setW2, setTeleportX, setTeleportY, setTeleportX2, setTeleportY2, objectValue, setDistance, objectStart;
  private int objectToggle = 1;
  private float objectSpeed;
  private String setType, portalType1, portalType2;

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

  public aObject(String setType, int visibility, int setX, int setY, int setDistance, float objectSpeed) {
    this.visibility = visibility;
    this.setX = setX;
    this.setY = setY;
    this.setType = setType;
    this.setDistance = setDistance;
    this.objectSpeed = objectSpeed;
    this.setX = objectStart;
  }

  public aObject(String setType, int visibility, int setX, int setY, int setL, int setW) {
    this.visibility = visibility;
    this.setX = setX;
    this.setY = setY;
    this.setW = setW;
    this.setL = setL;
    this.setType = setType;
  }

  public aObject(String setType, int visibility, int setX, int setY, int setL, int setW, int setDistance, float objectSpeed) {
    this.visibility = visibility;
    this.setX = setX;
    this.setY = setY;
    this.setW = setW;
    this.setL = setL;
    this.setType = setType;
    this.setDistance = setDistance;
    this.objectSpeed = objectSpeed;
    this.setX = objectStart;
  }

  public aObject(String setType, int visibility, String portalType1, int setX, int setY, String portalType2, int setX2, int setY2, int setTeleportX, int setTeleportY, int setTeleportX2, int setTeleportY2  ) {
    this.visibility = visibility;
    this.setType = setType;
    this.portalType1 = portalType1;
    this.portalType2 = portalType2;
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


  public boolean collisionDetection() {

    if (player.boxY + player.boxSize >= setY && player.boxY <= setY + setW && player.boxX +  player.boxSize >= setX && player.boxX <= setX + setL){
      return true;
    } else {
      return false;
    }
  }
  
    public boolean collisionDetection2() {

    if (player.boxY + player.boxSize >= setY2 && player.boxY <= setY2 + setW2 && player.boxX +  player.boxSize >= setX2 && player.boxX <= setX2 + setL2) {
      return true;
    } else {
      return false;
    }
  }

  public void display() {
    if (setDistance >= 1 ) {
      setX += objectSpeed;
      if (setX > setDistance) {
        objectSpeed = -objectSpeed;
      } else if (setX < objectStart) {
        objectSpeed = -objectSpeed;
      }
    }

    switch(setType) {

    case "deathZone":
      fill(255, 0, 0);
      rect(setX, setY, setL, setW);
      if (collisionDetection()) {
        world.levelTimer = 0;
      }
      break;

    case "portal":

        if (collisionDetection()) {
          player.boxX = setTeleportX;
          player.boxY = setTeleportY;
        }
        
        
        if (collisionDetection2()) {
          player.boxX = setTeleportX2;
          player.boxY = setTeleportY2;
        }
      switch(portalType1) {
      case "RV":
        setL = 10;
        setW = 60;
        fill(0, 101, 255);
        rect(setX, setY, setL, setW);
        fill(255);
        rect(setX + 5, setY + 5, 5, 50);
        break;

      case "LV":
        setL = 10;
        setW = 60;
        fill(0, 101, 255);
        rect(setX, setY, setL, setW);
        fill(255);
        rect(setX, setY + 5, 5, 50);
        break;

      case "UH":

        setL = 60;
        setW = 10;
        fill(0, 101, 255);
        rect(setX, setY, setL, setW);
        fill(255);
        rect(setX2 + 5, setY2, 50, 5);
        break;

      case "DH":
        setL = 60;
        setW = 10;
        fill(0, 101, 255);
        rect(setX, setY, setL, setW);
        fill(255);
        rect(setX2 + 5, setY2 + 5, 50, 5);
        break;

      default:

        println("invalid portal 1 type");
        break;
      }

      switch (portalType2) {

      case "RV":
        setL2 = 10;
        setW2 = 60;
        fill(255, 154, 0);
        rect(setX2, setY2, setL2, setW2);
        fill(255);
        rect(setX2 + 5, setY2 + 5, 5, 50);
        break;

      case "LV":
        setL2 = 10;
        setW2 = 60;
        fill(255, 154, 0);
        rect(setX2, setY2, setL2, setW2);
        fill(255);
        rect(setX2 + 5, setY2 + 5, 5, 50);
        break;

      case "UH":
        setL2 = 60;
        setW2 = 10;
        fill(255, 154, 0);
        rect(setX2, setY2, setL2, setW2);
        fill(255);
        rect(setX2 + 5, setY2, 50, 5);
        break;
      case "DH":
        setL2 = 60;
        setW2 = 10;
        fill(255, 154, 0);
        rect(setX2, setY2, setL2, setW2);
        fill(255);
        rect(setX2 + 5, setY2 + 5, 50, 5);
        break;

      default:

        println("invalid portal 1 type");
        break;
      }

      break;

    case "jumpBoost":
      setL = 35;
      setW = 9;
      fill(#4DCEFF);
      rect(setX, setY, setL, setW);
      if (collisionDetection()) {
        player.jump = objectValue;
        player.jump();
        player.reset();
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
            } else {
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
      setL = 35;
      setW = 9;
      fill(218, 165, 32);
      rect(setX, setY, setL, setW);

      if (collisionDetection()) {
        world.level++;
        world.levelTimer = 0;
        if ( world.level >= levelUnlocked) {
          json = new JSONObject();
          json.setInt("levelUnlocked", world.level);
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

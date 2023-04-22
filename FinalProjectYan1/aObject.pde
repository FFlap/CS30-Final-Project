public class aObject extends aGameObject {
  private int linkedNum, objectValue, setDistance, objectStart;
  private float objectSpeed;
  private String setType, portalType, objectDirection;
  private Boolean objectInfinite;


  public aObject(String setType, int visibility, int setX, int setY) {
    super(visibility, setX, setY, 0, 0);
    this.setType = setType;
  }

  public aObject(String setType, int visibility, int setX, int setY, int objectValue) {
    super(visibility, setX, setY, 0, 0);
    this.setType = setType;
    this.objectValue = objectValue;
  }

  public aObject(String setType, int visibility, int setX, int setY, int setDistance, float objectSpeed) {
    super(visibility, setX, setY, 0, 0);
    this.setType = setType;
    this.setDistance = setDistance;
    this.objectSpeed = objectSpeed;
    this.setX = objectStart;
  }

  public aObject(String setType, int visibility, int setX, int setY, int setL, int setW) {
    super(visibility, setX, setY, setL, setW);
    this.setType = setType;
  }

  public aObject(String setType, int visibility, int setX, int setY, int setL, int setW, String objectDirection, int setDistance, float objectSpeed) {
    super(visibility, setX, setY, setL, setW);
    this.setType = setType;
    this.setDistance = setDistance;
    this.objectDirection = objectDirection;
    this.objectSpeed = objectSpeed;
  }

  public aObject(String setType, int visibility, int setX, int setY, int setL, int setW, String objectDirection, boolean objectInfinite, float objectSpeed) {
    super(visibility, setX, setY, setL, setW);
    this.setType = setType;
    this.objectInfinite = objectInfinite;
    this.objectDirection = objectDirection;
    this.objectSpeed = objectSpeed;
  }

  public aObject(aObject other) {
    super(other.getVisibility(), other.getX(), other.getY(), other.getL(), other.getW());
    this.setType = other.setType;
    this.objectInfinite = other.objectInfinite;
    this.objectDirection = other.objectDirection;
    this.objectSpeed = other.objectSpeed;
  }

  public aObject(String setType, int visibility, String portalType, int setX, int setY, int linkedNum) {
    super(visibility, setX, setY, 0, 0);
    this.setType = setType;
    this.portalType = portalType;
    this.linkedNum = linkedNum;
  }



  public String getType() {
    return setType;
  }


  public int getLinkedNum() {
    return linkedNum;
  }



  public void handleCollision(aProjectile projectile) {
    if ((visibility == 0 || visibility == getViewVisibility()) && projectile.projectileActive) {

      if (projectile.getX() + projectile.getL() > getX() && projectile.getX() < getX() + getL() &&
        projectile.getY() + projectile.getW() > getY() && projectile.getY() < getY() + getW()) {

        if (projectile.setType == "player" && setType == "projectileTarget") {
          if (getViewVisibility() == 2) {
            setViewVisibility(1);
          } else {
            setViewVisibility(2);
          }

          updateVisibility();
          projectile.projectileActive = false;
        }

        if (setType == "projectileBlock") {
          projectile.projectileActive = false;
        }
      }
    }
  }

  public void handleCollision(aPlayer player) {
    if (visibility == 0 || visibility == getViewVisibility()) {
      if (setType == "ladder") {

        if (player.getY() + player.getW() > getY() && player.getY() < getY() && player.getX() + player.getL() > getX() && player.getX() < getX() + getL()) {
          player.allowDown = true;
          player.land();
          player.setY(getY() - player.getW());
        }
      }
      if (player.getX() + player.getL() > getX() && player.getX() < getX() + getL() &&
        player.getY() + player.getW() > getY() && player.getY() < getY() + getW()) {
        player.tempMoveRight = false;
        player.tempMoveLeft = false;
        switch(setType) {
        case "deathZone":

          world.reset();
          break;

        case "portal":

          for (aObject obj : objects) {
            if (obj.getType() == "portal" && getLinkedNum() == obj.getLinkedNum() && (obj.getX() != getX() || obj.getY() != getY())) {
              switch(obj.portalType) {

              case "RV":
                player.setX(obj.getX()+ 30);
                player.setY(obj.getY());
                player.tempMoveRight = true;
                break;

              case "LV":
                player.setX(obj.getX() - 30);
                player.setY(obj.getY());
                player.tempMoveLeft = true;
                break;

              case "UH":
                player.setX(obj.getX());
                player.setY(obj.getY() - 30);
                player.jumpToggle = false;
                player.jump();
                break;

              case "DH":
                player.setX(obj.getX());
                player.setY(obj.getY() + 30);
                break;

              default:

                println("invalid portal type");
                break;
              }

              break;
            }
          }



          break;

        case "jumpBoost":
          player.jump = objectValue;
          player.jumpToggle = false;
          player.jump();
          player.reset();
          break;

        case "ladder":

          player.velocityY = 0;
          player.ladder = true;


          break;


        case "projectileTarget":
        case "projectileBlock":
          //NOTE: I DID NOT CREATE any code relating to xOverlap and yOverlap. Concept of the collsion retreived from: https://gamedev.stackexchange.com/questions/29786/a-simple-2d-rectangle-collision-algorithm-that-also-determines-which-sides-that
          float xOverlap = Math.min(player.getX() + player.getL() - getX(), getX() + getL() - player.getX());
          float yOverlap = Math.min(player.getY() + player.getW() - getY(), getY() + getW() - player.getY());

          if (xOverlap > 0 && yOverlap > 0) {
            if (xOverlap < yOverlap) {
              // Resolve the collision horizontally
              if (player.getX() < getX()) {
                player.stopRight();
                player.setX(getX() - player.getL());
              } else {
                player.stopLeft();
                player.setX(getX() + getL());
              }
            } else {
              // Resolve the collision vertically
              if (player.getY() < getY()) {
                player.land();
                player.setY(getY() - player.getW());
              } else {
                player.velocityY = 0;
                player.setY(getY() + getW());
              }
            }
          }

          break;

        case "button":

          setViewVisibility(2);
          updateVisibility();
          break;
        case "podium":
          saveData();
          if (world.level == 9 && world.world == 2) {
            world.world = 1;
            world.level = 0;
            GUI.levelSelect = 0;
            GUI.setWindow(700, 700);
            world.spawn();
            break;
          } else if (world.level == 9 && world.world == 1) {
            world.world++;
            world.level = 0;
          } 


          world.level++;
          world.spawn();
          world.statsReset();

          break;

        default:
          println("Invalid setType");
          break;
        }
      }
    }
  }


  public void saveData() {
    GUI.getData();

    // Set level data
    JSONObject levelData = new JSONObject();
    levelData.setFloat("levelTime", world.levelTimer);
    levelData.setInt("deaths", world.deathStat);
    levelData.setInt("jumps", world.jumpStat);
    levelData.setInt("left", world.leftStat);
    levelData.setInt("right", world.rightStat);

    JSONArray worldArray = saveData.getJSONArray(world.world - 1);
    JSONArray levelArray = worldArray.getJSONArray(world.level - 1);

    if (levelArray.size() >= 10) {
      for (int i = levelArray.size() - 1; i > 0; i--) {
        levelArray.setJSONObject(i, levelArray.getJSONObject(i - 1));
      }
      levelArray.setJSONObject(0, levelData);
    } else {
      levelArray.append(levelData);
    }

    saveJSONArray(saveData, "data/stats.json");


    if (world.world > GUI.worldUnlocked) {
      println(GUI.worldUnlocked);
      json.setInt("worldUnlocked", world.world + 1);
      json.setInt("levelUnlocked", world.level + 1);
      saveJSONObject(json, "data/data.json");
    } else if (world.world == GUI.worldUnlocked) {
      if (world.level + 1 >= GUI.levelUnlocked && world.level + 1 != 10) {
        json = new JSONObject();
        json.setInt("worldUnlocked", world.world);
        json.setInt("levelUnlocked", world.level + 1);
        saveJSONObject(json, "data/data.json");
      }


      if (world.level == 9 && world.world == 1) {
        json = new JSONObject();
        json.setInt("levelUnlocked", 1);
        json.setInt("worldUnlocked", world.world + 1);
        saveJSONObject(json, "data/data.json");
      }
    }
  }


  public void alternatingTarget(int x, int y, int l, int w, int copies) {
    if (copies < 0) {
      return;
    }


    if (copies % 2 == 0) {
      fill(255);
      rect(x, y, l, w);
    } else {
      fill(#FF3E3E);
      rect(x, y, l, w);
    }

    alternatingTarget(x + 5, y + 5, l - 10, w - 10, copies -1);
  }

  public void multipleSteps(int x, int y, int l, int copies) {
    if (copies < 0) {
      return;
    }
    stroke(#3E290A);
    line(x, y + 5, x + l, y + 5);

    multipleSteps(x, y + 10, l, copies -1);
  }





  @Override
    public void display() {

    if (visibility == 0 || visibility == getViewVisibility()) {
      noStroke();
      if (setDistance >= 1 ) {

        switch(objectDirection) {
        case "horizontal":
          if (objectStart == 0) {
            objectStart = setX;
          }

          setX += objectSpeed;
          if (setX > setDistance) {
            objectSpeed = -objectSpeed;
          } else if (setX < objectStart) {
            objectSpeed = -objectSpeed;
          }
          break;

        case "vertical":
          if (objectStart == 0) {
            objectStart = setY;
          }
          setY += objectSpeed;
          if (setY > setDistance) {
            objectSpeed = -objectSpeed;
          } else if (setY < objectSpeed) {
            objectSpeed = -objectSpeed;
          }
          break;

        default:

          break;
        }
      }


      if (objectDirection != null && objectInfinite != null ) {

        switch(objectDirection) {
        case "horizontal":
          if (objectInfinite) {
            setX += objectSpeed;
          } else {
            setX -= objectSpeed;
          }
          break;

        case "vertical":
          if (objectInfinite) {
            setY += objectSpeed;
          } else {
            setY -= objectSpeed;
          }
          break;

        default:

          break;
        }
      }


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
        break;

      case "portal":
        switch(linkedNum) {
        case 0:
          fill(#C062E3);
          break;
        case 1:

          fill(#237DF7);
          break;
        }


        switch(portalType) {

        case "RV":
          setL = 10;
          setW = 60;
          rect(setX, setY, setL, setW);
          fill(255);
          rect(setX + 5, setY + 5, 5, 50);
          break;

        case "LV":
          setL = 10;
          setW = 60;
          rect(setX, setY, setL, setW);
          fill(255);
          rect(setX, setY + 5, 5, 50);
          break;

        case "UH":
          setL = 60;
          setW = 10;
          rect(setX, setY, setL, setW);
          fill(255);
          rect(setX + 5, setY, 50, 5);
          break;

        case "DH":
          setL = 60;
          setW = 10;
          rect(setX, setY, setL, setW);
          fill(255);
          rect(setX + 5, setY + 5, 50, 5);
          break;

        default:
          println("invalid portal type");
          break;
        }



        break;

      case "jumpBoost":
        setL = 35;
        setW = 10;
        fill(#4DCEFF);
        rect(setX, setY, setL, setW);
        break;


      case "projectileTarget":
        alternatingTarget(setX, setY, setL, setW, 3);
        break;

      case "projectileBlock":
        fill(#868686);
        rect(setX, setY, setL, setW);

        break;


      case "ladder":
        fill(#C1740E);
        rect(setX, setY, setL, setW);
        multipleSteps(setX, setY, setL, (setW / 5) / 2 - 1);


        if (world.levelTimer % 25 == 0) {
          for (aPlayer player : players) {
            player.ladder = false;
            player.allowDown = false;
          }
        }


        break;



      case "button":
        setL = 35;
        setW = 10;
        fill(#ACC3DE);
        rect(setX, setY, setL, setW);
        setViewVisibility(1);
        updateVisibility();
        break;

      case "podium":
        setL = 35;
        setW = 10;
        fill(218, 165, 32);
        rect(setX, setY, setL, setW);
        break;
      default:
        println("Invalid setType");
      }
    }
  }

  public void data() {
    println(getVisibility());
    println(getViewVisibility());
  }
}

public class aWorld {
  private  float cameraX, cameraY;
  private int worldWidth;
  private int world = 2;
  private int level = 2;
  private float levelTimer;

  public void checkCollisions() {

    for (aPlayer player : players) {

      for (aObject object : objects) {
        if (player.collidesWith(object)) {
          object.handleCollision(player);
        } else {
          player.ladder = false;
        }
      }

      for (aPlatform platform : platforms) {
        if (player.collidesWith(platform)) {
          platform.handleCollision(player);
        }
      }

      for (aPowerup powerup : powerups) {
        if (player.collidesWith(powerup)) {
          powerup.handleCollision(player);
        }
      }
    }
  }


  public void display() {
    levelTimer++;

    pushMatrix();
    cameraFollow(players.get(0));
    translate(-cameraX, -cameraY);

    for (aPlatform plat : platforms) {

      plat.display();
    }

    for (aObject obj : objects) {
      obj.display();
    }


    for (aPowerup powerup : powerups) {
      powerup.display();
    }


    for (aPlayer player : players) {
      player.display();
    }



    checkCollisions();
    popMatrix();
  }



  public void cameraFollow(aPlayer player) {
    float cameraSpeed = 0.015;
    float x = player.getX() - (width / 2) + (player.getL() / 2);
    float y = player.getY() - (height / 2) + (player.getW() / 2);

    cameraX = lerp(cameraX, x, cameraSpeed);
    cameraY = 0;

    cameraX = constrain(cameraX, 0, width - worldWidth);
  }


  public void checkTimer() {

    switch(level) {
    case 9:

      if (levelTimer == 700) {
        platforms.add(new aPlatform(0, 0, 660, 200, 50, #3AA54B));
        platforms.add(new aPlatform(0, 510, 660, 200, 50, #3AA54B));
      }
      if (levelTimer >= 700 && levelTimer <= 900) {
        fill(#A07F12);
        triangle(300, 470, 300, 550, 240, 510);
        fill(#A07F12);
        rect(300, 500, 140, 20);
        fill(#A07F12);
        triangle(410, 470, 410, 550, 470, 510);
      }

      if (levelTimer == 900) {
        objects.add(new aObject("deathZone", 0, 200, 655, 310, 6));
        objects.add(new aObject("deathZone", 0, 0, 0, 700, 6));
        platforms.add(new aPlatform(0, 0, 700, 200, 50, "vertical", false, 3, #008080));
        platforms.add(new aPlatform(0, 510, 700, 200, 50, "vertical", false, 3, #008080));
        platforms.add(new aPlatform(0, 220, 350, 270, 50, #008080));
      }



      if (levelTimer == 1150) {
        objects.add(new aObject("deathZone", 0, 0, 655, 700, 6));
        objects.add(new aObject("deathZone", 0, 0, 0, 700, 6));
        objects.add(new aObject("deathZone", 0, 220, 660, 210, 150, "vertical", false, 3));
        objects.add(new aObject("deathZone", 0, 1010, 300, 50, 150, "horizontal", false, 3));
        objects.add(new aObject("deathZone", 0, 220, -600, 220, 150, "vertical", true, 3));
        objects.add(new aObject("deathZone", 0, 260, -850, 230, 150, "vertical", true, 3));
        objects.add(new aObject("deathZone", 0, -1000, 300, 50, 150, "horizontal", true, 3));
        objects.add(new aObject("deathZone", 0, 260, -1250, 230, 150, "vertical", true, 3));
        objects.add(new aObject("deathZone", 0, 220, -1500, 110, 150, "vertical", true, 3));
        objects.add(new aObject("deathZone", 0, 400, -1500, 110, 150, "vertical", true, 3));
      }

      if (levelTimer > 1800 && levelTimer < 2000) {

        fill(#A07F12);
        rect(300, 230, 140, 20);
        fill(#A07F12);
        triangle(410, 200, 410, 280, 470, 240);
      }
      if (levelTimer == 1900) {
        objects.add(new aObject("podium", 2, 347, 342));
        objects.add(new aObject("deathZone", 0, -750, 160, 110, 800, "horizontal", true, 4.2));
      }

      if (levelTimer == 2000) {
        platforms.add(new aPlatform(0, 530, 300, 200, 50, #008080));
      }
      if (levelTimer == 2050) {
        platforms.add(new aPlatform(0, 370, 230, 200, 50, #008080));
      }
      if (levelTimer == 2080) {
        platforms.add(new aPlatform(0, 230, 150, 100, 50, #008080));
      }


      if (levelTimer == 2200) {
        platforms.add(new aPlatform(0, 410, 550, 100, 50, #008080));
      }

      if (levelTimer == 2250) {
        platforms.add(new aPlatform(0, 230, 520, 100, 50, #008080));
        powerups.add(new aPowerup("levelUnlock", 0, 280, 501));
        objects.add(new aObject("deathZone", 0, 900, 300, 110, 800, "horizontal", false, 3.4));
        objects.add(new aObject("deathZone", 0, 900, 0, 110, 180, "horizontal", false, 3.4));
      }
      if (levelTimer == 2290) {
        platforms.add(new aPlatform(0, 110, 445, 100, 50, #008080));
      }

      if (levelTimer == 2100 || levelTimer == 2125 || levelTimer == 2150 || levelTimer == 2320 || levelTimer == 2340 || levelTimer == 2360) {
        platforms.remove(6);
      }


      break;

    default:

      break;
    }
  }

  public void multipleX(int index, int distanceApart, int copies) {
    if (copies <= 0) {
      return;
    }

    aObject originalObject = objects.get(index);
    aObject newObject = new aObject(originalObject);
    newObject.setX += distanceApart;

    objects.add(newObject);
    multipleX(objects.size() - 1, distanceApart, copies - 1);
  }

  public void rightStair(int stairX, int stairY, int stairHeight) {
    int boxSize = 40;
    if (stairHeight == 0) {
      return;
    }

    rightStair(stairX + boxSize, stairY - boxSize, stairHeight - 1);
    platforms.add(new aPlatform(0, stairX, stairY, (boxSize * stairHeight), boxSize, #008080));
  }



  public void load() {


    if (levelTimer <= 0.5) {
      LevelReset();
      if (world == 1) {

        platforms.add(new aPlatform(0, -40, 660, 888, 45, #32CD32));
        worldWidth = 700;
        switch(level) {

        case -1:
          players.get(0).setX(335);
          players.get(0).setY(380);
          powerups.add(new aPowerup("changeWindow", 0, 650, 640));
          objects.add(new aObject("ladder", 0, 230, 360, 100, 200));
          platforms.add(new aPlatform(2, 410, 470, 260, 50, #008080));
          platforms.add(new aPlatform(0, 200, 560, 300, 60, "horizontal", 400, 1, 128));
          //objects.add(new aObject("deathZone", 0, 200, 230, 300, 60, "horizontal", 400, 1));
          platforms.add(new aPlatform(0, 400, 115, 60, 200, "vertical", false, 1, 128));

          break;
        case 0:
          players.get(0).setX(335);
          players.get(0).setY(640);
          break;

        case 1:
          players.get(0).setX(50);
          players.get(0).setY(640);
          //Platforms
          platforms.add(new aPlatform(0, 335, 360, 38, 300, 128));
          platforms.add(new aPlatform(0, 140, 600, 100, 60, 128));
          platforms.add(new aPlatform(0, 450, 580, 120, 30, 128));
          platforms.add(new aPlatform(0, 590, 500, 120, 30, 128));
          platforms.add(new aPlatform(0, 500, 450, 30, 30, 128));
          platforms.add(new aPlatform(0, 415, 400, 30, 30, 128));
          //Death Zone
          objects.add(new aObject("deathZone", 0, 240, 655, 95, 5));

          //Portal
          objects.add(new aObject("portal", 0, "LV", 327, 553, 0));
          objects.add(new aObject("portal", 0, "UH", 374, 650, 0));
          //End
          objects.add(new aObject("podium", 0, 336, 351));


          break;

        case 2:
          players.get(0).setX(50);
          players.get(0).setY(640);
          //Platforms
          platforms.add(new aPlatform(0, 450, 580, 120, 30, 128));
          platforms.add(new aPlatform(0, 40, 480, 120, 30, 128));
          platforms.add(new aPlatform(0, 220, 330, 120, 30, 128));
          //High Jump
          powerups.add(new aPowerup("highJump", 0, 500, 560, 15));
          //End
          objects.add(new aObject("podium", 0, 260, 321));
          break;

        case 3:
          players.get(0).setX(330);
          players.get(0).setY(640);
          platforms.add(new aPlatform(0, 230, 570, 100, 40, #008080));
          platforms.add(new aPlatform(0, 380, 500, 120, 40, #008080));
          platforms.add(new aPlatform(0, 270, 400, 120, 40, #008080));
          platforms.add(new aPlatform(0, -1, 516, 120, 40, #008080));
          platforms.add(new aPlatform(0, -1, 220, 120, 40, #008080));
          platforms.add(new aPlatform(0, 119, 70, 150, 40, #008080));
          platforms.add(new aPlatform(0, 119, 110, 50, 150, #CBC921));
          powerups.add(new aPowerup("highJump", 0, 45, 496, 15 ));
          objects.add(new aObject("portal", 0, "LV", 690, 600, 0));
          objects.add(new aObject("portal", 0, "UH", 0, 210, 0 ));
          objects.add(new aObject("podium", 0, 230, 62));
          break;
        case 4:

          players.get(0).setX(50);
          players.get(0).setY(640);
          platforms.add(new aPlatform(0, -1, 90, 260, 40, #008080));
          platforms.add(new aPlatform(0, -1, 433, 200, 40, #008080));
          platforms.add(new aPlatform(0, 450, 610, 150, 50, #008080));
          platforms.add(new aPlatform(0, 560, 450, 150, 40, #008080));
          platforms.add(new aPlatform(0, 330, 250, 150, 40, #008080));
          powerups.add(new aPowerup("highJump", 0, 170, 413, 13));
          powerups.add(new aPowerup("highJump", 0, 670, 430, 15));
          objects.add(new aObject("deathZone", 0, 600, 655, 100, 5));
          objects.add(new aObject("deathZone", 0, 300, 655, 150, 5));
          objects.add(new aObject("portal", 0, "LV", 690, 530, 0));
          objects.add(new aObject("portal", 0, "RV", 0, 372, 0));
          objects.add(new aObject("podium", 0, 50, 82));
          break;
        case 5:
          players.get(0).setX(305);
          players.get(0).setY(640);
          powerups.add(new aPowerup("glasses", 0, 650, 640));

          platforms.add(new aPlatform(2, 480, 570, 260, 50, #008080));
          platforms.add(new aPlatform(2, 330, 500, 100, 50, #008080));
          platforms.add(new aPlatform(2, 170, 450, 100, 50, #008080));
          platforms.add(new aPlatform(2, 99, 350, 100, 50, #008080));
          platforms.add(new aPlatform(2, 0, 280, 100, 120, #008080));
          platforms.add(new aPlatform(2, 154, 0, 50, 235, #008080));
          platforms.add(new aPlatform(2, 154, 0, 50, 235, #008080));

          platforms.add(new aPlatform(0, 154, 230, 260, 50, #008080));
          objects.add(new aObject("podium", 0, 360, 222));

          break;

        case 6:

          players.get(0).setX(10);
          players.get(0).setY( 130);
          powerups.add(new aPowerup("levelUnlock", 0, 480, 95));

          objects.add(new aObject("deathZone", 1, 150, 329, 265, 150));
          objects.add(new aObject("deathZone", 1, 0, 460, 400, 20));
          objects.add(new aObject("deathZone", 0, 375, 0, 40, 330));
          objects.add(new aObject("jumpBoost", 2, 90, 441, 15));
          objects.add(new aObject("jumpBoost", 2, 325, 291, 15));
          objects.add(new aObject("podium", 2, 180, 142));
          platforms.add(new aPlatform(2, 130, 300, 290, 150, #008080));
          platforms.add(new aPlatform(2, 0, 450, 416, 50, #008080));

          objects.add(new aObject("jumpBoost", 0, 660, 482, 19));
          objects.add(new aObject("portal", 0, "LV", 690, 530, 0));
          objects.add(new aObject("portal", 0, "RV", 0, 372, 0));

          platforms.add(new aPlatform(1, 150, 310, 50, 20, #008080));

          platforms.add(new aPlatform(0, -5, 150, 260, 50, #008080));
          platforms.add(new aPlatform(0, 415, 0, 30, 660, #008080));
          platforms.add(new aPlatform(0, 440, 560, 50, 40, #008080));
          platforms.add(new aPlatform(0, 530, 490, 180, 40, #008080));
          platforms.add(new aPlatform(0, 440, 150, 100, 40, #008080));
          platforms.add(new aPlatform(0, 0, 479, 416, 181, #008080));
          break;
        case 7:
          players.get(0).setX(330);
          players.get(0).setY(640);
          powerups.add(new aPowerup("projectile", 0, 345, 562, 6));
          platforms.add(new aPlatform(0, 230, 580, 260, 30, #008080));

          //Check 1
          platforms.add(new aPlatform(1, 230, 380, 260, 30, #008080));
          platforms.add(new aPlatform(1, 558, 325, 100, 40, #008080));
          platforms.add(new aPlatform(1, 280, 160, 150, 40, #008080));

          objects.add(new aObject("projectileTarget", 0, 280, 190, 150, 40));
          objects.add(new aObject("podium", 1, 335, 151));



          //Check 2
          platforms.add(new aPlatform(2, 280, 480, 100, 40, #B7060B));
          platforms.add(new aPlatform(2, 461, 240, 100, 40, #B7060B));
          break;
        case 8:

          players.get(0).setX(330);
          players.get(0).setY(640);
          platforms.add(new aPlatform(0, 120, 580, 200, 50, "horizontal", 380, 1, #008080));
          platforms.add(new aPlatform(0, 0, 313, 200, 50, #008080));
          platforms.add(new aPlatform(0, 535, 480, 200, 50, #008080));
          platforms.add(new aPlatform(0, 0, 400, 200, 50, "horizontal", 380, 1, #008080));
          platforms.add(new aPlatform(0, 40, 215, 200, 50, "horizontal", 380, 2, #008080));
          platforms.add(new aPlatform(0, 0, 120, 200, 50, #008080));
          platforms.add(new aPlatform(0, 340, 120, 30, 50, #008080));
          objects.add(new aObject("deathZone", 0, 200, 140, 300, 30));
          objects.add(new aObject("podium", 0, 50, 110));

          break;

        case 9:
          players.get(0).setX(330);
          players.get(0).setY(640);
          objects.add(new aObject("deathZone", 0, 0, 120, 500, 150, "vertical", true, 3));
          objects.add(new aObject("deathZone", 0, 300, -150, 500, 150, "vertical", true, 3));
          objects.add(new aObject("deathZone", 0, 0, -450, 500, 150, "vertical", true, 3));
          objects.add(new aObject("deathZone", 0, 0, -750, 300, 150, "vertical", true, 3));
          objects.add(new aObject("deathZone", 0, 500, -750, 300, 150, "vertical", true, 3));
          objects.add(new aObject("deathZone", 0, 30, -1100, 640, 150, "vertical", true, 3));
          objects.add(new aObject("deathZone", 0, 0, -1350, 80, 150, "vertical", true, 3));
          multipleX(6, 130, 10);
          break;

        case 10:
          players.get(0).setX(330);
          players.get(0).setY( 640);
          break;

        default:

          break;
        }
      }

      if (world == 2) {

        platforms.add(new aPlatform(0, -40, 760, 888, 45, #32CD32));
        worldWidth = 800;
        switch(level) {
        case 1:
          players.get(0).setX(10);
          players.get(0).setY(740);
          platforms.add(new aPlatform(0, 330, 710, 200, 50, #008080));
          powerups.add(new aPowerup("flight", 0, 420, 690));
          powerups.add(new aPowerup("levelUnlock", 0, 680, 45));
          objects.add(new aObject("deathZone", 0, 0, 500, 600, 100));
          objects.add(new aObject("deathZone", 0, 80, 250, 820, 100));
          objects.add(new aObject("deathZone", 0, 590, 0, 80, 110, "horionzal", 800, 3));
          objects.add(new aObject("podium", 2, 100, 750));
          objects.add(new aObject("jumpBoost", 2, 420, 700, 10));
          break;

        case 2:
          rightStair(520, 720, 7);
          objects.add(new aObject("ladder", 0, 120, 320, 480, 100));
          platforms.add(new aPlatform(0, 200, 530, 100, 300, #008080));
          // objects.add(new aObject("deathZone", 0, 120, 280, 480, 40));
          break;
        default:
          break;
        }
      }
    }
  }


  public void LevelReset() {
    if (world == 1) {
      GUI.setWindow(700, 700);
    } else if (world == 2) {
      GUI.setWindow(800, 800);
    }
    platforms.clear();
    objects.clear();
    powerups.clear();
    for (aPlayer player : players) {
      player.reset();
    }
  }
}

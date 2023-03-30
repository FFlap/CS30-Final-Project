public class aWorld {
  private int wave;
  private int world = 1;
  private int level = -1;
  private float levelTimer;



  public void display() {

    levelTimer++;
    for (aPlatform plat : platforms) {
      if (plat.visibility == 0) {
        plat.display();
      }
    }
    //Objects
    for (aObject obj : objects) {
      if (obj.visibility == 0) {
        obj.display();
      }
    }

    //Powerup
    for (aPowerup pow : powerups) {
      if ( pow.visibility == 0) {
        pow.display();
      }
    }
  }

  public void checkWaves() {

    switch(level) {
    case 9:

      if (levelTimer == 700) {
        platforms.add(new aPlatform(0, 0, 660, 200, 50, #3AA54B));
        platforms.add(new aPlatform(0, 510, 660, 200, 50, #3AA54B));
      }
      if (levelTimer >= 700 && wave == 1) {
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
        wave = 2;
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
        wave = 3;
      }

      if (levelTimer > 1800 && levelTimer < 2000) {

        fill(#A07F12);
        rect(300, 230, 140, 20);
        fill(#A07F12);
        triangle(410, 200, 410, 280, 470, 240);
      }
      if (levelTimer == 1900) {
        objects.add(new aObject("podium", 1, 347, 342));
        objects.add(new aObject("deathZone", 0, -750, 160, 110, 800, "horizontal", true, 4.2));
        wave = 4;
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
        platforms.remove(5);
      }


      break;

    default:

      break;
    }
  }

  public void multiple(ArrayList<aObject> objects, int index, int distanceApart, int copies) {
    if (copies <= 0 || index < 0 || index >= objects.size()) {
      return;
    }

    aObject originalObject = objects.get(index);
    aObject newObject = new aObject(originalObject);
    newObject.setX += distanceApart;

    objects.add(newObject);
    multiple(objects, objects.size() - 1, distanceApart, copies - 1);
  }


  public void load() {


    if (levelTimer == 0) {
      LevelReset();
      if (world != 1) {
        return;
      }
      switch(level) {

      case -1:
        player.boxX = 335;
        player.boxY = 160;
        platforms.add(new aPlatform(0, 200, 560, 300, 60, "horizontal", 400, 1, 128));
        platforms.add(new aPlatform(0, 400, 115, 60, 200, "vertical", false, 1, 128));
        platforms.add(new aSlope(0, 200, 350, 300, 300, "right", 255));
        break;
      case 0:
        player.boxX = 335;
        player.boxY = 640;
        break;

      case 1:
        player.boxX = 50;
        player.boxY = 640;
        //Platforms
        platforms.add(new aPlatform(0, 335, 360, 38, 300, 128));
        platforms.add(new aPlatform(0, 140, 600, 100, 60, 128));
        platforms.add(new aPlatform(0, 450, 580, 120, 30, 128));
        platforms.add(new aPlatform(0, 590, 500, 120, 30, 128));
        platforms.add(new aPlatform(0, 500, 450, 30, 30, 128));
        platforms.add(new aPlatform(0, 415, 400, 30, 30, 128));
        //Death Zone
        objects.add(new aObject("deathZone", 0, 240, 655, 87, 5));

        //Portal
        objects.add(new aObject("portal", 0, "LV", 327, 553, "UH", 580, 660, 390, 645, 170, 580));

        //End
        objects.add(new aObject("podium", 0, 327, 351));


        break;

      case 2:
        player.boxX = 50;
        player.boxY = 640;
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
        player.boxX = 330;
        player.boxY = 640;
        platforms.add(new aPlatform(0, 230, 570, 100, 40, #008080));
        platforms.add(new aPlatform(0, 380, 500, 120, 40, #008080));
        platforms.add(new aPlatform(0, 270, 400, 120, 40, #008080));
        platforms.add(new aPlatform(0, -1, 516, 120, 40, #008080));
        platforms.add(new aPlatform(0, -1, 220, 120, 40, #008080));
        platforms.add(new aPlatform(0, 119, 70, 150, 40, #008080));
        platforms.add(new aPlatform(0, 119, 110, 50, 150, #CBC921));
        powerups.add(new aPowerup("highJump", 0, 45, 496, 15 ));
        objects.add(new aObject("portal", 0, "LV", 690, 600, "UH", 0, 220, 70, 180, 650, 640));
        objects.add(new aObject("podium", 0, 230, 62));
        break;
      case 4:

        player.boxX = 50;
        player.boxY = 640;
        platforms.add(new aPlatform(0, -1, 90, 260, 40, #008080));
        platforms.add(new aPlatform(0, -1, 433, 200, 40, #008080));
        platforms.add(new aPlatform(0, 450, 610, 150, 50, #008080));
        platforms.add(new aPlatform(0, 560, 450, 150, 40, #008080));
        platforms.add(new aPlatform(0, 330, 250, 150, 40, #008080));
        powerups.add(new aPowerup("highJump", 0, 170, 413, 13));
        powerups.add(new aPowerup("highJump", 0, 670, 430, 15));
        objects.add(new aObject("deathZone", 0, 600, 655, 100, 5));
        objects.add(new aObject("deathZone", 0, 300, 655, 150, 5));
        objects.add(new aObject("portal", 0, "LV", 690, 530, "RV", 0, 372, 40, 420, 550, 580));
        objects.add(new aObject("podium", 0, 50, 82));
        break;
      case 5:
        player.boxX = 305;
        player.boxY = 640;
        powerups.add(new aPowerup("glasses", 0, 650, 640));

        platforms.add(new aPlatform(1, 480, 570, 260, 50, #008080));
        platforms.add(new aPlatform(1, 330, 500, 100, 50, #008080));
        platforms.add(new aPlatform(1, 170, 450, 100, 50, #008080));
        platforms.add(new aPlatform(1, 99, 350, 100, 50, #008080));
        platforms.add(new aPlatform(1, 0, 280, 100, 120, #008080));
        platforms.add(new aPlatform(1, 154, 0, 50, 235, #008080));
        platforms.add(new aPlatform(1, 154, 0, 50, 235, #008080));

        platforms.add(new aPlatform(0, 154, 230, 260, 50, #008080));
        objects.add(new aObject("podium", 0, 360, 222));

        break;

      case 6:

        player.boxX = 10;
        player.boxY = 130;
        powerups.add(new aPowerup("levelUnlock", 0, 480, 95));

        objects.add(new aObject("deathZone", 0, 150, 329, 230, 150));
        objects.add(new aObject("deathZone", 0, 0, 460, 400, 20));
        objects.add(new aObject("deathZone", 0, 375, 0, 40, 480));
        objects.add(new aObject("jumpBoost", 1, 90, 441, 15));
        objects.add(new aObject("jumpBoost", 1, 325, 291, 15));
        objects.add(new aObject("podium", 1, 180, 142));
        platforms.add(new aPlatform(1, 130, 300, 290, 150, #008080));
        platforms.add(new aPlatform(1, 0, 450, 416, 50, #008080));

        objects.add(new aObject("jumpBoost", 0, 660, 482, 20));
        objects.add(new aObject("portal", 0, "LV", 690, 530, "RV", 0, 372, 40, 420, 550, 580));


        platforms.add(new aPlatform(0, -5, 150, 260, 50, #008080));
        platforms.add(new aPlatform(0, 415, 0, 30, 660, #008080));
        platforms.add(new aPlatform(0, 440, 560, 50, 40, #008080));
        platforms.add(new aPlatform(0, 530, 490, 180, 40, #008080));
        platforms.add(new aPlatform(0, 440, 150, 100, 40, #008080));
        platforms.add(new aPlatform(0, 0, 479, 416, 181, #008080));
        break;
      case 7:
        player.boxX = 330;
        player.boxY = 640;
        powerups.add(new aPowerup("projectile", 0, 345, 562, 6));


        //Check 1
        platforms.add(new aPlatform(1, 230, 380, 260, 30, #008080));
        platforms.add(new aPlatform(1, 558, 325, 100, 40, #008080));
        platforms.add(new aPlatform(1, 280, 160, 150, 40, #008080));

        objects.add(new aObject("projectileTarget", 0, 280, 190, 150, 40));
        objects.add(new aObject("podium", 1, 335, 151));



        //Check 2
        platforms.add(new aPlatform(2, 280, 480, 100, 40, #B7060B));
        platforms.add(new aPlatform(2, 461, 240, 100, 40, #B7060B));
        platforms.add(new aPlatform(0, 230, 580, 260, 30, #008080));
        break;
      case 8:

        player.boxX = 330;
        player.boxY = 640;
        platforms.add(new aPlatform(0, 120, 580, 200, 50, "horizontal", 380, 1, #008080));
        platforms.add(new aPlatform(0, 220, 490, 200, 50, "horizontal", 380, 1, #008080));
        platforms.add(new aPlatform(0, 320, 400, 200, 50, "horizontal", 380, 1, #008080));
        platforms.add(new aPlatform(0, 40, 350, 200, 50, "horizontal", 380, 2, #008080));
        platforms.add(new aPlatform(0, 220, 260, 200, 50, "horizontal", 380, 3, #008080));
        objects.add(new aObject("podium", 0, 335, 253));

        break;

      case 9:
        player.boxX = 330;
        player.boxY = 640;
        wave = 1;
        objects.add(new aObject("deathZone", 0, 0, 120, 500, 150, "vertical", true, 3));
        objects.add(new aObject("deathZone", 0, 300, -150, 500, 150, "vertical", true, 3));
        objects.add(new aObject("deathZone", 0, 0, -450, 500, 150, "vertical", true, 3));
        objects.add(new aObject("deathZone", 0, 0, -750, 300, 150, "vertical", true, 3));
        objects.add(new aObject("deathZone", 0, 500, -750, 300, 150, "vertical", true, 3));
        objects.add(new aObject("deathZone", 0, 30, -1100, 640, 150, "vertical", true, 3));
        objects.add(new aObject("deathZone", 0, 0, -1350, 80, 150, "vertical", true, 3));
        multiple(objects, 6, 130, 10);
        break;

      case 10:
        player.boxX = 330;
        player.boxY = 640;
        break;

      default:

        break;
      }
    }
  }


  public void LevelReset() {
    platforms.clear();
    objects.clear();
    powerups.clear();
    player.reset();
    wave = 1;
  }
}

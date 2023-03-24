public class aWorld {
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


  public void load() {


    if (levelTimer == 0) {
      LevelReset();
      if (world != 1) {
        return;
      }
      switch(level) {

      case -1:
        player.boxX = 335;
        player.boxY = 640;

        platforms.add(new aPlatform(0, 200, 560, 300, 60, 400, 1, 128));
        platforms.add(new aPlatform(0, 400, 360, 60, 200, 128));
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
        objects.add(new aObject("portal", 0, 327, 553, 580, 660, 373, 645, 170, 580));

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
        objects.add(new aObject("portal", 0, 690, 600, 0, 220, 70, 180, 650, 640));
        objects.add(new aObject("podium", 0, 230, 62));
        break;
      case 4:

        player.boxX = 50;
        player.boxY = 640;
        platforms.add(new aPlatform(0, -1, 90, 260, 40, #008080));
        platforms.add(new aPlatform(0, -1, 433, 200, 40, #008080));
        platforms.add(new aPlatform(0, 450, 610, 150, 50, #008080));
        platforms.add(new aPlatform(0, 560, 450, 150, 40, #008080));
        platforms.add(new aPlatform(0, 330, 330, 150, 40, #008080));
        powerups.add(new aPowerup("highJump", 0, 170, 413, 15));
        powerups.add(new aPowerup("highJump", 0, 350, 310, 18));
        objects.add(new aObject("deathZone", 0, 600, 655, 100, 5));
        objects.add(new aObject("deathZone", 0, 300, 655, 150, 5));
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
        platforms.add(new aPlatform(1, 140, 300, 280, 150, #008080));
        platforms.add(new aPlatform(1, 0, 450, 416, 50, #008080));

        objects.add(new aObject("jumpBoost", 0, 660, 482, 20));


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
        powerups.add(new aPowerup("projectile", 1, 345, 562, 6));


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
        platforms.add(new aPlatform(0, 120, 580, 200, 50, 380, 1, #008080));
        platforms.add(new aPlatform(0, 220, 490, 200, 50, 380, 1, #008080));
        platforms.add(new aPlatform(0, 320, 400, 200, 50, 380, 1, #008080));
        platforms.add(new aPlatform(0, 40, 350, 200, 50, 380, 2, #008080));
        platforms.add(new aPlatform(0, 220, 260, 200, 50, 380, 3, #008080));
        objects.add(new aObject("podium", 0, 335, 253));

        break;

      case 10: 
        boxX = 330;
        boxY = 640;
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
    timer = 0;
    platformstart = 120;
    platformstart = 120;
    platformMove = 1;
    platformstart2 = 120;
    platformMove2 = 1;
    platformstart3 = 300;
    platformMove3 = 1;
    platformStart192 = -150;
    platformStart193 = -450;
    platformStart194 = -750;
    platformStart195 = -1100;
    platformStart196 = -1350;
    platformStart197 = 700;
    platformStart198 = 660;
    platformStart199 = -600;
    platformStart1910 = 1010;
    platformStart1911 = -850;
    platformStart1912 = -1000;
    platformStart1913 = -1250;
    platformStart1914 = -1500;
    platformStart1915 = -750;
    platformStart1916 = 900;
  }
}

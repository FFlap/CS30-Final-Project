
void level1() {

  if (level == 1) {
    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 50;
      player.boxY = 640;
      //Platforms
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
    }

    levelTimer++;




    //Wall for Portal
    fill(128, 128, 128);
    rect(327, 350, 35, 310);

    if ( player.boxY <= 545 &&  player.boxY > 350 &&  player.boxX > 325 &&  player.boxX < 350) {
      player.stopRight();
      player.boxX = 307;
    }

    if ( player.boxY >= 615 &&  player.boxX > 325 &&  player.boxX < 340) {
      player.stopRight();
      player.boxX = 307;
    }

    if (player.boxY >= 350 && player.boxX > 340 && player.boxX <= 360) {
      player.stopLeft();
      player.boxX = 360;
    }


    //Platforms
    for (aPlatform plat : platforms) {
      if (plat.visibility == 0) { 
        plat.display();
      }
    }


    //Powerup

    for (aPowerup pow : powerups) {
      pow.data();
    }

    //Objects
    for (aObject obj : objects) {
      if (obj.visibility == 0) { 
        obj.display();
      }
    }
  }
}

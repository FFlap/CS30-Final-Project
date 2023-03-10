
void level1() {

  if (level == 1) {
    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 50;
      player.boxY = 640;
      //Platforms
      platforms.add(new aPlatform(140, 600, 100, 60, 2, 128));
      platforms.add(new aPlatform(450, 580, 120, 30, 3, 128));
      platforms.add(new aPlatform(590, 500, 120, 30, 4, 128));
      platforms.add(new aPlatform(500, 450, 30, 30, 5, 128));
      platforms.add(new aPlatform(415, 400, 30, 30, 6, 128));
      //Death Zone
      objects.add(new aObject("deathZone", 240, 655, 87, 5));

      //Portal
      objects.add(new aObject("portal", 327, 553, 580, 660, 373, 645, 170, 580));

      //End
      objects.add(new aObject("podium", 327, 351));
    }

    levelTimer++;

    //Border
    if (  player.boxX >= 680 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopRight();
      player.boxX = 680;
    }

    if (  player.boxX <= 0 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopLeft();
      player.boxX = 0;
    }


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
      plat.display();
    }


    //Powerup

    for (aPowerup pow : powerups) {
     pow.data();
    }

    //Objects
    for (aObject obj : objects) {
      obj.display();
    }



  }
}

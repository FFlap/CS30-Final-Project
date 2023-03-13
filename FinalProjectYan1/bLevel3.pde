void level3() {
  if (level == 3) {

    //Border
    if ( player. boxX >= 680 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopRight();
      player.boxX = 680;
    }

    if ( player. boxX <= 0 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopLeft();
      player.boxX = 0;
    }




    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 330;
      player.boxY = 640;
      platforms.add(new aPlatform(230, 570, 100, 40,#008080));
      platforms.add(new aPlatform(380, 500, 120, 40, #008080));
      platforms.add(new aPlatform(270, 400, 120, 40, #008080));
      platforms.add(new aPlatform(-1, 516, 120, 40, #008080));
      platforms.add(new aPlatform(-1, 220, 120, 40,  #008080));
      platforms.add(new aPlatform(119, 70, 150, 40, #008080));
      platforms.add(new aPlatform(119, 110, 50, 150, #CBC921));
      powerups.add(new aPowerup("highJump", 45, 496, 20 ));
      objects.add(new aObject("portal", 690, 600, 0, 220, 70, 180, 650, 640));
      objects.add(new aObject("podium", 230, 62));
    }

    levelTimer++;


    //Platforms
    for (aPlatform plat : platforms) {
      plat.display();
    }


    //Powerup
    for (aPowerup pow : powerups) {
      pow.display();
    }

    //Objects
    for (aObject obj : objects) {
      obj.display();
    }



    //End of Level
  }
}

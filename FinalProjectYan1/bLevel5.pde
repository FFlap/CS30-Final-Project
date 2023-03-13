void level5() {
  if (level == 5) {


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
      player.boxX = 305;
      player.boxY = 640;
      powerups.add(new aPowerup("glasses", 650, 640));

      tempPlatforms.add(new aPlatform(480, 570, 260, 50, #008080));
      tempPlatforms.add(new aPlatform(330, 500, 100, 50, #008080));
      tempPlatforms.add(new aPlatform(170, 450, 100, 50, #008080));
      tempPlatforms.add(new aPlatform(99, 350, 100, 50, #008080));
      tempPlatforms.add(new aPlatform(0, 280, 100, 120, #008080));
      tempPlatforms.add(new aPlatform(154, 0, 50, 235, #008080));
      tempPlatforms.add(new aPlatform(154, 0, 50, 235, #008080));

      platforms.add(new aPlatform(154, 230, 260, 50, #008080));
      objects.add(new aObject("podium", 360, 222));
    }

    levelTimer++;


    //Platforms

    for (aPlatform plat : platforms) {
      plat.display();
    }
    //Objects
    for (aObject obj : objects) {
      obj.display();
    }

    //Powerup
    for (aPowerup pow : powerups) {
      pow.display();
    }
  }
}

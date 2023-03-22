void level5() {
  if (level == 5) {





    if (levelTimer == 0) {
     world.LevelReset();
      player.boxX = 305;
      player.boxY = 640;
      powerups.add(new aPowerup("glasses", 0,650, 640));

      platforms.add(new aPlatform(1,480, 570, 260, 50, #008080));
      platforms.add(new aPlatform(1,330, 500, 100, 50, #008080));
      platforms.add(new aPlatform(1,170, 450, 100, 50, #008080));
      platforms.add(new aPlatform(1,99, 350, 100, 50, #008080));
      platforms.add(new aPlatform(1,0, 280, 100, 120, #008080));
      platforms.add(new aPlatform(1,154, 0, 50, 235, #008080));
      platforms.add(new aPlatform(1,154, 0, 50, 235, #008080));

      platforms.add(new aPlatform(0,154, 230, 260, 50, #008080));
      objects.add(new aObject("podium", 0,360, 222));
    }

    levelTimer++;


    //Platforms
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
      pow.display();
    }
  }
}

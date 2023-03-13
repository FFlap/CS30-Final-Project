void level7() {

  if (level == 7) {




    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 330;
      player.boxY = 640;
    }

    levelTimer++;
    //Border
    if ( player. boxX >= 680 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopRight();
      player.boxX = 680;
    }

    if ( player. boxX <= 0 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopLeft();
      player.boxX = 0;
    }





    objects.add(new aObject("projectile", 345, 562, 6));
    



    if (projectileTargetCheck == 0) {
      platforms.add(new aPlatform(230, 380, 260, 30, #008080));
      platforms.add(new aPlatform(558, 325, 100, 40, #008080));
      platforms.add(new aPlatform(280, 160, 150, 400, #008080));
      objects.add(new aObject("podium", 335, 151));
    }

    if (projectileTargetCheck == 1) {
      platforms.add(new aPlatform(280, 480, 100, 40, #008080));
      platforms.add(new aPlatform(461, 240, 100, 40, #008080));
      platforms.add(new aPlatform(230, 580, 260, 30, #008080));
    }
  }
}

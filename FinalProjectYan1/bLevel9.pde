


void level9() {


  world.levelTimer++;

  if (world.level == 9) {

    //Border
    if ( player. boxX >= 680 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopRight();
      player.boxX = 680;
    }

    if ( player. boxX <= 0 &&  player.boxY >= -10 &&  player.boxY < 700) {
      player.stopLeft();
      player.boxX = 0;
    }

    if (world.levelTimer == 0) {
     world.LevelReset();
      player.boxX = 330;
      player.boxY = 640;
    }
    if (timer == 0) {
      wave = 1;
    }
    timer++;
    
    if (timer == 900) {
      wave = 2;
    }


    if (timer == 1150) {
      wave = 3;
    }

    if (timer == 1900) {
      wave = 4;
    }

    //Level Key
    if ( timer > 2125) {
      powerups.add(new aPowerup("levelUnlock", 0, 280, 501));
    }
    if (wave == 1) {
      objects.add(new aObject("deathZone", 0, 0, 120, 500, 150, 999, 3));
      objects.add(new aObject("deathZone", 0, 300, -150, 500, 150, 999, 3));
      objects.add(new aObject("deathZone", 0, 300, -450, 500, 150, 999, 3));
      objects.add(new aObject("deathZone", 0, 300, -750, 500, 150, 999, 3));
      objects.add(new aObject("deathZone", 0, 500, -750, 500, 150, 999, 3));
      objects.add(new aObject("deathZone", 0, 30, -1100, 500, 150, 999, 3));
      objects.add(new aObject("deathZone", 0, 0, -1350, 500, 150, 999, 3));

      for (int i = 0; i < 700; i = i+130) {
        float[] deathzone168 = {i, platformStart196, 80, 150};

      }

      if (timer >= 700) {
        fill(#A07F12);
        triangle(300, 470, 300, 550, 240, 510);
        fill(#A07F12);
        rect(300, 500, 140, 20);
        fill(#A07F12);
        triangle(410, 470, 410, 550, 470, 510);

        platforms.add(new aPlatform(0, 0, 660, 200, 50, #008080));
        platforms.add(new aPlatform(0, 510, 660, 200, 50, #008080));
      }
    }
    if (wave == 2) {
      objects.add(new aObject("deathZone", 0, 200, 655, 310, 6));
      platforms.add(new aPlatform(0, 0, 700, 200, 50, 99999, 3, #008080));
      platforms.add(new aPlatform(0, 510, 700, 200, 50, 99999, 3, #008080));
      objects.add(new aObject("deathZone", 0, 0, 0, 700, 6));
      if (wave >= 2) {
        platforms.add(new aPlatform(0, 220, 350, 270, 50, #008080));
      }

      if (wave >= 3) {
        objects.add(new aObject("deathZone", 0, 0, 655, 700, 6));
        objects.add(new aObject("deathZone", 0, 0, 0, 700, 6));
      }

      if (wave == 3) {



        platformMove = 3;
        objects.add(new aObject("deathZone", 0, 220, 660, 210, 150, 999, 3));
        objects.add(new aObject("deathZone", 0, 220, 660, 210, 150, 999, 3));
        objects.add(new aObject("deathZone", 0, 1010, 300, 50, 150, 999, 3));
        platformMove = 3;
        objects.add(new aObject("deathZone", 0, 220, -600, 220, 150, 999, 3));
        objects.add(new aObject("deathZone", 0, 260, -850, 230, 150, 999, 3));
        objects.add(new aObject("deathZone", 0, -1000, 300, 50, 150, 999, 3));
        float[] deathzone1616 = {260, platformStart1913, 230, 150};

        float[] deathzone1617 = {220, platformStart1914, 110, 150};

        float[] deathzone1618 = {400, platformStart1914, 110, 150};
      }

      if (timer > 1800 && timer < 2000) {

        fill(#A07F12);
        rect(300, 230, 140, 20);
        fill(#A07F12);
        triangle(410, 200, 410, 280, 470, 240);
      }

      if (wave == 4) {

        //Level Check == true
        objects.add(new aObject("podium", 0, 347, 342));
        //

        platformMove = 4.2;
        platformStart1915 = platformStart1915 + platformMove;
        float[] deathzone1619 = {platformStart1915, 160, 110, 800};
        if (timer >= 2000 && timer <= 2100) {
          platforms.add(new aPlatform(0, 530, 300, 200, 50, #008080));
        }
        if (timer >= 2050 && timer <= 2125) {
          platforms.add(new aPlatform(0, 370, 230, 200, 50, 128));
          if (timer >= 2080 && timer <= 2150) {
            platforms.add(new aPlatform(0, 230, 164, 100, 50, 128));
          }

          if (timer >= 2200 && timer <= 2320) {
            platforms.add(new aPlatform(0, 410, 550, 100, 50, 128));
          }

          if (timer > 2205 ) {
            platformMove = 3.4;
            platformStart1916 = platformStart1916 - platformMove;
            float[] deathzone1919 = {platformStart1916, 300, 110, 800};
            float[] deathzone1920 = {platformStart1916, 0, 110, 180};
          }
          if (timer >= 2250 && timer <= 2340) {
            platforms.add(new aPlatform(0, 230, 520, 100, 50, 128));
          }
          if (timer >= 2290 && timer <= 2360) {
            platforms.add(new aPlatform(0, 110, 445, 100, 50, 128));
          }
        }
      }
    }
  }
}

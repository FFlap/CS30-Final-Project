


void level9() {


  levelTimer++;

  if (level == 9) {

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

      platformMove = 3;

      platformstart = platformstart + platformMove;
      float[] deathzone161 = {0, platformstart, 500, 150};
      fill(255, 0, 0);
      rect(deathzone161[0], deathzone161[1], deathzone161[2], deathzone161[3]);
      if (boxY >= (deathzone161[1] - 15)  && boxY <= (deathzone161[1] + deathzone161[3]) && boxX >= deathzone161[0] - boxsize && boxX <= (deathzone161[0] + deathzone161[2])) {
        levelTimer = 0;
      }


      platformStart192 = platformStart192 + platformMove;
      float[] deathzone162 = {300, platformStart192, 500, 150};
      fill(255, 0, 0);
      rect(deathzone162[0], deathzone162[1], deathzone162[2], deathzone162[3]);
      if (boxY >= (deathzone162[1] - 15)  && boxY <= (deathzone162[1] + deathzone162[3]) && boxX >= deathzone162[0] - boxsize  && boxX <= (deathzone162[0] + deathzone162[2])) {
        levelTimer = 0;
      }

      platformStart193 = platformStart193 + platformMove;
      float[] deathzone163 = {0, platformStart193, 500, 150};
      fill(255, 0, 0);
      rect(deathzone163[0], deathzone163[1], deathzone163[2], deathzone163[3]);
      if (boxY >= (deathzone163[1] - 15)  && boxY <= (deathzone163[1] + deathzone163[3]) && boxX >= deathzone163[0] - boxsize  && boxX <= (deathzone163[0] + deathzone163[2])) {
        levelTimer = 0;
      }

      platformStart194 = platformStart194 + platformMove;
      float[] deathzone164 = {0, platformStart194, 300, 150};
      fill(255, 0, 0);
      rect(deathzone164[0], deathzone164[1], deathzone164[2], deathzone164[3]);
      if (boxY >= (deathzone164[1] - 15)  && boxY <= (deathzone164[1] + deathzone164[3]) && boxX >= deathzone164[0] - boxsize  && boxX <= (deathzone164[0] + deathzone164[2])) {
        levelTimer = 0;
      }

      float[] deathzone165 = {500, platformStart194, 300, 150};
      fill(255, 0, 0);
      rect(deathzone165[0], deathzone165[1], deathzone165[2], deathzone165[3]);
      if (boxY >= (deathzone165[1] - 15)  && boxY <= (deathzone165[1] + deathzone165[3]) && boxX >= deathzone165[0] - boxsize  && boxX <= (deathzone165[0] + deathzone165[2])) {
        levelTimer = 0;
      }

      platformStart195 = platformStart195 + platformMove;
      float[] deathzone166 = {30, platformStart195, 640, 150};
      fill(255, 0, 0);
      rect(deathzone166[0], deathzone166[1], deathzone166[2], deathzone166[3]);
      if (boxY >= (deathzone166[1] - 15)  && boxY <= (deathzone166[1] + deathzone166[3]) && boxX >= deathzone166[0] - boxsize  && boxX <= (deathzone166[0] + deathzone166[2])) {
        levelTimer = 0;
      }

      platformStart196 = platformStart196 + platformMove;
      float[] deathzone167 = {0, platformStart196, 80, 150};
      fill(255, 0, 0);
      rect(deathzone167[0], deathzone167[1], deathzone167[2], deathzone167[3]);
      if (boxY >= (deathzone167[1] - 15)  && boxY <= (deathzone167[1] + deathzone167[3]) && boxX >= deathzone167[0] - boxsize  && boxX <= (deathzone167[0] + deathzone167[2])) {
        levelTimer = 0;
      }

      for (int i = 0; i < 700; i = i+130) {
        float[] deathzone168 = {i, platformStart196, 80, 150};
        fill(255, 0, 0);
        rect(deathzone168[0], deathzone168[1], deathzone168[2], deathzone168[3]);
        if (boxY >= (deathzone168[1] - 15)  && boxY <= (deathzone168[1] + deathzone168[3]) && boxX >= deathzone168[0] - boxsize  && boxX <= (deathzone168[0] + deathzone168[2])) {
          levelTimer = 0;
        }
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




      float[] deathzone169 = {200, 655, 310, 6};
      fill(255, 0, 0);
      rect(deathzone169[0], deathzone169[1], deathzone169[2], deathzone169[3]);
      if (boxY >= (deathzone169[1] - 15)  && boxY <= (deathzone169[1] + deathzone169[3]) && boxX >= deathzone169[0] - boxsize  && boxX <= (deathzone169[0] + deathzone169[2])) {
        levelTimer = 0;
      }
      platformMove2 = 0.005;
      platformStart197 = platformStart197 - platformMove;
      float[] platform191 = {0, platformStart197, 200, 50, 34};
      fill(0, 128, 128);
      rect(platform191[0], platform191[1], platform191[2], platform191[3]);


      if (boxY <= (platform191[1] + boxsize)  && boxY >= (platform191[1] - boxsize) && boxX > (platform191[0] - boxsize) && boxX < (platform191[0] + platform191[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform191[4];
        boxY =  (platform191[1] - boxsize);
      }

      if (boxY <= (platform191[1] + platform191[3] - boxsize) && boxY >= (platform191[1] - boxsize) && boxX >= (platform191[0] - boxsize) && boxX <= (platform191[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform191[0] - boxsize);
      }

      if (boxY <= (platform191[1] + platform191[3] - boxsize) && boxY >= (platform191[1] - boxsize) && boxX <= (platform191[0] + platform191[2]) && boxX >= (platform191[0] + (platform191[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform191[0] + (platform191[2]));
      }



      if (boxY <= (platform191[1] +  platform191[3]) && boxY >= (platform191[1] + boxsize)  && boxX > (platform191[0] - boxsize) && boxX < (platform191[0] + platform191[2])) {
        jump = -7;
      }

      if ( boxX >= (platform191[0] + platform191[2]) && check == platform191[4]|| boxX <= (platform191[0] - boxsize) && check == platform191[4]) {
        check = 999;
        jump = -7;
        jumpboolean = true;
      }

      if (check == 999 && jump < jumpheight) {
        jump = -7;
        jumpboolean = true;
      }

      float[] platform193 = {510, platformStart197, 200, 50, 36};
      fill(0, 128, 128);
      rect(platform193[0], platform193[1], platform193[2], platform193[3]);


      if (boxY <= (platform193[1] + boxsize)  && boxY >= (platform193[1] - boxsize) && boxX > (platform193[0] - boxsize) && boxX < (platform193[0] + platform193[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform193[4];
        boxY =  (platform193[1] - boxsize);
      }

      if (boxY <= (platform193[1] + platform193[3] - boxsize) && boxY >= (platform193[1] - boxsize) && boxX >= (platform193[0] - boxsize) && boxX <= (platform193[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform193[0] - boxsize);
      }

      if (boxY <= (platform193[1] + platform193[3] - boxsize) && boxY >= (platform193[1] - boxsize) && boxX <= (platform193[0] + platform193[2]) && boxX >= (platform193[0] + (platform193[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform193[0] + (platform193[2]));
      }



      if (boxY <= (platform193[1] +  platform193[3]) && boxY >= (platform193[1] + boxsize)  && boxX > (platform193[0] - boxsize) && boxX < (platform193[0] + platform193[2])) {
        jump = -7;
      }

      if ( boxX >= (platform193[0] + platform193[2]) && check == platform193[4]|| boxX <= (platform193[0] - boxsize) && check == platform193[4]) {
        check = 999;
        jump = -7;
        jumpboolean = true;
      }

      if (check == 999 && jump < jumpheight) {
        jump = -7;
        jumpboolean = true;
      }

      float[] deathzone1611 = {0, 0, 700, 6};
      fill(255, 0, 0);
      rect(deathzone1611[0], deathzone1611[1], deathzone1611[2], deathzone1611[3]);
      if (boxY >= (deathzone1611[1] - 15)  && boxY <= (deathzone1611[1] + deathzone1611[3]) && boxX >= deathzone1611[0] - boxsize  && boxX <= (deathzone1611[0] + deathzone1611[2])) {
        levelTimer = 0;
      }
    }



    if (wave >= 2) {

      platforms.add(new aPlatform(0, 220, 350, 270, 50, #008080));
    }

    if (wave >= 3) {

      float[] deathzone1610 = {0, 655, 700, 6};
      fill(255, 0, 0);
      rect(deathzone1610[0], deathzone1610[1], deathzone1610[2], deathzone1610[3]);
      if (boxY >= (deathzone1610[1] - 15)  && boxY <= (deathzone1610[1] + deathzone1610[3]) && boxX >= deathzone1610[0] - boxsize  && boxX <= (deathzone1610[0] + deathzone1610[2])) {
        levelTimer = 0;
      }

      float[] deathzone1612 = {0, 0, 700, 6};
      fill(255, 0, 0);
      rect(deathzone1612[0], deathzone1612[1], deathzone1612[2], deathzone1612[3]);
      if (boxY >= (deathzone1612[1] - 15)  && boxY <= (deathzone1612[1] + deathzone1612[3]) && boxX >= deathzone1612[0] - boxsize  && boxX <= (deathzone1612[0] + deathzone1612[2])) {
        levelTimer = 0;
      }
    }

    if (wave == 3) {



      platformMove = 3;
      platformStart198 = platformStart198 - platformMove;
      float[] deathzone169 = {220, platformStart198, 210, 150};
      fill(255, 0, 0);
      rect(deathzone169[0], deathzone169[1], deathzone169[2], deathzone169[3]);
      if (boxY >= (deathzone169[1] - 15)  && boxY <= (deathzone169[1] + deathzone169[3]) && boxX >= deathzone169[0] - boxsize  && boxX <= (deathzone169[0] + deathzone169[2])) {
        levelTimer = 0;
      }

      platformStart1910 = platformStart1910 - platformMove;
      float[] deathzone1611 = {platformStart1910, 300, 50, 150};
      fill(255, 0, 0);
      rect(deathzone1611[0], deathzone1611[1], deathzone1611[2], deathzone1611[3]);
      if (boxY >= (deathzone1611[1] - 15)  && boxY <= (deathzone1611[1] + deathzone1611[3]) && boxX >= deathzone1611[0] - boxsize  && boxX <= (deathzone1611[0] + deathzone1611[2])) {
        levelTimer = 0;
      }



      platformMove = 3;
      platformStart199 = platformStart199 + platformMove;
      float[] deathzone1613 = {220, platformStart199, 220, 150};
      fill(255, 0, 0);
      rect(deathzone1613[0], deathzone1613[1], deathzone1613[2], deathzone1613[3]);
      if (boxY >= (deathzone1613[1] - 15)  && boxY <= (deathzone1613[1] + deathzone1613[3]) && boxX >= deathzone1613[0] - boxsize  && boxX <= (deathzone1613[0] + deathzone1613[2])) {
        levelTimer = 0;
      }

      platformMove = 3;
      platformStart1911 = platformStart1911 + platformMove;
      float[] deathzone1614 = {260, platformStart1911, 230, 150};
      fill(255, 0, 0);
      rect(deathzone1614[0], deathzone1614[1], deathzone1614[2], deathzone1614[3]);
      if (boxY >= (deathzone1614[1] - 15)  && boxY <= (deathzone1614[1] + deathzone1614[3]) && boxX >= deathzone1614[0] - boxsize  && boxX <= (deathzone1614[0] + deathzone1614[2])) {
        levelTimer = 0;
      }

      platformMove = 3;
      platformStart1912 = platformStart1912 + platformMove;
      float[] deathzone1615 = {platformStart1912, 300, 50, 150};
      fill(255, 0, 0);
      rect(deathzone1615[0], deathzone1615[1], deathzone1615[2], deathzone1615[3]);
      if (boxY >= (deathzone1615[1] - 15)  && boxY <= (deathzone1615[1] + deathzone1615[3]) && boxX >= deathzone1615[0] - boxsize  && boxX <= (deathzone1615[0] + deathzone1615[2])) {
        levelTimer = 0;
      }

      platformMove = 3;
      platformStart1913 = platformStart1913 + platformMove;
      float[] deathzone1616 = {260, platformStart1913, 230, 150};
      fill(255, 0, 0);
      rect(deathzone1616[0], deathzone1616[1], deathzone1616[2], deathzone1616[3]);
      if (boxY >= (deathzone1616[1] - 15)  && boxY <= (deathzone1616[1] + deathzone1616[3]) && boxX >= deathzone1616[0] - boxsize  && boxX <= (deathzone1616[0] + deathzone1616[2])) {
        levelTimer = 0;
      }

      platformMove = 3;
      platformStart1914 = platformStart1914 + platformMove;
      float[] deathzone1617 = {220, platformStart1914, 110, 150};
      fill(255, 0, 0);
      rect(deathzone1617[0], deathzone1617[1], deathzone1617[2], deathzone1617[3]);
      if (boxY >= (deathzone1617[1] - 15)  && boxY <= (deathzone1617[1] + deathzone1617[3]) && boxX >= deathzone1617[0] - boxsize  && boxX <= (deathzone1617[0] + deathzone1617[2])) {
        levelTimer = 0;
      }

      float[] deathzone1618 = {400, platformStart1914, 110, 150};
      fill(255, 0, 0);
      rect(deathzone1618[0], deathzone1618[1], deathzone1618[2], deathzone1618[3]);
      if (boxY >= (deathzone1618[1] - 15)  && boxY <= (deathzone1618[1] + deathzone1618[3]) && boxX >= deathzone1618[0] - boxsize  && boxX <= (deathzone1618[0] + deathzone1618[2])) {
        levelTimer = 0;
      }
    }

    if (timer > 1800 && timer < 2000) {

      fill(#A07F12);
      rect(300, 230, 140, 20);
      fill(#A07F12);
      triangle(410, 200, 410, 280, 470, 240);
    }

    if (wave == 4) {

      if (levelkeycheck == true) {
      objects.add(new aObject("podium", 0,347, 342));
      }




      platformMove = 4.2;
      platformStart1915 = platformStart1915 + platformMove;
      float[] deathzone1619 = {platformStart1915, 160, 110, 800};
      fill(255, 0, 0);
      rect(deathzone1619[0], deathzone1619[1], deathzone1619[2], deathzone1619[3]);
      if (boxY >= (deathzone1619[1] - 15)  && boxY <= (deathzone1619[1] + deathzone1619[3]) && boxX >= deathzone1619[0] - boxsize  && boxX <= (deathzone1619[0] + deathzone1619[2])) {
        levelTimer = 0;
      }







      if (timer >= 2000 && timer <= 2100) {
        platforms.add(new aPlatform(0, 530, 300, 200, 50, #008080));
      }

      if (timer > 2100) {

        if (check == 36 ) {
          jump = -7;
          jumpboolean = true;
        }
      }




      if (timer >= 2050 && timer <= 2125) {


        platforms.add(new aPlatform(0, 370, 230, 200, 50, 128));



        if (timer > 2125 && check == 37) {


          jump = -7;
          jumpboolean = true;
        }


        if (timer >= 2080 && timer <= 2150) {
          platforms.add(new aPlatform(0, 230, 164, 100, 50, 128));
        }

        if (timer > 2150 && check == 38) {


          jump = -7;
          jumpboolean = true;
        }

        if (timer >= 2200 && timer <= 2320) {
          platforms.add(new aPlatform(0, 410, 550, 100, 50, 128));
        }

        if (timer > 2320 && check == 39) {


          jump = -7;
          jumpboolean = true;
        }

        if (timer > 2205 ) {

          platformMove = 3.4;
          platformStart1916 = platformStart1916 - platformMove;
          float[] deathzone1919 = {platformStart1916, 300, 110, 800};
          fill(255, 0, 0);
          rect(deathzone1919[0], deathzone1919[1], deathzone1919[2], deathzone1919[3]);
          if (boxY >= (deathzone1919[1] - 15)  && boxY <= (deathzone1919[1] + deathzone1919[3]) && boxX >= deathzone1919[0] - boxsize  && boxX <= (deathzone1919[0] + deathzone1919[2])) {
            levelTimer = 0;
          }

          float[] deathzone1920 = {platformStart1916, 0, 110, 180};
          fill(255, 0, 0);
          rect(deathzone1920[0], deathzone1920[1], deathzone1920[2], deathzone1920[3]);
          if (boxY >= (deathzone1920[1] - 15)  && boxY <= (deathzone1920[1] + deathzone1920[3]) && boxX >= deathzone1920[0] - boxsize  && boxX <= (deathzone1920[0] + deathzone1920[2])) {
            levelTimer = 0;
          }
        }


        if (timer >= 2250 && timer <= 2340) {
          platforms.add(new aPlatform(0, 230, 520, 100, 50, 128));
        }

        if (timer > 2340 && check == 40) {


          jump = -7;
          jumpboolean = true;
        }


        if (timer >= 2290 && timer <= 2360) {
          platforms.add(new aPlatform(0, 110, 445, 100, 50, 128));
        }

        if (timer > 2360 && check == 41) {


          jump = -7;
          jumpboolean = true;
        }
      }
    }
  }
}

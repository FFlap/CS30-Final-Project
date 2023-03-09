void level6() {

  if (level == 6) {





    if (levelTimer == 0) {
      LevelReset();
      jump = 15;
      boxX = 10;
      boxY = 130;
    }

    levelTimer++;


    //Border
    if ( boxX >= 680 && boxY >= -10 && boxY < 700) {
      moveright = false;
      boxX = 680;
    }

    if ( boxX <= 0 && boxY >= -10 && boxY < 700) {
      moveleft = false;
      boxX = 0;
    }




    if (levelkeycheck == false) {



      //Death Zone
      int[] deathzone161 = {150, 329, 230, 150};
      fill(255, 0, 0);
      rect(deathzone161[0], deathzone161[1], deathzone161[2], deathzone161[3]);
      if (boxY >= (deathzone161[1] - 15)  && boxY <= (deathzone161[1] + 15) && boxX >= deathzone161[0] && boxX <= (deathzone161[0] + deathzone161[2])) {
        higherjump = false;
        jumpheight = 15;
        jump = 15;
        boxX = 10;
        boxY = 130;
      }


      int[] deathzone162 = {0, 460, 400, 20};
      fill(255, 0, 0);
      rect(deathzone162[0], deathzone162[1], deathzone162[2], deathzone162[3]);
      if (boxY >= (deathzone162[1] - 15)  && boxY <= (deathzone162[1] + 15) && boxX >= deathzone162[0] && boxX <= (deathzone162[0] + deathzone162[2])) {
        higherjump = false;
        jumpheight = 15;
        jump = 15;
        boxX = 10;
        boxY = 130;
      }

      int[] deathzone163 = {375, 0, 40, 480};
      fill(255, 0, 0);
      rect(deathzone163[0], deathzone163[1], deathzone163[2], deathzone163[3]);
      if (boxX >= deathzone163[0] && boxX <= (deathzone163[0] + deathzone163[2])) {
        higherjump = false;
        jumpheight = 15;
        jump = 15;
        boxX = 10;
        boxY = 130;
      }
    }


    if (levelkeycheck == true) {
      int[] platform166 = {150, 329, 280, 150, 25};
      fill(0, 128, 128);
      rect(platform166[0], platform166[1], platform166[2], platform166[3]);


      if (boxY <= (platform166[1] + boxsize)  && boxY >= (platform166[1] - boxsize) && boxX > (platform166[0] - boxsize) && boxX < (platform166[0] + platform166[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform166[4];
        boxY =  (platform166[1] - boxsize);
      }

      if (boxY <= (platform166[1] + platform166[3] - boxsize) && boxY >= (platform166[1] - boxsize) && boxX >= (platform166[0] - boxsize) && boxX <= (platform166[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform166[0] - boxsize);
      }

      if (boxY <= (platform166[1] + platform166[3] - boxsize) && boxY >= (platform166[1] - boxsize) && boxX <= (platform166[0] + platform166[2]) && boxX >= (platform166[0] + (platform166[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform166[0] + (platform166[2]));
      }



      if (boxY <= (platform166[1] +  platform166[3]) && boxY >= (platform166[1] + boxsize)  && boxX > (platform166[0] - boxsize) && boxX < (platform166[0] + platform166[2])) {
        jump = -7;
      }

      if ( boxX >= (platform166[0] + platform166[2]) && check == platform166[4]|| boxX <= (platform166[0] - boxsize) && check == platform166[4]) {
        check = 999;
        jump = -7;
        jumpboolean = true;
      }

      if (check == 999 && jump < jumpheight) {
        jump = -7;
        jumpboolean = true;
      }

      int[] platform167 = {0, 460, 410, 20, 26};
      fill(0, 128, 128);
      rect(platform167[0], platform167[1], platform167[2], platform167[3]);


      if (boxY <= (platform167[1] + boxsize)  && boxY >= (platform167[1] - boxsize) && boxX > (platform167[0] - boxsize) && boxX < (platform167[0] + platform167[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform167[4];
        boxY =  (platform167[1] - boxsize);
      }

      if (boxY <= (platform167[1] + platform167[3] - boxsize) && boxY >= (platform167[1] - boxsize) && boxX >= (platform167[0] - boxsize) && boxX <= (platform167[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform167[0] - boxsize);
      }

      if (boxY <= (platform167[1] + platform167[3] - boxsize) && boxY >= (platform167[1] - boxsize) && boxX <= (platform167[0] + platform167[2]) && boxX >= (platform167[0] + (platform167[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform167[0] + (platform167[2]));
      }



      if (boxY <= (platform167[1] +  platform167[3]) && boxY >= (platform167[1] + boxsize)  && boxX > (platform167[0] - boxsize) && boxX < (platform167[0] + platform167[2])) {
        jump = -7;
      }

      if ( boxX >= (platform167[0] + platform167[2]) && check == platform167[4]|| boxX <= (platform167[0] - boxsize) && check == platform167[4]) {
        check = 999;
        jump = -7;
        jumpboolean = true;
      }

      if (check == 999 && jump < jumpheight) {
        jump = -7;
        jumpboolean = true;
      }

      //Booster Not Polished
      int[] booster161 = {110, 453, 35, 9};
      fill(#4DCEFF);
      rect(booster161[0], booster161[1], booster161[2], booster161[3]);
      if (boxY >= (booster161[1] - 15)  && boxY <= (booster161[1] + 15) && boxX >= booster161[0] && boxX <= (booster161[0] + booster161[2])) {
        jumpheight = 21;
        jump = jumpheight;
        jumpboolean = true;
      } else {
        jumpheight = 15; 
        if (boxY <= 230 && boxX >= 0 &&  boxX <= 150) {
          check = 999;
        }
      }

      int[] booster163 = {325, 321, 38, 9};
      fill(#4DCEFF);
      rect(booster163[0], booster163[1], booster163[2], booster163[3]);
      if (boxY >= (booster163[1] - 15)  && boxY <= (booster163[1] + 15) && boxX >= booster163[0] && boxX <= (booster163[0] + booster163[2])) {
        jumpheight = 23;
        jump = jumpheight;
        jumpboolean = true;
      } else {
        jumpheight = 15; 
        if (boxX >= 235 &&  boxX <= 415 && boxY <= 80) {
          check = 999;
        }
      }


      int[] endplatform6 = {180, 142, 35, 9, 6};
      fill(218, 165, 32);
      rect(endplatform6[0], endplatform6[1], endplatform6[2], endplatform6[3]);
      if (boxY <= (endplatform6[1] + 20)  && boxY >= (endplatform6[1] - 20) && boxX >=  (endplatform6[0] - 20) && boxX <= (endplatform6[0] + 30) && level == endplatform6[4]) {
        level++;
        levelTimer = 0;
        if (level >= levelUnlocked) {
          json = new JSONObject();
          json.setInt("levelUnlocked", level);
          saveJSONObject(json, "data/data.json");
        }
      }
    }






    int[] platform161 = {-5, 150, 260, 50, 21};
    fill(0, 128, 128);
    rect(platform161[0], platform161[1], platform161[2], platform161[3]);


    if (boxY <= (platform161[1] + boxsize)  && boxY >= (platform161[1] - boxsize) && boxX > (platform161[0] - boxsize) && boxX < (platform161[0] + platform161[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform161[4];
      boxY =  (platform161[1] - boxsize);
    }

    if (boxY <= (platform161[1] + platform161[3] - boxsize) && boxY >= (platform161[1] - boxsize) && boxX >= (platform161[0] - boxsize) && boxX <= (platform161[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform161[0] - boxsize);
    }

    if (boxY <= (platform161[1] + platform161[3] - boxsize) && boxY >= (platform161[1] - boxsize) && boxX <= (platform161[0] + platform161[2]) && boxX >= (platform161[0] + (platform161[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform161[0] + (platform161[2]));
    }



    if (boxY <= (platform161[1] +  platform161[3]) && boxY >= (platform161[1] + boxsize)  && boxX > (platform161[0] - boxsize) && boxX < (platform161[0] + platform161[2])) {
      jump = -7;
    }

    if ( boxX >= (platform161[0] + platform161[2]) && check == platform161[4]|| boxX <= (platform161[0] - boxsize) && check == platform161[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    int[] platform162 = {415, 0, 30, 660, 22};
    fill(0, 128, 128);
    rect(platform162[0], platform162[1], platform162[2], platform162[3]);


    if (boxY <= (platform162[1] + boxsize)  && boxY >= (platform162[1] - boxsize) && boxX > (platform162[0] - boxsize) && boxX < (platform162[0] + platform162[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform162[4];
      boxY =  (platform162[1] - boxsize);
    }

    if (boxY <= (platform162[1] + platform162[3] - boxsize) && boxY >= (platform162[1] - boxsize) && boxX >= (platform162[0] - boxsize) && boxX <= (platform162[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform162[0] - boxsize);
    }

    if (boxY <= (platform162[1] + platform162[3] - boxsize) && boxY >= (platform162[1] - boxsize) && boxX <= (platform162[0] + platform162[2]) && boxX >= (platform162[0] + (platform162[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform162[0] + (platform162[2]));
    }



    if (boxY <= (platform162[1] +  platform162[3]) && boxY >= (platform162[1] + boxsize)  && boxX > (platform162[0] - boxsize) && boxX < (platform162[0] + platform162[2])) {
      jump = -7;
    }

    if ( boxX >= (platform162[0] + platform162[2]) && check == platform162[4]|| boxX <= (platform162[0] - boxsize) && check == platform162[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    int[] platform163 = {440, 560, 50, 40, 23};
    fill(0, 128, 128);
    rect(platform163[0], platform163[1], platform163[2], platform163[3]);


    if (boxY <= (platform163[1] + boxsize)  && boxY >= (platform163[1] - boxsize) && boxX > (platform163[0] - boxsize) && boxX < (platform163[0] + platform163[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform163[4];
      boxY =  (platform163[1] - boxsize);
    }

    if (boxY <= (platform163[1] + platform163[3] - boxsize) && boxY >= (platform163[1] - boxsize) && boxX >= (platform163[0] - boxsize) && boxX <= (platform163[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform163[0] - boxsize);
    }

    if (boxY <= (platform163[1] + platform163[3] - boxsize) && boxY >= (platform163[1] - boxsize) && boxX <= (platform163[0] + platform163[2]) && boxX >= (platform163[0] + (platform163[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform163[0] + (platform163[2]));
    }



    if (boxY <= (platform163[1] +  platform163[3]) && boxY >= (platform163[1] + boxsize)  && boxX > (platform163[0] - boxsize) && boxX < (platform163[0] + platform163[2])) {
      jump = -7;
    }

    if ( boxX >= (platform163[0] + platform163[2]) && check == platform163[4]|| boxX <= (platform163[0] - boxsize) && check == platform163[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    int[] platform164 = {530, 490, 180, 40, 24};
    fill(0, 128, 128);
    rect(platform164[0], platform164[1], platform164[2], platform164[3]);


    if (boxY <= (platform164[1] + boxsize)  && boxY >= (platform164[1] - boxsize) && boxX > (platform164[0] - boxsize) && boxX < (platform164[0] + platform164[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform164[4];
      boxY =  (platform164[1] - boxsize);
    }

    if (boxY <= (platform164[1] + platform164[3] - boxsize) && boxY >= (platform164[1] - boxsize) && boxX >= (platform164[0] - boxsize) && boxX <= (platform164[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform164[0] - boxsize);
    }

    if (boxY <= (platform164[1] + platform164[3] - boxsize) && boxY >= (platform164[1] - boxsize) && boxX <= (platform164[0] + platform164[2]) && boxX >= (platform164[0] + (platform164[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform164[0] + (platform164[2]));
    }



    if (boxY <= (platform164[1] +  platform164[3]) && boxY >= (platform164[1] + boxsize)  && boxX > (platform164[0] - boxsize) && boxX < (platform164[0] + platform164[2])) {
      jump = -7;
    }

    if ( boxX >= (platform164[0] + platform164[2]) && check == platform164[4]|| boxX <= (platform164[0] - boxsize) && check == platform164[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    int[] platform165 = {440, 150, 100, 40, 2};
    fill(0, 128, 128);
    rect(platform165[0], platform165[1], platform165[2], platform165[3]);


    if (boxY <= (platform165[1] + boxsize)  && boxY >= (platform165[1] - boxsize) && boxX > (platform165[0] - boxsize) && boxX < (platform165[0] + platform165[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform165[4];
      boxY =  (platform165[1] - boxsize);
    }

    if (boxY <= (platform165[1] + platform165[3] - boxsize) && boxY >= (platform165[1] - boxsize) && boxX >= (platform165[0] - boxsize) && boxX <= (platform165[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform165[0] - boxsize);
    }

    if (boxY <= (platform165[1] + platform165[3] - boxsize) && boxY >= (platform165[1] - boxsize) && boxX <= (platform165[0] + platform165[2]) && boxX >= (platform165[0] + (platform165[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform165[0] + (platform165[2]));
    }



    if (boxY <= (platform165[1] +  platform165[3]) && boxY >= (platform165[1] + boxsize)  && boxX > (platform165[0] - boxsize) && boxX < (platform165[0] + platform165[2])) {
      jump = -7;
    }

    if ( boxX >= (platform165[0] + platform165[2]) && check == platform165[4]|| boxX <= (platform165[0] - boxsize) && check == platform165[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    int[] platform168 = {0, 479, 416, 181, 2};
    fill(0, 128, 128);
    rect(platform168[0], platform168[1], platform168[2], platform168[3]);


    if (boxY <= (platform168[1] + boxsize)  && boxY >= (platform168[1] - boxsize) && boxX > (platform168[0] - boxsize) && boxX < (platform168[0] + platform168[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform168[4];
      boxY =  (platform168[1] - boxsize);
    }

    if (boxY <= (platform168[1] + platform168[3] - boxsize) && boxY >= (platform168[1] - boxsize) && boxX >= (platform168[0] - boxsize) && boxX <= (platform168[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform168[0] - boxsize);
    }

    if (boxY <= (platform168[1] + platform168[3] - boxsize) && boxY >= (platform168[1] - boxsize) && boxX <= (platform168[0] + platform168[2]) && boxX >= (platform168[0] + (platform168[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform168[0] + (platform168[2]));
    }



    if (boxY <= (platform168[1] +  platform168[3]) && boxY >= (platform168[1] + boxsize)  && boxX > (platform168[0] - boxsize) && boxX < (platform168[0] + platform168[2])) {
      jump = -7;
    }

    if ( boxX >= (platform168[0] + platform168[2]) && check == platform168[4]|| boxX <= (platform168[0] - boxsize) && check == platform168[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    //Booster Not Polished
    int[] booster161 = {660, 482, 35, 9};
    fill(#4DCEFF);
    rect(booster161[0], booster161[1], booster161[2], booster161[3]);
    if (boxY >= (booster161[1] - 15)  && boxY <= (booster161[1] + 15) && boxX >= booster161[0] && boxX <= (booster161[0] + booster161[2])) {
      jumpheight = 30;
      jump = jumpheight;
      jumpboolean = true;
    } else {
      jumpheight = 15; 
      if (boxY <= 40 && boxX >= 540) {
        check = 999;
      }
    }



    //Level Key
    int[] levelkey = {480, 95, 20, 20};
    if (levelkeycheck ==  false) {
      fill(#FFDF24);
      rect(levelkey[0], levelkey[1], levelkey[2], levelkey[2]);
      fill(#151515);
      rect((levelkey[0] +(levelkey[2] /4)), (levelkey[1] + (levelkey[2] /4)), (levelkey[2] /2), (levelkey[2] /2 ));
    }

    if (levelkeycheck == false && boxX >= (levelkey[0] - boxsize)  && boxX <= (levelkey[0] + boxsize) && boxY <= (levelkey[1] + boxsize)  && boxY >= (levelkey[1] - boxsize)) {
      levelkeycheck = true;
    }




    //Vertical Portal Blue
    int[] portal131 = {690, 530, 10, 60};
    fill(255, 154, 0);
    rect(portal131[0], portal131[1], portal131[2], portal131[3]);
    fill(255);
    rect(portal131[0], (portal131[1] + 5), (portal131[2] - 5), (portal131[3] - 10));
    if (boxY <= (portal131[1] + 60)  && boxY >= (portal131[1] - 5) && boxX > (portal131[0] - 20) && boxX < (portal131[0] + 20)) {
      check = 999;
      boxX = 20;
      boxY = 420;
    }
    //Vertical Portal Orange
    int[] portal132 = {0, 372, 10, 60};
    fill(0, 101, 255);
    rect(portal132[0], portal132[1], portal132[2], portal132[3]);
    fill(255);
    rect(portal132[0] + 5, (portal132[1] + 5), (portal132[2] - 5), (portal132[3] - 10));
    if (boxY <= (portal132[1] + 60)  && boxY >= (portal132[1] - 5) && boxX > (portal132[0] - 20) && boxX < (portal132[0] + 20)) {
      check = 999;
      boxX = 580;
      boxY = 610;
    }
  }
}

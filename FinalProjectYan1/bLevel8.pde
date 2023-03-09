



void level8() {

  if (level == 8) {




    if (levelTimer == 0) {
      LevelReset();
      boxX = 330;
      boxY = 640;
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


    if (platformstart >= 380) {
      platformMove = -1;
    } else if (platformstart <= 120) {
      platformMove = 1;
    }
    platformstart = platformstart + platformMove;


    float[] platform181 = {platformstart, 580, 200, 50, 30};
    fill(0, 128, 128);
    rect(platform181[0], platform181[1], platform181[2], platform181[3]);


    if (boxY <= (platform181[1] + boxsize)  && boxY >= (platform181[1] - boxsize) && boxX > (platform181[0] - boxsize) && boxX < (platform181[0] + platform181[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform181[4];
      boxY =  (platform181[1] - boxsize);
    }

    if (boxY <= (platform181[1] + platform181[3] - boxsize) && boxY >= (platform181[1] - boxsize) && boxX >= (platform181[0] - boxsize) && boxX <= (platform181[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform181[0] - boxsize);
    }

    if (boxY <= (platform181[1] + platform181[3] - boxsize) && boxY >= (platform181[1] - boxsize) && boxX <= (platform181[0] + platform181[2]) && boxX >= (platform181[0] + (platform181[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform181[0] + (platform181[2]));
    }



    if (boxY <= (platform181[1] +  platform181[3]) && boxY >= (platform181[1] + boxsize)  && boxX > (platform181[0] - boxsize) && boxX < (platform181[0] + platform181[2])) {
      jump = -7;
    }

    if ( boxX >= (platform181[0] + platform181[2]) && check == platform181[4]|| boxX <= (platform181[0] - boxsize) && check == platform181[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }


    float[] platform182 = {platformstart + 100, 490, 200, 50, 31};
    fill(0, 128, 128);
    rect(platform182[0], platform182[1], platform182[2], platform182[3]);


    if (boxY <= (platform182[1] + boxsize)  && boxY >= (platform182[1] - boxsize) && boxX > (platform182[0] - boxsize) && boxX < (platform182[0] + platform182[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform182[4];
      boxY =  (platform182[1] - boxsize);
    }

    if (boxY <= (platform182[1] + platform182[3] - boxsize) && boxY >= (platform182[1] - boxsize) && boxX >= (platform182[0] - boxsize) && boxX <= (platform182[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform182[0] - boxsize);
    }

    if (boxY <= (platform182[1] + platform182[3] - boxsize) && boxY >= (platform182[1] - boxsize) && boxX <= (platform182[0] + platform182[2]) && boxX >= (platform182[0] + (platform182[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform182[0] + (platform182[2]));
    }



    if (boxY <= (platform182[1] +  platform182[3]) && boxY >= (platform182[1] + boxsize)  && boxX > (platform182[0] - boxsize) && boxX < (platform182[0] + platform182[2])) {
      jump = -7;
    }

    if ( boxX >= (platform182[0] + platform182[2]) && check == platform182[4]|| boxX <= (platform182[0] - boxsize) && check == platform182[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }




    float[] platform183 = {platformstart + 200, 400, 200, 50, 32};
    fill(0, 128, 128);
    rect(platform183[0], platform183[1], platform183[2], platform183[3]);


    if (boxY <= (platform183[1] + boxsize)  && boxY >= (platform183[1] - boxsize) && boxX > (platform183[0] - boxsize) && boxX < (platform183[0] + platform183[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform183[4];
      boxY =  (platform183[1] - boxsize);
    }

    if (boxY <= (platform183[1] + platform183[3] - boxsize) && boxY >= (platform183[1] - boxsize) && boxX >= (platform183[0] - boxsize) && boxX <= (platform183[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform183[0] - boxsize);
    }

    if (boxY <= (platform183[1] + platform183[3] - boxsize) && boxY >= (platform183[1] - boxsize) && boxX <= (platform183[0] + platform183[2]) && boxX >= (platform183[0] + (platform183[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform183[0] + (platform183[2]));
    }



    if (boxY <= (platform183[1] +  platform183[3]) && boxY >= (platform183[1] + boxsize)  && boxX > (platform183[0] - boxsize) && boxX < (platform183[0] + platform183[2])) {
      jump = -7;
    }

    if ( boxX >= (platform183[0] + platform183[2]) && check == platform183[4]|| boxX <= (platform183[0] - boxsize) && check == platform183[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    if (platformstart2 >= 380) {
      platformMove2 = -2;
    } else if (platformstart2 <= 120) {
      platformMove2 = 2;
    }
    platformstart2 = platformstart2 + platformMove2;


    float[] platform184 = {platformstart2 - 80, 350, 200, 50, 33};
    fill(0, 128, 128);
    rect(platform184[0], platform184[1], platform184[2], platform184[3]);


    if (boxY <= (platform184[1] + boxsize)  && boxY >= (platform184[1] - boxsize) && boxX > (platform184[0] - boxsize) && boxX < (platform184[0] + platform184[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform184[4];
      boxY =  (platform184[1] - boxsize);
    }

    if (boxY <= (platform184[1] + platform184[3] - boxsize) && boxY >= (platform184[1] - boxsize) && boxX >= (platform184[0] - boxsize) && boxX <= (platform184[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform184[0] - boxsize);
    }

    if (boxY <= (platform184[1] + platform184[3] - boxsize) && boxY >= (platform184[1] - boxsize) && boxX <= (platform184[0] + platform184[2]) && boxX >= (platform184[0] + (platform184[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform184[0] + (platform184[2]));
    }



    if (boxY <= (platform184[1] +  platform184[3]) && boxY >= (platform184[1] + boxsize)  && boxX > (platform184[0] - boxsize) && boxX < (platform184[0] + platform184[2])) {
      jump = -7;
    }

    if ( boxX >= (platform184[0] + platform184[2]) && check == platform184[4]|| boxX <= (platform184[0] - boxsize) && check == platform184[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    if (platformstart3 >= 380) {
      platformMove3 = -3;
    } else if (platformstart3 <= 300) {
      platformMove3 = 3;
    }
    platformstart3 = platformstart3 + platformMove3;

    float[] platform185 = {platformstart3 - 80, 260, 200, 50, 34};
    fill(0, 128, 128);
    rect(platform185[0], platform185[1], platform185[2], platform185[3]);


    if (boxY <= (platform185[1] + boxsize)  && boxY >= (platform185[1] - boxsize) && boxX > (platform185[0] - boxsize) && boxX < (platform185[0] + platform185[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform185[4];
      boxY =  (platform185[1] - boxsize);
    }

    if (boxY <= (platform185[1] + platform185[3] - boxsize) && boxY >= (platform185[1] - boxsize) && boxX >= (platform185[0] - boxsize) && boxX <= (platform185[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform185[0] - boxsize);
    }

    if (boxY <= (platform185[1] + platform185[3] - boxsize) && boxY >= (platform185[1] - boxsize) && boxX <= (platform185[0] + platform185[2]) && boxX >= (platform185[0] + (platform185[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform185[0] + (platform185[2]));
    }



    if (boxY <= (platform185[1] +  platform185[3]) && boxY >= (platform185[1] + boxsize)  && boxX > (platform185[0] - boxsize) && boxX < (platform185[0] + platform185[2])) {
      jump = -7;
    }

    if ( boxX >= (platform185[0] + platform185[2]) && check == platform185[4]|| boxX <= (platform185[0] - boxsize) && check == platform185[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }

    float[] endplatform8 = {platformstart3, 253, 35, 9, 8};
    fill(218, 165, 32);
    rect(endplatform8[0], endplatform8[1], endplatform8[2], endplatform8[3]);
    if (boxY <= (endplatform8[1] + 20)  && boxY >= (endplatform8[1] - 20) && boxX >=  (endplatform8[0] - 20) && boxX <= (endplatform8[0] + 30) && level == endplatform8[4]) {
      level++;
      levelTimer = 0;
      if (level >= levelUnlocked) {
        json = new JSONObject();
        json.setInt("levelUnlocked", level);
        saveJSONObject(json, "data/data.json");
      }
    }
  }
}

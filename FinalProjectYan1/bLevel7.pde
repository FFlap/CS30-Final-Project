void level7() {

  if (level == 7) {




    if (levelTimer == 0) {
      LevelReset();
      jump = 15;
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

    if (projectilemove == true) {


      projectileTimer++;
      if (projectileTimer == 50) {
        projectilemove = false;
        projectileTimer = 0;
      }

      //Projectile
      fill(#7B4CEA);
      rectMode(CENTER);
      rect(projectileX, projectileY, projectilesize, projectilesize);
      rectMode(CORNER);

      projectileSpeedX = projectileSpeed * cos(projectileangle);

      projectileSpeedY = projectileSpeed * sin(projectileangle);
      projectileX += projectileSpeedX;

      projectileY += projectileSpeedY;
    }

    int[] projectilePower = {345, 562, 20, 20};
    if (projectilePowercheck ==  false) {
      fill(#7B4CEA);
      rect(projectilePower[0], projectilePower[1], projectilePower[2], projectilePower[2]);
      fill(#151515);
      rect((projectilePower[0] +(projectilePower[2] /4)), (projectilePower[1] + (projectilePower[2] /4)), (projectilePower[2] /2), (projectilePower[2] /2 ));
    }

    if (projectilePowercheck == false && boxX >= (projectilePower[0] - boxsize)  && boxX <= (projectilePower[0] + boxsize) && boxY <= (projectilePower[1] + boxsize)  && boxY >= (projectilePower[1] - boxsize)) {
      projectilePowercheck = true;
    }
    
      if (projectilePowercheck == true) {
            fill(255);
      textSize(15);
      text("Click anywhere you want to shoot!", 230, 430);

        
      }

    float[] projectileTarget = {280, 190, 150, 40};
    fill(#FF3E3E);
    rect(projectileTarget[0], projectileTarget[1], projectileTarget[2], projectileTarget[3]);
    fill(255);
    rect(projectileTarget[0] + 10, projectileTarget[1] + 10, projectileTarget[2] - 20, projectileTarget[3] -20);
    fill(#FF3E3E);
    rect(projectileTarget[0] + 15, projectileTarget[1] + 15, projectileTarget[2] - 30, projectileTarget[3] -30);



    if ( projectileY <= (projectileTarget[1] + projectileTarget[3]) && projectileY >= (projectileTarget[1] - boxsize) && projectileX >= (projectileTarget[0] - boxsize) && projectileX <= (projectileTarget[0] + projectileTarget[2])  + boxsize && projectileTargetCheck >= 0) {
      if (projectileY <= (projectileTarget[1] + projectileTarget[3]) && projectileY >= (projectileTarget[1] - boxsize) && projectileX >= (projectileTarget[0] - boxsize) && projectileX <= (projectileTarget[0] + projectileTarget[2])  + boxsize && projectileTargetCheck == 1) {
        projectileTargetCheck = 0;
      } else {
        projectileTargetCheck = 1;
      }
    }

    if (projectileTargetCheck == 1 && jump == 15 && check == 30 || projectileTargetCheck == 1 && jump == 15 && check == 31 || projectileTargetCheck == 1 && jump == 15 && check == 33) {
      jump = -7;
      jumpboolean = true;
    }


    if (projectileTargetCheck == 0 && jump == 15 && check > 1 && check != 28 && check != 30 && check != 31 && check != 33) {
      jump = -7;
      jumpboolean = true;
    } 

    if (projectileY <= (projectileTarget[1] + projectileTarget[3]) && projectileY >= (projectileTarget[1] - boxsize) && projectileX >= (projectileTarget[0] - boxsize) && projectileX <= (projectileTarget[0] + projectileTarget[2])  + boxsize) {
      projectilemove = false;
      projectileX = 0;
      projectileY = 0;
    }

    if (projectileTargetCheck == 0) {
      
      
      int[] platform173 = {230, 380, 260, 30, 30};
      fill(0, 128, 128);
      rect(platform173[0], platform173[1], platform173[2], platform173[3]);


      if (boxY <= (platform173[1] + boxsize)  && boxY >= (platform173[1] - boxsize) && boxX > (platform173[0] - boxsize) && boxX < (platform173[0] + platform173[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform173[4];
        boxY =  (platform173[1] - boxsize);
      }

      if (boxY <= (platform173[1] + platform173[3] - boxsize) && boxY >= (platform173[1] - boxsize) && boxX >= (platform173[0] - boxsize) && boxX <= (platform173[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform173[0] - boxsize);
      }

      if (boxY <= (platform173[1] + platform173[3] - boxsize) && boxY >= (platform173[1] - boxsize) && boxX <= (platform173[0] + platform173[2]) && boxX >= (platform173[0] + (platform173[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform173[0] + (platform173[2]));
      }



      if (boxY <= (platform173[1] +  platform173[3]) && boxY >= (platform173[1] + boxsize)  && boxX > (platform173[0] - boxsize) && boxX < (platform173[0] + platform173[2])) {
        jump = -7;
      }

      if ( boxX >= (platform173[0] + platform173[2]) && check == platform173[4]|| boxX <= (platform173[0] - boxsize) && check == platform173[4]) {
        check = 999;
        jump = -7;
        jumpboolean = true;
      }

      if (check == 999 && jump < jumpheight) {
        jump = -7;
        jumpboolean = true;
      }

      int[] platform165 = {558, 325, 100, 40, 31};
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

      int[] platform175 = {280, 160, 150, 40, 33};
      fill(0, 128, 128);
      rect(platform175[0], platform175[1], platform175[2], platform175[3]);


      if (boxY <= (platform175[1] + boxsize)  && boxY >= (platform175[1] - boxsize) && boxX > (platform175[0] - boxsize) && boxX < (platform175[0] + platform175[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform175[4];
        boxY =  (platform175[1] - boxsize);
      }

      if (boxY <= (platform175[1] + platform175[3] - boxsize) && boxY >= (platform175[1] - boxsize) && boxX >= (platform175[0] - boxsize) && boxX <= (platform175[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform175[0] - boxsize);
      }

      if (boxY <= (platform175[1] + platform175[3] - boxsize) && boxY >= (platform175[1] - boxsize) && boxX <= (platform175[0] + platform175[2]) && boxX >= (platform175[0] + (platform175[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform175[0] + (platform175[2]));
      }



      if (boxY <= (platform175[1] +  platform175[3]) && boxY >= (platform175[1] + boxsize)  && boxX > (platform175[0] - boxsize) && boxX < (platform175[0] + platform175[2])) {
        jump = -7;
      }

      if ( boxX >= (platform175[0] + platform175[2]) && check == platform175[4]|| boxX <= (platform175[0] - boxsize) && check == platform175[4]) {
        check = 999;
        jump = -7;
        jumpboolean = true;
      }

      if (check == 999 && jump < jumpheight) {
        jump = -7;
        jumpboolean = true;
      }

      int[] endplatform6 = {335, 151, 35, 9, 7};
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





    if (projectileTargetCheck == 1) {
      int[] platform165 = {280, 480, 100, 40, 29};
      fill(#B7060B);
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

      int[] platform174 = {461, 240, 100, 40, 32};
      fill(#B7060B);
      rect(platform174[0], platform174[1], platform174[2], platform174[3]);


      if (boxY <= (platform174[1] + boxsize)  && boxY >= (platform174[1] - boxsize) && boxX > (platform174[0] - boxsize) && boxX < (platform174[0] + platform174[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform174[4];
        boxY =  (platform174[1] - boxsize);
      }

      if (boxY <= (platform174[1] + platform174[3] - boxsize) && boxY >= (platform174[1] - boxsize) && boxX >= (platform174[0] - boxsize) && boxX <= (platform174[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform174[0] - boxsize);
      }

      if (boxY <= (platform174[1] + platform174[3] - boxsize) && boxY >= (platform174[1] - boxsize) && boxX <= (platform174[0] + platform174[2]) && boxX >= (platform174[0] + (platform174[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform174[0] + (platform174[2]));
      }



      if (boxY <= (platform174[1] +  platform174[3]) && boxY >= (platform174[1] + boxsize)  && boxX > (platform174[0] - boxsize) && boxX < (platform174[0] + platform174[2])) {
        jump = -7;
      }

      if ( boxX >= (platform174[0] + platform174[2]) && check == platform174[4]|| boxX <= (platform174[0] - boxsize) && check == platform174[4]) {
        check = 999;
        jump = -7;
        jumpboolean = true;
      }

      if (check == 999 && jump < jumpheight) {
        jump = -7;
        jumpboolean = true;
      }
    }


    int[] platform171 = {230, 580, 260, 30, 28};
    fill(0, 128, 128);
    rect(platform171[0], platform171[1], platform171[2], platform171[3]);


    if (boxY <= (platform171[1] + boxsize)  && boxY >= (platform171[1] - boxsize) && boxX > (platform171[0] - boxsize) && boxX < (platform171[0] + platform171[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform171[4];
      boxY =  (platform171[1] - boxsize);
    }

    if (boxY <= (platform171[1] + platform171[3] - boxsize) && boxY >= (platform171[1] - boxsize) && boxX >= (platform171[0] - boxsize) && boxX <= (platform171[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform171[0] - boxsize);
    }

    if (boxY <= (platform171[1] + platform171[3] - boxsize) && boxY >= (platform171[1] - boxsize) && boxX <= (platform171[0] + platform171[2]) && boxX >= (platform171[0] + (platform171[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform171[0] + (platform171[2]));
    }



    if (boxY <= (platform171[1] +  platform171[3]) && boxY >= (platform171[1] + boxsize)  && boxX > (platform171[0] - boxsize) && boxX < (platform171[0] + platform171[2])) {
      jump = -7;
    }

    if ( boxX >= (platform171[0] + platform171[2]) && check == platform171[4]|| boxX <= (platform171[0] - boxsize) && check == platform171[4]) {
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < jumpheight) {
      jump = -7;
      jumpboolean = true;
    }
  }
}

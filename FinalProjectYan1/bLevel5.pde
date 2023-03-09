void level5() {
  if (level == 5) {





    if (levelTimer == 0) {
      LevelReset();
      boxX = 305;
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

    /*
     Array Meaning: 
     0 = x-coordinate of the rectangle
     1 = y-coordinate of the rectangle
     2 = length and width of the rectangle
     */
    int[] glassespowerup = {650, 640, 20};

    if (glassespower ==  0) {
      fill(#FF9912);
      rect(glassespowerup[0], glassespowerup[1], glassespowerup[2], glassespowerup[2]);
    }

    if (glassespower == 0 && boxX >= (glassespowerup[0] - boxsize)  && boxX <= (glassespowerup[0] + boxsize) && boxY <= (glassespowerup[1] + boxsize)  && boxY >= (glassespowerup[1] - boxsize)) {
      glassespower = 1;
    }

    if (glassespower == 2 && jump == 15 && check > 1 && check != 16) {
      jump = -7;
      jumpboolean = true;
    } 

    if (glassespower == 1) {

      fill(255);
      textSize(15);
      text("Toggle your glasses power On/Off \n by pressing R!", 420, 430);



      /*
 Array Meaning: 
       0 = x-coordinate of the rectangle
       1 = y-coordinate of the rectangle
       2 = width of the rectangle
       3 = height of the rectangle
       4 = platform number
       */
      //Platform 1 of 1-5
      int[] platform151 = {480, 570, 260, 50, 15};
      fill(0, 128, 128);
      rect(platform151[0], platform151[1], platform151[2], platform151[3]);


      if (boxY <= (platform151[1] + boxsize)  && boxY >= (platform151[1] - boxsize) && boxX > (platform151[0] - boxsize) && boxX < (platform151[0] + platform151[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform151[4];
        boxY =  (platform151[1] - boxsize);
      }

      if (boxY <= (platform151[1] + platform151[3] - boxsize) && boxY >= (platform151[1] - boxsize) && boxX >= (platform151[0] - boxsize) && boxX <= (platform151[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform151[0] - boxsize);
      }

      if (boxY <= (platform151[1] + platform151[3] - boxsize) && boxY >= (platform151[1] - boxsize) && boxX <= (platform151[0] + platform151[2]) && boxX >= (platform151[0] + (platform151[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform151[0] + (platform151[2]));
      }



      if (boxY <= (platform151[1] +  platform151[3]) && boxY >= (platform151[1] + boxsize)  && boxX > (platform151[0] - boxsize) && boxX < (platform151[0] + platform151[2])) {
        jump = -7;
      }


      if ( boxX >= (platform151[0] + platform151[2]) && check == platform151[4]|| boxX <= (platform151[0] - boxsize) && check == platform151[4]) {
        //println("off platform");
        jump = -7;
        jumpboolean = true;
      } 

      //Platform 1 of 1-5
      int[] platform153 = {330, 500, 100, 50, 17};
      fill(0, 128, 128);
      rect(platform153[0], platform153[1], platform153[2], platform153[3]);


      if (boxY <= (platform153[1] + boxsize)  && boxY >= (platform153[1] - boxsize) && boxX > (platform153[0] - boxsize) && boxX < (platform153[0] + platform153[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform153[4];
        boxY =  (platform153[1] - boxsize);
      }

      if (boxY <= (platform153[1] + platform153[3] - boxsize) && boxY >= (platform153[1] - boxsize) && boxX >= (platform153[0] - boxsize) && boxX <= (platform153[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform153[0] - boxsize);
      }

      if (boxY <= (platform153[1] + platform153[3] - boxsize) && boxY >= (platform153[1] - boxsize) && boxX <= (platform153[0] + platform153[2]) && boxX >= (platform153[0] + (platform153[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform153[0] + (platform153[2]));
      }



      if (boxY <= (platform153[1] +  platform153[3]) && boxY >= (platform153[1] + boxsize)  && boxX > (platform153[0] - boxsize) && boxX < (platform153[0] + platform153[2])) {
        jump = -7;
      }


      if ( boxX >= (platform153[0] + platform153[2]) && check == platform153[4]|| boxX <= (platform153[0] - boxsize) && check == platform153[4]) {
        //println("off platform");
        jump = -7;
        jumpboolean = true;
      } 

      //Platform 1 of 1-5
      int[] platform154 = {170, 450, 100, 50, 18};
      fill(0, 128, 128);
      rect(platform154[0], platform154[1], platform154[2], platform154[3]);


      if (boxY <= (platform154[1] + boxsize)  && boxY >= (platform154[1] - boxsize) && boxX > (platform154[0] - boxsize) && boxX < (platform154[0] + platform154[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform154[4];
        boxY =  (platform154[1] - boxsize);
      }

      if (boxY <= (platform154[1] + platform154[3] - boxsize) && boxY >= (platform154[1] - boxsize) && boxX >= (platform154[0] - boxsize) && boxX <= (platform154[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform154[0] - boxsize);
      }

      if (boxY <= (platform154[1] + platform154[3] - boxsize) && boxY >= (platform154[1] - boxsize) && boxX <= (platform154[0] + platform154[2]) && boxX >= (platform154[0] + (platform154[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform154[0] + (platform154[2]));
      }



      if (boxY <= (platform154[1] +  platform154[3]) && boxY >= (platform154[1] + boxsize)  && boxX > (platform154[0] - boxsize) && boxX < (platform154[0] + platform154[2])) {
        jump = -7;
      }


      if ( boxX >= (platform154[0] + platform154[2]) && check == platform154[4]|| boxX <= (platform154[0] - boxsize) && check == platform154[4]) {
        //println("off platform");
        jump = -7;
        jumpboolean = true;
      }

      //Platform 1 of 1-5
      int[] platform155 = {99, 350, 100, 50, 19};
      fill(0, 128, 128);
      rect(platform155[0], platform155[1], platform155[2], platform155[3]);


      if (boxY <= (platform155[1] + boxsize)  && boxY >= (platform155[1] - boxsize) && boxX > (platform155[0] - boxsize) && boxX < (platform155[0] + platform155[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform155[4];
        boxY =  (platform155[1] - boxsize);
      }

      if (boxY <= (platform155[1] + platform155[3] - boxsize) && boxY >= (platform155[1] - boxsize) && boxX >= (platform155[0] - boxsize) && boxX <= (platform155[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform155[0] - boxsize);
      }

      if (boxY <= (platform155[1] + platform155[3] - boxsize) && boxY >= (platform155[1] - boxsize) && boxX <= (platform155[0] + platform155[2]) && boxX >= (platform155[0] + (platform155[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform155[0] + (platform155[2]));
      }



      if (boxY <= (platform155[1] +  platform155[3]) && boxY >= (platform155[1] + boxsize)  && boxX > (platform155[0] - boxsize) && boxX < (platform155[0] + platform155[2])) {
        jump = -7;
      }


      if ( boxX >= (platform155[0] + platform155[2]) && check == platform155[4]|| boxX <= (platform155[0] - boxsize) && check == platform155[4]) {
        //println("off platform");
        jump = -7;
        jumpboolean = true;
      }

      //Platform 1 of 1-5
      int[] platform156 = {0, 280, 100, 120, 20};
      fill(0, 128, 128);
      rect(platform156[0], platform156[1], platform156[2], platform156[3]);


      if (boxY <= (platform156[1] + boxsize)  && boxY >= (platform156[1] - boxsize) && boxX > (platform156[0] - boxsize) && boxX < (platform156[0] + platform156[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform156[4];
        boxY =  (platform156[1] - boxsize);
      }

      if (boxY <= (platform156[1] + platform156[3] - boxsize) && boxY >= (platform156[1] - boxsize) && boxX >= (platform156[0] - boxsize) && boxX <= (platform156[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform156[0] - boxsize);
      }

      if (boxY <= (platform156[1] + platform156[3] - boxsize) && boxY >= (platform156[1] - boxsize) && boxX <= (platform156[0] + platform156[2]) && boxX >= (platform156[0] + (platform156[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform156[0] + (platform156[2]));
      }



      if (boxY <= (platform156[1] +  platform156[3]) && boxY >= (platform156[1] + boxsize)  && boxX > (platform156[0] - boxsize) && boxX < (platform156[0] + platform156[2])) {
        jump = -7;
      }

      if ( boxX >= (platform156[0] + platform156[2]) && check == platform156[4]|| boxX <= (platform156[0] - boxsize) && check == platform156[4]) {
        //println("off platform");
        jump = -7;
        jumpboolean = true;
      }


      int[] platform157 = {154, 0, 50, 235, 21};
      fill(0, 128, 128);
      rect(platform157[0], platform157[1], platform157[2], platform157[3]);


      if (boxY <= (platform157[1] + boxsize)  && boxY >= (platform157[1] - boxsize) && boxX > (platform157[0] - boxsize) && boxX < (platform157[0] + platform157[2])) {
        platform = true;
      } else {
        platform = false;
      }

      if (platform == true) {
        check = platform157[4];
        boxY =  (platform157[1] - boxsize);
      }

      if (boxY <= (platform157[1] + platform157[3] - boxsize) && boxY >= (platform157[1] - boxsize) && boxX >= (platform157[0] - boxsize) && boxX <= (platform157[0] - boxsize /2 )) {
        moveright = false;
        boxX = (platform157[0] - boxsize);
      }

      if (boxY <= (platform157[1] + platform157[3] - boxsize) && boxY >= (platform157[1] - boxsize) && boxX <= (platform157[0] + platform157[2]) && boxX >= (platform157[0] + (platform157[2]) - boxsize /2 )) {
        moveleft = false;
        boxX = (platform157[0] + (platform157[2]));
      }



      if (boxY <= (platform157[1] +  platform157[3]) && boxY >= (platform157[1] + boxsize)  && boxX > (platform157[0] - boxsize) && boxX < (platform157[0] + platform157[2])) {
        jump = -7;
      }


      if ( boxX >= (platform157[0] + platform157[2]) && check == platform157[4]|| boxX <= (platform157[0] - boxsize) && check == platform157[4]) {
        //println("off platform");
        check = 999;
        jump = -7;
        jumpboolean = true;
      }

      if (check == 999 && jump < 15) {
        jump = -7;
        jumpboolean = true;
      }



      //Glasses OFF
    }



    int[] platform152 = {154, 230, 260, 50, 16};
    fill(0, 128, 128);
    rect(platform152[0], platform152[1], platform152[2], platform152[3]);


    if (boxY <= (platform152[1] + boxsize)  && boxY >= (platform152[1] - boxsize) && boxX > (platform152[0] - boxsize) && boxX < (platform152[0] + platform152[2])) {
      platform = true;
    } else {
      platform = false;
    }

    if (platform == true) {
      check = platform152[4];
      boxY =  (platform152[1] - boxsize);
    }

    if (boxY <= (platform152[1] + platform152[3] - boxsize) && boxY >= (platform152[1] - boxsize) && boxX >= (platform152[0] - boxsize) && boxX <= (platform152[0] - boxsize /2 )) {
      moveright = false;
      boxX = (platform152[0] - boxsize);
    }

    if (boxY <= (platform152[1] + platform152[3] - boxsize) && boxY >= (platform152[1] - boxsize) && boxX <= (platform152[0] + platform152[2]) && boxX >= (platform152[0] + (platform152[2]) - boxsize /2 )) {
      moveleft = false;
      boxX = (platform152[0] + (platform152[2]));
    }



    if (boxY <= (platform152[1] +  platform152[3]) && boxY >= (platform152[1] + boxsize)  && boxX > (platform152[0] - boxsize) && boxX < (platform152[0] + platform152[2])) {
      jump = -7;
    }


    if ( boxX >= (platform152[0] + platform152[2]) && check == platform152[4]|| boxX <= (platform152[0] - boxsize) && check == platform152[4]) {
      //println("off platform");
      check = 999;
      jump = -7;
      jumpboolean = true;
    }

    if (check == 999 && jump < 15) {
      jump = -7;
      jumpboolean = true;
    }

    int[] endplatform5 = {360, 222, 35, 9, 5};
    fill(218, 165, 32);
    rect(endplatform5[0], endplatform5[1], endplatform5[2], endplatform5[3]);
    if (boxY <= (endplatform5[1] + 20)  && boxY >= (endplatform5[1] - 20) && boxX >=  (endplatform5[0] - 20) && boxX <= (endplatform5[0] + 30) && level == endplatform5[4]) {
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

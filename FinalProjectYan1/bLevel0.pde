public void level0() {
  if (level == 0) {


    //Border
    if ( player.boxX >= 680 && player.boxY >= -10 && player.boxY < 700) {
      player.moveRight = false;
      player.boxX = 680;
    }

    if ( player.boxX <= 0 && player.boxY >= -10 && player.boxY < 700) {
      player.moveLeft = false;
      player.boxX = 0;
    }

    if (levelTimer == 0) {
      LevelReset();
      player.boxX = 335;
      player.boxY = 640;
    }
    levelTimer++;


    if (levelSelect == 0) {
      
       image(titleImage, 185, 50);
       
       
       
      strokeWeight(2);
      stroke(255, 0, 0);
      fill(128, 128, 128);
      rect(100, 200, 200, 100);

      rect(400, 200, 200, 100);


      rect(245, 400, 200, 100);


      //Text

      fill(255);
      textSize(20);
      text("Start", 175, 255);

      text("Exit", 475, 255);

      text("Levels", 310, 455);
    }







    if (levelSelect == 1) {
             image(world1, 200, 100);
      strokeWeight(2);
      stroke(255, 0, 0);
      fill(128, 128, 128);

      rect(30, 440, 200, 100);


      rect(480, 440, 200, 100);


      //Text

      fill(255);
      textSize(20);
      text("Back", 100, 495);

      text("Next", 555, 495);


      for (int levelBox = 130; levelBox < 540; levelBox = levelBox+100) {
        float[] levels1 = {levelBox, 250, 50, 50};
        strokeWeight(2);
        stroke(255, 255, 255);
        fill(0xff676767);
        rect(levels1[0], levels1[1], levels1[2], levels1[3]);
      }


      if (levelUnlocked < 6) {
        for (int i = 1; i < ((levelUnlocked + 1) * 100) + 30; i = i+1) {
          for (int levelBox = 130; levelBox < i; levelBox = levelBox+100) {
            float[] levels1 = {levelBox, 250, 50, 50};
            strokeWeight(2);
            stroke(255, 255, 255);
            fill(0xff268DB4);
            rect(levels1[0], levels1[1], levels1[2], levels1[3]);
          }
        }
      } else if (levelUnlocked >= 6) {
        for (int levelBox = 130; levelBox < 540; levelBox = levelBox+100) {
          float[] levels1 = {levelBox, 250, 50, 50};
          strokeWeight(2);
          stroke(255, 255, 255);
          fill(0xff268DB4);
          rect(levels1[0], levels1[1], levels1[2], levels1[3]);
        }
      }





      for (int levelBox2 = 230; levelBox2 < 440; levelBox2 = levelBox2+100) {
        float[] levels2 = {levelBox2, 350, 50, 50};
        strokeWeight(2);
        stroke(255, 255, 255);
        fill(0xff676767);
        rect(levels2[0], levels2[1], levels2[2], levels2[3]);
      }

      if (levelUnlocked >= 6 && levelUnlocked <= 8) {
        for (int i = 1; i < ((levelUnlocked - 3) * 100) + 30; i = i+1) {
          for (int levelBox2 = 230; levelBox2 < i; levelBox2 = levelBox2+100) {
            float[] levels2 = {levelBox2, 350, 50, 50};
            strokeWeight(2);
            stroke(255, 255, 255);
            fill(0xff268DB4);
            rect(levels2[0], levels2[1], levels2[2], levels2[3]);
          }
        }
      } else if ( levelUnlocked >= 8) {
        for (int levelBox2 = 230; levelBox2 < 440; levelBox2 = levelBox2+100) {
          float[] levels2 = {levelBox2, 350, 50, 50};
          strokeWeight(2);
          stroke(255, 255, 255);
          fill(0xff268DB4);
          rect(levels2[0], levels2[1], levels2[2], levels2[3]);
        }
      }



      strokeWeight(2);
      stroke(255, 255, 255);
      fill(0xff676767);
      rect(330, 450, 50, 50);



      if (levelUnlocked >= 9) {
        strokeWeight(2);
        stroke(255, 255, 255);
        fill(0xff268DB4);
        rect(330, 450, 50, 50);
      }



      //Numbers Set 1
      fill(255);
      textSize(20);
      text(1, 130 + 18, 250 + 30);
      text(2, 230 + 18, 250 + 30);
      text(3, 330 + 18, 250 + 30);
      text(4, 430 + 18, 250 + 30);
      text(5, 530 + 18, 250 + 30);

      //Numbers Set 2
      text(6, 230 + 18, 350 + 30);
      text(7, 330 + 18, 350 + 30);
      text(8, 430 + 18, 350 + 30);
      //Number Set 3
      text(9, 330 + 18, 450 + 30);
    }


    if (levelSelect == 2) {

      strokeWeight(2);
      stroke(255, 0, 0);
      fill(128, 128, 128);

      rect(30, 440, 200, 100);

      fill(255);
      textSize(20);
      text("Back", 100, 495);


      fill(255);
           image(comingImage, 180, 165);
    }

    //Move Across Screen Left To Right & Right to Left
    if ( player.boxX > 695 && player.boxY >= -15 && player.boxY < 700) {
      player.boxX = -15;
    }

    if ( player.boxX < -15 && player.boxY >= -15 && player.boxY < 700) {
      player.boxX = 695;
    }
  }
}

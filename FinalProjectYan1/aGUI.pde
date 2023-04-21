public class aGUI {
  private boolean toolTip, pauseMenu, developerOptions;
  private int mX, mY, levelSelect, worldUnlocked, levelUnlocked, statSelect;
  private int levelStat = 1;
  private int worldStat = 1;
  private PImage titleImage, endImage, comingImage, world1DataImage, world2DataImage, world1, world2;

  private float[] timeStats = new float[10];
  private int[] deathStats = new int[10];
  private int[] jumpStats = new int[10];
  private int[] rightStats = new int[10];
  private int[] leftStats = new int[10];

  public aGUI(boolean toolTip, boolean pauseMenu, boolean developerOptions) {
    this.toolTip = toolTip;
    this.pauseMenu = pauseMenu;
    this.developerOptions = developerOptions;
  }

  public void load() {
    getData();
    surface.setTitle("Slime World");
    titleImage = loadImage("title.png");
    endImage = loadImage("end.png");
    comingImage = loadImage("coming.png");
    world1DataImage = loadImage("world1Data.png");
    world2DataImage = loadImage("world2Data.png");
    world1 = loadImage("world1.png");
    world2 = loadImage("world2.png");
  }

  public void getData() {
    json = loadJSONObject("data/data.json");
    worldUnlocked = json.getInt("worldUnlocked");
    levelUnlocked = json.getInt("levelUnlocked");

    try {
      saveData = loadJSONArray("data/stats.json");
    } 
    catch (Exception e) {
      saveData = new JSONArray();
      for (int i = 0; i < 2; i++) {
        JSONArray worldArray = new JSONArray();
        for (int j = 0; j < 9; j++) {
          JSONArray levelArray = new JSONArray();
          worldArray.append(levelArray);
        }
        saveData.append(worldArray);
      }
    }
  }


  public void setWindow(int windowX, int windowY) {
    surface.setSize(windowX, windowY);
  }

  public void setTransitionWindow(int windowX, int windowY ) {
    int speed = 1;
    if (width < windowX) {
      surface.setSize(width + speed, height);
    }

    if (height < windowY) {
      surface.setSize(width, height + speed);
    }
  }

  private void insertionSort(int[] arr) {
    for (int i = 1; i < arr.length; i++) {
      int curNumber = arr[i];
      int curIndex = i-1;
      while ( curIndex >= 0 && arr[curIndex] > curNumber) {
        arr[curIndex+1] = arr[curIndex];
        curIndex--;
      }
      arr[curIndex + 1] = curNumber;
    }
  }

  private void insertionSort(float[] arr) {
    for (int i = 1; i < arr.length; i++) {
      float curNumber = arr[i];
      int curIndex = i-1;
      while ( curIndex >= 0 && arr[curIndex] > curNumber) {
        arr[curIndex+1] = arr[curIndex];
        curIndex--;
      }
      arr[curIndex + 1] = curNumber;
    }
  }



  public boolean getPauseMenu() {
    return pauseMenu;
  }

  public boolean getDeveloperOptions() {
    return developerOptions;
  }

  public void setMouseValues(int x, int y) {
    this.mX = x;
    this.mY = y;
  }


  public void pauseMenuToggle() {
    if (levelSelect == 0) {
      if (pauseMenu == false && world.level != 0) {
        pauseMenu = true;
      } else {
        pauseMenu = false;
      }
    }
  }

  public void levelSelectToggle() {
    levelSelect--;
    if (levelSelect < -2) {
      levelSelect = 0;
    }
  }

  public void toolTipToggle() {
    if (toolTip == false) {
      toolTip = true;
    } else {
      toolTip = false;
    }
  }

  public void developerOptionsToggle() {
    if (developerOptions == false) {
      developerOptions = true;
    } else {
      developerOptions = false;
    }
  }

  public void displayToolTip() {

    if (world.level != 0) {
      fill(#3DE030);
      textSize(15);

      if (toolTip == true) {
        text("FPS: " + (int)frameRate, 0, 15);
        text("Level Timer: " + world.levelTimer / 100, 0, 30);
        text("Level: " + world.level, 0, 45);

        if (developerOptions == true) {

          text("Box X Value: " +   players.get(0).setX, 0, 60);
          text("Box Y Value: " +   players.get(0).setY, 0, 75);
          text("Speed: " +   players.get(0).speed, 0, 90);
          text("Jump Height: " +   players.get(0).jump, 0, 105);
          text("Level Select State: " + levelSelect, 0, 135);
          text("To Increase Speed Press: P", 0, 165);
          text("To Increase Jump Height Press: H", 0, 180);
          text("To Select Any Level Press: L", 0, 195);
          text("To Remove ToolTips Press: T", 0, 210);
        }
      } else {
        text("Level: " + world.level, 0, 15);
      }
    }
  }



  public void displayPauseMenu() {
    fill(#3DE030);
    textSize(15);

    if ( pauseMenu == true && world.level != 0) {
      fill(0, 220);
      rect(-10, -10, 800, 800);

      strokeWeight(2);
      stroke(255, 0, 0);
      fill(128, 128, 128);
      rect(100, 200, 200, 100);

      rect(400, 200, 200, 100);


      rect(245, 400, 200, 100);


      //Text

      fill(255);
      textSize(20);
      text("Restart", 160, 255);

      text("Reset Progress", 430, 255);

      text("Main Menu", 290, 455);
    }
  }

  public void displayLevelSelect() {
    strokeWeight(2);
    stroke(255, 0, 0);
    fill(128, 128, 128);

    rect(30, 440, 200, 100);


    fill(255);
    textSize(20);
    text("Back", 100, 495);

    if (levelSelect == 1) {

      fill(128, 128, 128);
      rect(480, 440, 200, 100);

      fill(255);
      textSize(20);
      text("Next", 555, 495);
    }







    for (int levelBox = 130; levelBox < 540; levelBox = levelBox+100) {
      float[] levels1 = {levelBox, 250, 50, 50};
      strokeWeight(2);
      stroke(255, 255, 255);
      fill(0xff676767);
      rect(levels1[0], levels1[1], levels1[2], levels1[3]);
    }


    for (int levelBox2 = 230; levelBox2 < 440; levelBox2 = levelBox2+100) {
      float[] levels2 = {levelBox2, 350, 50, 50};
      strokeWeight(2);
      stroke(255, 255, 255);
      fill(0xff676767);
      rect(levels2[0], levels2[1], levels2[2], levels2[3]);
    }
    strokeWeight(2);
    stroke(255, 255, 255);
    fill(0xff676767);
    rect(330, 450, 50, 50);


    if (worldUnlocked == levelSelect) {


      if (levelUnlocked >= 6) {
        for (int levelBox = 130; levelBox < 540; levelBox = levelBox+100) {
          float[] levels1 = {levelBox, 250, 50, 50};
          strokeWeight(2);
          stroke(255, 255, 255);
          fill(0xff268DB4);
          rect(levels1[0], levels1[1], levels1[2], levels1[3]);
        }
      } else  if (levelUnlocked < 6) {
        for (int i = 1; i < ((levelUnlocked + 1) * 100) + 30; i = i+1) {
          for (int levelBox = 130; levelBox < i; levelBox = levelBox+100) {
            float[] levels1 = {levelBox, 250, 50, 50};
            strokeWeight(2);
            stroke(255, 255, 255);
            fill(0xff268DB4);
            rect(levels1[0], levels1[1], levels1[2], levels1[3]);
          }
        }
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

      if (levelUnlocked >= 9) {
        strokeWeight(2);
        stroke(255, 255, 255);
        fill(0xff268DB4);
        rect(330, 450, 50, 50);
      }
    }

    if (worldUnlocked > levelSelect) {
      for (int levelBox = 130; levelBox < 540; levelBox = levelBox+100) {
        float[] levels1 = {levelBox, 250, 50, 50};
        strokeWeight(2);
        stroke(255, 255, 255);
        fill(0xff268DB4);
        rect(levels1[0], levels1[1], levels1[2], levels1[3]);
      }

      for (int levelBox2 = 230; levelBox2 < 440; levelBox2 = levelBox2+100) {
        float[] levels2 = {levelBox2, 350, 50, 50};
        strokeWeight(2);
        stroke(255, 255, 255);
        fill(0xff268DB4);
        rect(levels2[0], levels2[1], levels2[2], levels2[3]);
      }


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



  public void displayButtons() {

    if (world.level == 0) {

      if (levelSelect == 0) {

        image(titleImage, 185, 50);



        strokeWeight(2);
        stroke(255, 0, 0);
        fill(128, 128, 128);
        rect(100, 200, 200, 100);

        rect(400, 200, 200, 100);


        rect(245, 350, 200, 100);

        rect(245, 480, 200, 100);


        //Text

        fill(255);
        textSize(20);
        text("Start", 175, 255);

        text("Exit", 475, 255);

        text("Levels", 310, 405);

        text("Statistics", 300, 535);
      }





      if (levelSelect == 1) {
        image(world1, 200, 100);
        displayLevelSelect();
      }


      if (levelSelect == 2) {
        image(world2, 200, 100);
        displayLevelSelect();
      }

      if (world.level == 10) {
        image(endImage, 190, 160);
        strokeWeight(2);
        stroke(255, 0, 0);
        fill(128, 128, 128);
        rect(100, 350, 200, 100);

        rect(400, 350, 200, 100);


        //Text

        fill(255);
        textSize(20);
        text("Restart", 160, 405);

        text("Exit", 475, 405);
      }
    }
  }

  public void dataReset() {
    for (int i = 0; i < 10; i++) {
      timeStats[i] = 0;
      deathStats[i]  = 0;
      jumpStats[i]  = 0;
      rightStats[i]  = 0;
      leftStats[i] = 0;
    }
  }


  public void setData (int levelStat) {
    getData();
    JSONArray worldArray = saveData.getJSONArray(worldStat - 1);
    JSONArray levelArray = worldArray.getJSONArray(levelStat - 1);
    for (int i = 0; i < levelArray.size(); i++) {
      JSONObject levelData = levelArray.getJSONObject(i);
      timeStats[i] = levelData.getInt("levelTime");
      deathStats[i]  = levelData.getInt("deaths");
      jumpStats[i]  = levelData.getInt("jumps");
      rightStats[i]  = levelData.getInt("right");
      leftStats[i] = levelData.getInt("left");
    }
  }


  public void displayDeveloperButtons() {



    if (levelSelect == -1) {

      fill(0, 220);
      rect(-10, -10, 800, 800);
      image(world1, 200, 50);
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
        fill(0xff268DB4);
        rect(levels1[0], levels1[1], levels1[2], levels1[3]);
      }

      for (int levelBox2 = 230; levelBox2 < 440; levelBox2 = levelBox2+100) {
        float[] levels2 = {levelBox2, 350, 50, 50};
        strokeWeight(2);
        stroke(255, 255, 255);
        fill(0xff268DB4);
        rect(levels2[0], levels2[1], levels2[2], levels2[3]);
      }


      strokeWeight(2);
      stroke(255, 255, 255);
      fill(0xff268DB4);
      rect(330, 450, 50, 50);

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

    if (levelSelect == -2) {
      fill(0, 220);
      rect(-10, -10, 800, 800);
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

    if (levelSelect == 999 || levelSelect == 1000) {
      if (levelSelect == 999) {
        image(world1DataImage, 180, 30);
      } else if (levelSelect == 1000) {
        image(world2DataImage, 180, 30);
      }

      fill(128, 128, 128);
      stroke(255);
      strokeWeight(2);
      rect(40, 120, 620, 460);


      stroke(255);
      line(160, 120, 160, 580);


      for (int i = 0; i < 9; i++) {
        fill(255);
        textSize(15);
        text("Level " + (i + 1), 65, (42 * i) + 190);
      }

      for (int i = 120; i < 620; i = i + 42) {
        stroke(255);
        line(40, i, 660, i);
      }

      fill(0, 220);
      switch(levelStat) {
      case 1:

        rect(40, 162, 120, 42);
        break;
      case 2:
        rect(40, 204, 120, 42);
        break;
      case 3:
        rect(40, 246, 120, 42);
        break;
      case 4:
        rect(40, 289, 120, 42);
        break;
      case 5:
        rect(40, 330, 120, 42);
        break;
      case 6:
        rect(40, 372, 120, 42);
        break;
      case 7:
        rect(40, 415, 120, 42);

        break;

      case 8:
        rect(40, 455, 120, 42);
        break;

      case 9:
        rect(40, 500, 120, 42);
        break;
      }

      if ( statSelect == 0) {
        dataReset();
        fill(255);
        textSize(15);
        text("Overall Level Data:", 180, 145);
        getData();
        setData(levelStat);
        JSONArray worldArray = saveData.getJSONArray(worldStat - 1);
        JSONArray levelArray = worldArray.getJSONArray(levelStat - 1);
        for (int i = 0; i < levelArray.size(); i++) {
          JSONObject levelData = levelArray.getJSONObject(i);
          float timeData = levelData.getInt("levelTime");
          int deathData = levelData.getInt("deaths");
          int jumpData = levelData.getInt("jumps");
          int rightData = levelData.getInt("right");
          int leftData = levelData.getInt("left");
          fill(255);
          textSize(15);
          text( "Level Time: " + (timeData / 100) + "s , Jumps: " + jumpData + ", Deaths: " + deathData + ", Right: " + rightData + ", Lefts: " + leftData, 180, (i * 42) + 190);
        }
      }


      fill(255);
      textSize(15);
      switch(statSelect) {
      case 1:
        text("Sorted Time:", 180, 145);
        insertionSort(timeStats);
        break;
      case 2:
        text("Sorted Jumps:", 180, 145);
        insertionSort(jumpStats);
        break;
      case 3:
        text("Sorted Deaths:", 180, 145);
        insertionSort(deathStats);
        break;
      case 4:
        text("Sorted Rights", 180, 145);
        insertionSort(rightStats);
        break;

      case 5:
        text("Sorted Lefts", 180, 145);
        insertionSort(leftStats);
        break;
      }

      for (int i = 0; i < 10; i++) {
        fill(255);
        textSize(15);
        switch(statSelect) {
        case 1:
          text( "Level Time: " + (timeStats[i] / 100), 180, (i * 42) + 190);
          break;
        case 2:

          text( "Jumps: " + (jumpStats[i]), 180, (i * 42) + 190);
          break;
        case 3:

          text( "Deaths: " + (deathStats[i]), 180, (i * 42) + 190);
          break;
        case 4:

          text( "Rights: " + (rightStats[i]), 180, (i * 42) + 190);
          break;

        case 5:

          text( "Lefts: " + (leftStats[i]), 180, (i * 42) + 190);
          break;
        }
      }





      fill(#272523);
      strokeWeight(2);
      stroke(255, 0, 0);
      rect(30, 580, 200, 100);
      if (levelSelect == 999) {

        rect(480, 580, 200, 100);
        fill(255);
        textSize(20);
        text("Next", 555, 635);
      }

      fill(255);
      textSize(20);
      text("Back", 100, 635);
    }
  }

  public void checkClick() {
    if (GUI.getPauseMenu()) {
      if  (mY <= 300 && mY >= 200 && mX > 100 && mX < 300) {

        world.spawn();
        pauseMenu = false;
        return;
      }

      if  (mY <= 300 && mY >= 200 && mX > 400 && mX < 600) {
        world.spawn();
        world.level = 1;

        json = new JSONObject();
        json.setInt("levelUnlocked", world.level);
        saveJSONObject(json, "data/data.json");
        pauseMenu = false;
        return;
      }

      if  (mY <= 500 && mY >= 400 && mX > 245 && mX < 445) {

        world.world = 1;
        world.level = 0;
        levelSelect = 0;
        setWindow(700, 700);
        world.spawn();
        pauseMenu = false;
        return;
      }
    }
    if (levelSelect == 0 ) {


      if  (mY <= 300 && mY >= 200 && mX > 100 && mX < 300 && world.level == 0) {
        levelSelect = 0;
        println("Button Pressed");
        world.spawn();
        world.level++;
        if (world.level >= levelUnlocked) {
          json = new JSONObject();
          json.setInt("levelUnlocked", world.level);
          saveJSONObject(json, "data/data.json");
        }
      }

      if  (mY <= 300 && mY >= 200 && mX > 400 && mX < 600 && world.level == 0) {
        exit();
      }

      if  (mY <= 580 && mY >= 480 && mX > 245 && mX < 445 && world.level == 0) {
        levelSelect = 999;
      }


      if  (mY <= 450 && mY >= 350 && mX > 245 && mX < 445 && world.level == 0 &&   levelSelect == 0) {
        levelSelect = 1;
        json = loadJSONObject("data/data.json");
        levelUnlocked = json.getInt("levelUnlocked");
      }
    }

    if (levelSelect == -1) {


      if (mY <= 540 && mY >= 440 && mX > 30 && mX < 230) {
        levelSelect++;
        return;
      }

      if  (mY <= 540 && mY >= 440 && mX > 30 && mX < 230) {

        levelSelect = 0;
        world.level = 0;
        world.spawn();
      }


      if  (mY <= 300 && mY >= 250 && mX > 130 && mX < 180) {

        levelSelect = 0;
        world.level = 1;
        world.spawn();
      }

      if  (mY <= 300 && mY >= 250 && mX > 230 && mX < 230 + 50) {

        levelSelect = 0;
        world.level = 2;
        world.spawn();
      }

      if  (mY <= 300 && mY >= 250 && mX > 330 && mX < 330 + 50) {

        levelSelect = 0;
        world. level = 3;
        world.spawn();
      }

      if  (mY <= 300 && mY >= 250 && mX > 430 && mX < 430 + 50) {

        levelSelect = 0;
        world.level = 4;
        world.spawn();
      }

      if  (mY <= 300 && mY >= 250 && mX > 530 && mX < 530 + 50) {

        levelSelect = 0;
        world.level = 5;
        world.spawn();
      }

      if  (mY <= 400 && mY >= 350 && mX > 230 && mX < 230 + 50) {

        levelSelect = 0;
        world.level = 6;
        world.spawn();
      }

      if  (mY <= 400 && mY >= 350 && mX > 330 && mX < 330 + 50) {

        levelSelect = 0;
        world.level = 7;
        world.spawn();
      }

      if  (mY <= 400 && mY >= 350 && mX > 430 && mX < 430 + 50) {

        levelSelect = 0;
        world.level = 8;
        world.spawn();
      }

      if  (mY <= 500 && mY >= 450 && mX > 330 && mX < 330 + 50) {

        levelSelect = 0;
        world.level = 9;
        world.spawn();
      }




      if  (mY <= 500 && mY >= 4 && mX > 480 && mX < 680 + 50) {
      }

      if  (mY <= 540 && mY >= 440 && mX > 480 && mX < 680 + 50) {

        levelSelect--;
      }
    }

    if (levelSelect == -2) {
      if (mY <= 540 && mY >= 440 && mX > 30 && mX < 230) {
        levelSelect++;
        return;
      }
    }

    if (levelSelect == 1 || levelSelect == 2) {
      world.world = levelSelect;

      if (mY <= 540 && mY >= 440 && mX > 30 && mX < 230 && world.level == 0) {
        world. level = 0;
        levelSelect--;
        pauseMenu = false;
        return;
      }

      if  (mY <= 540 && mY >= 440 && mX > 30 && mX < 230 && world.level == 0) {
        if (1 <= levelUnlocked) {
          levelSelect = 0;
          world.level = 0;
          world.spawn();
        }
      }


      if  (mY <= 300 && mY >= 250 && mX > 130 && mX < 180 && world.level == 0) {
        if (1 <= levelUnlocked) {
          levelSelect = 0;
          world.level = 1;
          world.spawn();
        }
      }

      if  (mY <= 300 && mY >= 250 && mX > 230 && mX < 230 + 50 && world.level == 0) {
        if (2 <= levelUnlocked) {
          levelSelect = 0;
          world.level = 2;
          world.spawn();
        }
      }

      if  (mY <= 300 && mY >= 250 && mX > 330 && mX < 330 + 50 && world.level == 0) {
        if (3 <= levelUnlocked) {
          levelSelect = 0;
          world.level = 3;
          world.spawn();
        }
      }

      if  (mY <= 300 && mY >= 250 && mX > 430 && mX < 430 + 50 && world.level == 0) {
        if (4 <= levelUnlocked) {
          levelSelect = 0;
          world.level = 4;
          world.spawn();
        }
      }

      if  (mY <= 300 && mY >= 250 && mX > 530 && mX < 530 + 50 && world.level == 0) {
        if (5 <= levelUnlocked) {
          levelSelect = 0;
          world.level = 5;
          world.spawn();
        }
      }

      if  (mY <= 400 && mY >= 350 && mX > 230 && mX < 230 + 50 && world.level == 0) {
        if (6 <= levelUnlocked) {
          levelSelect = 0;
          world.level = 6;
          world.spawn();
        }
      }

      if  (mY <= 400 && mY >= 350 && mX > 330 && mX < 330 + 50 && world.level == 0) {
        if (7 <= levelUnlocked) {
          levelSelect = 0;
          world.level = 7;
          world.spawn();
        }
      }

      if  (mY <= 400 && mY >= 350 && mX > 430 && mX < 430 + 50 && world.level == 0) {
        if (8 <= levelUnlocked) {
          levelSelect = 0;
          world.level = 8;
          world.spawn();
        }
      }

      if  (mY <= 500 && mY >= 450 && mX > 330 && mX < 330 + 50 && world.level == 0) {
        if (9 <= levelUnlocked) {
          levelSelect = 0;
          world.level = 9;
          world.spawn();
        }
      }


      if  (mY <= 540 && mY >= 440 && mX > 480 && mX < 680 + 50 && world.level == 0 && levelSelect == 1) {

        levelSelect++;
      }
    }


    if (levelSelect == 999 || levelSelect == 1000) {
      if  (mY <= 202 && mY >= 120 && mX > 40 && mX < 160 && world.level == 0) {
        levelStat = 1;
        dataReset();
        setData(1);
      }
      if  (mY <= 246 && mY >= 202 && mX > 40 && mX < 160 && world.level == 0) {
        levelStat = 2;
        dataReset();
        setData(2);
      }
      if  (mY <= 287 && mY >= 246 && mX > 40 && mX < 160 && world.level == 0) {
        levelStat = 3;
        dataReset();
        setData(3);
      }
      if  (mY <= 332 && mY >= 288 && mX > 40 && mX < 160 && world.level == 0) {
        levelStat = 4;
        dataReset();
        setData(4);
      }
      if  (mY <= 375 && mY >= 330 && mX > 40 && mX < 160 && world.level == 0) {
        levelStat = 5;
        dataReset();
        setData(5);
      }
      if  (mY <= 414 && mY >= 370 && mX > 40 && mX < 160 && world.level == 0) {
        levelStat = 6;
        dataReset();
        setData(6);
      }
      if  (mY <= 456 && mY >= 414 && mX > 40 && mX < 160 && world.level == 0) {
        levelStat = 7;
        dataReset();
        setData(7);
      }
      if  (mY <= 498 && mY >= 455 && mX > 40 && mX < 160 && world.level == 0) {
        levelStat = 8;
        dataReset();
        setData(8);
      }
      if  (mY <= 539 && mY >= 497 && mX > 40 && mX < 160 && world.level == 0) {
        levelStat = 9;
        dataReset();
        setData(9);
      }

      if  (mY <= 160 && mY >= 120 && mX > 160 && mX < 660 && world.level == 0) {
        statSelect++;
        if (statSelect > 5) {
          statSelect = 0;
        }
      }

      if  (mY <= 679 && mY >= 579 && mX > 30 && mX < 230 && world.level == 0 && levelSelect == 999) {
        levelSelect = 0;
      }

      if  (mY <= 679 && mY >= 579 && mX > 30 && mX < 230 && world.level == 0 && levelSelect == 1000) {
        levelSelect--;
        worldStat--;
      }

      if  (mY <= 681 && mY >= 580 && mX > 480 && mX < 680 && world.level == 0 && levelSelect == 999) {
        levelSelect++;
        worldStat++;
      }
    }






    if  ( mY <= 450 && mY >= 350 && mX > 400 && mX < 600 && world.level == 10) {
      exit();
    }


    if  (mY <= 450 && mY >= 350 && mX > 100 && mX < 300 && world.level == 10) {
      world.spawn();
      world.level = 1;
    } else if (world.level == 10) {
      println("Button Not Pressed");
    }
  }
}

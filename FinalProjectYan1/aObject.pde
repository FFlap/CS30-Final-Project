public class aObject {
    private int setX, setY, setW, setL, setX2, setY2;
    private int presetW = 0;
    private int presetL = 0;
    private String setType;


  public aObject(String setType, int setX, int setY) {
    this.setX = setX;
    this.setY = setY;
    this.setType = setType;
  }
  
    public aObject(String setType, int setX, int setY, int setL, int setW) {
    this.setX = setX;
    this.setY = setY;
    this.setW = setW;
    this.setL = setL;
    this.setType = setType;
    this.setW = setX2;
    this.setL = setY2;

  }
  
    public aObject(String setType, int setX, int setY, int setX2, int setY2, int setTeleport, ) {
    this.setType = setType;
    this.setX = setX;
    this.setY = setY;
    this.setX2 = setX2;
    this.setX2 = setY2;

  }
  
  public void display(){ 
    
    switch(setType) {
      case "deathZone": 
       fill(255, 0, 0);
    rect(setX, setY, setL, setW);
    if (player.boxY >= setY - 15 && player.boxY <= (setY + setL) && player.boxX >= setX && player.boxX <= (setX + setL)) {
     levelTimer = 0;
    }
    case "portal":
    
      default:


    
    
    
    
    } 
    
  }

  
  
}

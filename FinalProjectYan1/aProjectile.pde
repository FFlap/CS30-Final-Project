public class aProjectile extends aGameObject {
  private float projectileX, projectileY, projectileSpeedX, projectileSpeedY, projectileAngle, projectileTimer, speed, timeLimit;
  private boolean projectileActive = true;
  private boolean targetGround, targetRight, targetLeft;
  private String setType;

  public aProjectile(String setType, int visibility, int setX, int setY, int setL, int setW) {
    super(visibility, setX, setY, setL, setW);
    this.setType = setType;
  }


  public float getProjectileX() {
    return setX;
  }

  public float getProjectileY() {
    return setY;
  }

  public void targetMouse(int projectileMouseX, int projectileMouseY) {
    this.projectileX =   players.get(0).getX();
    this.projectileY =    players.get(0).getY();
    this.projectileAngle = atan2(projectileMouseY - getY(), projectileMouseX - getX());
  }
  public void targetPlayer() {

    this.projectileX =  getX();
    this.projectileY =   getY();
    this.projectileAngle = atan2(players.get(0).getY() - projectileY, players.get(0).getX()  - projectileX);
  }






  public void display() {
    if ((visibility == 0 || visibility == getViewVisibility()) && projectileActive) {
      switch(setType) {

      case "player":
        fill(#7B4CEA);
        speed = 6;
        timeLimit = 50;
        break;

      case "purple":
        fill(#7B4CEA);
        speed = 10;
        targetPlayer();
        timeLimit = 100;

        break;


      case "orange":
        fill(#FFAC46);
        speed = 10;
        targetGround = true;
        timeLimit = 100;
        break;

      case "brown":
        fill(#AA6832);
        speed = 10;
        targetLeft = true;
        timeLimit = 80;
        break;

      default:
        break;
      }


      rect(setX, setY, setL, setW);

      projectileTimer++;
      if (projectileTimer == timeLimit) {
        projectileActive = false;
      }
      if (!targetGround && !targetLeft && !targetRight) {
        projectileSpeedX = speed * cos(projectileAngle);
        projectileSpeedY = speed * sin(projectileAngle);
      }

      if (targetGround) {
        projectileSpeedY = speed;
      }

      if (targetLeft) {
        projectileSpeedX = -speed;
      }

      if (targetRight) {
        projectileSpeedX = speed;
      }
      setX += projectileSpeedX;
      setY += projectileSpeedY;
    }
  }
}

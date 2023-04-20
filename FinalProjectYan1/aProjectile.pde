public class aProjectile extends aGameObject {
  private float projectileX, projectileY, projectileSpeedX, projectileSpeedY, projectileAngle, projectileTimer, speed;
  private boolean projectileActive = true;
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
    this.projectileSpeedX = speed * cos(projectileAngle);
    this.projectileSpeedY = speed * sin(projectileAngle);
  }

  public void targetPlayer() {

    this.projectileX =  getX();
    this.projectileY =   getY();
    this.projectileAngle = atan2(players.get(0).getY() - projectileY, players.get(0).getX()  - projectileX);
    this.projectileSpeedX = speed * cos(projectileAngle);
    this.projectileSpeedY = speed * sin(projectileAngle);
  }

  public void targetGround() {
    this.projectileSpeedY = speed;
  }




  public void display() {
    if ((visibility == 0 || visibility == getViewVisibility()) && projectileActive) {
      switch(setType) {

      case "player":
        speed = 6;
        break;

      case "purple":
        fill(#7B4CEA);
        speed = 10;
        targetPlayer();


        break;


      case "orange":
        fill(#FFAC46);
        speed = 10;
        targetGround();
        break;

      default:
        break;
      }


      rect(setX, setY, setL, setW);

      projectileTimer++;
      if (projectileTimer == 50) {
        projectileActive = false;
      }


      setX += projectileSpeedX;
      setY += projectileSpeedY;
    }
  }
}

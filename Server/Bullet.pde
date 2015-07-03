class Bullet extends Object
{
  int player_num;
  int r = 5;
  
  void init(float _x, float _y, float _rad, float _spd, int _player_num)
  {
    x = _x;
    y = _y;
    spd = _spd;
    rad = _rad + PI / 2;
    vx = spd * cos(rad);
    vy = spd * sin(rad);
    player_num = _player_num;
  }
  
  boolean move()
  {

     return super.move();
  }
  
  void draw()
  {
    switch(player_num)
    {
      case 0:
        fill(255, 255, 0);
        break;
      case 1:
        fill(206, 21, 178);
        break;
      case 2:
        fill(195, 158, 247);
        break;
      case 3:
        fill(0, 0, 255);
        break;
      case 4:
        fill(0, 255, 255);
        break;
      case 5:
        fill(255, 110, 0);
        break;
      case 6:
        fill(171, 239, 181);
        break;
      case 7:
        fill(4, 124, 90);
        break;
      case 8:
        fill(200, 200, 200);
        break;
      case 9:
        fill(0, 255, 0);
        break;
    }
    
    ellipse(x, y, r, r);
  }
  
}

class Player extends Object
{
  int player_number; 
  int bullet_time = 10;
  int bullet_timer = 0;

  void init(float _x, float _y, float _rad, float _spd, int _player_number)
  {
    x = _x;
    y = _y;
    rad = _rad;
    player_number = _player_number;
    spd = _spd;
    
    w = 10; 
    h = 10;
  }
  
  boolean move(KeyStruct keys, Bullet[] bullets, int num_bullets, Item[] items, int num_items)
  { 
    vx = vy = spd;
    bullet_timer++;
    
    if(keys.left)vx = -vx;
    else if(keys.right)vx = vx;
    else vx = 0;
    
    if(keys.up)vy = -vy;
    else if(keys.down)vy = vy;
    else vy = 0;

    if (vx != 0 && vy != 0)
    {
      float sqrt2 = sqrt(2);
      vx /= sqrt2;
      vy /= sqrt2;
    }

    if(keys.up || keys.down || keys.left || keys.right)rad = atan2(-vx, vy);

    if(x < 0 + w / 2)x = w / 2;
    else if(x > width - w / 2)x = width - w / 2;
    
    if(y < 0 + h / 2)y = h / 2;
    else if(y > height - h / 2)y = height - h / 2;



    // shot
    if(keys.space && bullet_time < bullet_timer)
    {
      appendBullet(rad, 5, bullets, num_bullets);
      bullet_timer = 0;
    }
    
    // colision item
    for(int i = 0; i < num_items; i++)
    {
        if(!items[i].flag)continue;
        if(isHit(items[i].x, items[i].y, items[i].r))
        {
          items[i].flag = false;
          
          switch(items[i].kind)
          {
            case 0:
              for(int k = 0; k < 36; k++)
              {
                appendBullet(k * 2 * PI / 36, 5.0, bullets, num_bullets);
                appendBullet(k * 2 * PI / 36, 4.0, bullets, num_bullets);
                appendBullet(k * 2 * PI / 36, 3.0, bullets, num_bullets);
              }
              break;
            case 1:
              for(int k = 0; k < 12; k++)
              {
                appendBullet(k * 2 * PI / 12, 1.0, bullets, num_bullets);
              }
              break; 
          }
          
          
        }
    }
    
    // colision bullet
    for(int i = 0; i < num_bullets; i++)
    {
        if(!bullets[i].flag || bullets[i].player_num == player_number)continue;
        if(isHit(bullets[i].x, bullets[i].y, bullets[i].r))
        {
          bullets[i].flag = false;
          flag = false;
        }
    }
    
    
    
    

    x += vx;
    y += vy;

    return true; 
  }
  
  void draw()
  {
    pushMatrix();
    
    translate(x, y);
    rotate(rad);
    switch(player_number)
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
    
    rect(-w/2, -h/2, w, h);
    
    popMatrix();
  }
  
  void appendBullet(float _rad, float _spd, Bullet[] bullets, int num_bullets)
  {
    for(int i = 0; i < num_bullets; i++)
    {
      if(bullets[i].flag)continue;
      bullets[i].flag = true;
      bullets[i].init(x, y, _rad, _spd, player_number);
      break;
    }
  }
  
  boolean isHit(float ix, float iy, float ir)
  {
    if((ix - x) * (ix - x) + (iy - y) * (iy - y) < (ir + h/2) * (ir + h/2))return true;
    else return false;
  }

}

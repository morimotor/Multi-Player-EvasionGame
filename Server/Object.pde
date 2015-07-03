class Object
{
  float x, y, vx, vy;
  float w, h;
  float rad;
  float spd;
  boolean flag;
  
  boolean move()
  {
    x += vx;
    y += vy;
    
   
    return !isOut(20);
  }
  
  boolean isOut(float size) 
  {
    return 
      x < - size || width + size < x || 
      y < - size || height + size < y;
  }
}

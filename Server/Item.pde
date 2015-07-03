class Item extends Object
{
 int kind;
 int r = 8;
 void init(float _x, float _y, float _vx, float _vy, int _kind)
 {
   x = _x;
   y = _y;
   vx = _vx;
   vy = _vy;
   kind = _kind;
 }
 
 boolean move()
 {
   
   return super.move();
 }
 
 void draw()
 {
     if(kind == 0)
     {
        stroke(255, 0, 0);
        noFill();
        ellipse(x, y, r, r);
        noStroke();
     }
     else if (kind == 1)
     {
        stroke(0, 255, 0);
        noFill();
        ellipse(x, y, r, r);
        noStroke();
     }
 }
  
}

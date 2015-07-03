import hypermedia.net.*;

ObjectManager om;
int isGameEnd = 0;

UDP[] udp = new UDP[10];
int portNo = 12340;

class KeyStruct
{
  boolean up, down, left, right, space, num;
}
KeyStruct[] keys = new KeyStruct[10];


void setup()
{
  size(800, 600);
  frameRate(60);
  for(int i = 0; i < 10; i++)
  {
    keys[i] = new KeyStruct();
    udp[i] = new UDP(this, portNo + i);
    udp[i].setBuffer(6);
    udp[i].setReceiveHandler("received");
    udp[i].listen(true);
    
  }
  
  om = new ObjectManager();
}



void draw()
{
  background(0, 0, 0);  
  
  isGameEnd = om.move(keys);    
  om.draw();
  
  if(isGameEnd > 0)
  {
    textSize(35);
    int p = isGameEnd - 1;
    fill(255, 255, 255);
    text("PLAYER" + p + " WIN", 240, 300);  
  }
  
}

void received(byte[] data, String hostIP, int _portNo)
{
  int num = data[5];
  
  keys[num].up = keys[num].down = keys[num].left = keys[num].right = keys[num].space = false;
  if(data[0] != 0)keys[num].up = true;
  if(data[1] != 0)keys[num].down = true;
  if(data[2] != 0)keys[num].left = true;
  if(data[3] != 0)keys[num].right = true;
  if(data[4] != 0)keys[num].space = true;
}

/*
void keyPressed() 
{
  switch(keyCode) 
  {
    case LEFT:
      keys.left = true;
      break;
    case RIGHT:
      keys.right = true;
      break;
    case UP:
      keys.up = true;
      break;
    case DOWN:
      keys.down = true;
      break;
  }
  if (key == ' ')keys.space = true;
}

void keyReleased() 
{
  switch(keyCode) 
  {
    case LEFT:
      keys.left = false;
      break;
    case RIGHT:
      keys.right = false;
      break;
    case UP:
      keys.up = false;
      break;
    case DOWN:
      keys.down = false;
      break;
  }
  if (key == ' ')keys.space = false;

}*/

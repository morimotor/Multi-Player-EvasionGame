import hypermedia.net.*;

class KeyStruct
{
  boolean up, down, left, right, space, num;
}
KeyStruct keys;

UDP udp;
int portNo = 12343;//12340-12349
String ipAddress = "localhost";
//String ipAddress = "192.168.1.2";

int SEND_BUFFER_SIZE = 6;
byte[] sendBuffer = new byte[SEND_BUFFER_SIZE];
    
void setup()
{
  size(200, 200);
  
  udp = new UDP(this);
  udp.setBuffer(SEND_BUFFER_SIZE);
  background(255);
  
  keys = new KeyStruct();
}

void draw()
{
  background(0);

  textSize(20);
  fill(255, 255, 255);
  text("left right\nup down\nspace", 10, 20);
  text("port:" + portNo, 10, 120);
  text("player:" + (portNo - 12340), 10, 140);
  send();
  
}

/* Send */
void send()
{
  for(int i = 0; i < 5; i++)sendBuffer[i] = 0;
  if(keys.up)sendBuffer[0] = 1;
  if(keys.down)sendBuffer[1] = 1;
  if(keys.left)sendBuffer[2] = 1;
  if(keys.right)sendBuffer[3] = 1;
  if(keys.space)sendBuffer[4] = 1;
  sendBuffer[5] = (byte)(portNo - 12340);
  udp.send(sendBuffer, ipAddress, portNo);
}

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

}


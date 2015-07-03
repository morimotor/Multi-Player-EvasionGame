class ObjectManager
{
  static final int BULLET_NUM_MAX = 500;
  static final int ITEM_NUM_MAX = 100;
  static final int PLAYER_NUM_MAX = 10;


  Player[] players = new Player[PLAYER_NUM_MAX];
  Bullet[] bullets = new Bullet[BULLET_NUM_MAX];
  Item[] items = new Item[ITEM_NUM_MAX];

  int count_bullets = 0;
  int count_items = 0;
  int count_players = 0;


  ObjectManager()
  {
    // init players
    for (int i = 0; i < PLAYER_NUM_MAX; i++)
    {
      players[i] = new Player();
      players[i].flag = true;
      players[i].init(width/2 + 300 * cos(i * 2 * PI / 10), height/2 + 250 * sin(i * 2 * PI / 10), PI/2 + atan2(5 * sin(i * 2 * PI / 10), 6 * cos(i * 2 * PI / 10)), 2, i);
    }


    // init bullets
    for (int i = 0; i < BULLET_NUM_MAX; i++)
    {
      bullets[i] = new Bullet();
      bullets[i].flag = false;
    }

    // init items
    for (int i = 0; i < ITEM_NUM_MAX; i++)
    {
      items[i] = new Item();
      items[i].flag = false;
    }
  }


  int move(KeyStruct[] keys)
  {
    count_bullets = 0;
    count_items = 0;
    count_players= 0;

    for (int i = 0; i < PLAYER_NUM_MAX; i++)
    {
      if (players[i].flag)players[i].move(keys[i], bullets, BULLET_NUM_MAX, items, ITEM_NUM_MAX);
      if (players[i].flag)count_players++;
    }   
  
  
    // make item
    if(random(40) < 3)
      for(int i = 0; i < ITEM_NUM_MAX; i++)
      {
        if(items[i].flag)continue;
        items[i].flag = true;
        int ran = (int)random(40);
        if(ran > 1)ran = 1;
        else ran = 0;
        items[i].init(random(width), random(height), random(2)-1, random(2)-1, ran);
        break;  
      }
      
    for (int i = 0; i < BULLET_NUM_MAX; i++)
    {
      if (bullets[i].flag)
        if (!bullets[i].move())
          bullets[i].flag = false;
      if (bullets[i].flag)count_bullets++;
    }     

    for (int i = 0; i < ITEM_NUM_MAX; i++)
    {
      if (items[i].flag)
        if (!items[i].move())
          items[i].flag = false;
      if (items[i].flag)count_items++;
    }     

    if (count_players == 1)
      for (int i = 0; i < PLAYER_NUM_MAX; i++)
        if (players[i].flag)
          return i + 1;

    return 0;
  }

  void draw()
  {
    textSize(random(20, 20));
    fill(255, 255, 255);
    text("bullet:" + count_bullets, 10, 480);
    text("item:" + count_items, 10, 500);
    text("player:" + count_players, 10, 520);


    for (int i = 0; i < PLAYER_NUM_MAX; i++)
    {
      if (players[i].flag) players[i].draw();
    }
    

    for (int i = 0; i < BULLET_NUM_MAX; i++)
    {
      if (bullets[i].flag) bullets[i].draw();
    }
    
    for (int i = 0; i < ITEM_NUM_MAX; i++)
    {
      if (items[i].flag) items[i].draw();
    }
    
  }
}


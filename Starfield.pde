Particles[] John = new Particles[1200];
boolean rightMouse = false;

void setup()
{
  size(500,500);
  frameRate(60);
  for(int i = 0; i < John.length; i++)
  {
    John[i] = new Particles();
  }
  for(int i = 0; i < John.length-700; i++)
  {
    John[i] = new Oddballs();
  }
}

void draw()
{
  if(rightMouse == false)
  {
    background(0);
  }
  for(int i = 0; i < John.length; i++)
  {
    John[i].show();
    John[i].move();
  }
  for(int i = 0; i < John.length-700; i++)
  {
    John[i].show();
    John[i].move();
  } 
}

void mousePressed()
{

  if(mouseButton == LEFT)
  {
    for(int i = 0; i < John.length; i++)
    {
      John[i].speed*=-1;
    }
  }
  
  if(mouseButton == RIGHT && rightMouse == false)
  {
    rightMouse = true;
  }
  else if(mouseButton == RIGHT && rightMouse == true)
  {
    rightMouse = false;
  }
}

class Particles
{
  double x;
  double y;
  double speed;
  double angle;
  color particleColor;
  
  Particles()
  {
    x = 250;
    y = 250;
    angle = Math.random()*360;
    speed = Math.random()*10;
    particleColor = color(255,255,255);
  }
  
  void move()
  {
    double xSpeed = Math.cos(angle)*speed;
    double ySpeed = Math.sin(angle)*speed;
    
    x+=xSpeed;
    y+=ySpeed;
    
    if(x > 600 || x < -100 || y > 600 || y < -100  )
    {
      x = 250;
      y = 250;
    }

  }
  
  void show()
  {
    noStroke();
    fill(particleColor);
    if(speed > 5 || (speed > -5 && speed < 0))
    {
      fill(10,10,255);
    }
    ellipse((float)x,(float)y,5,5); 
  }
}

class Oddballs extends Particles
{
  Oddballs()
  {
    x = 250;
    y = 250;
    speed = 9;
    angle = Math.random()*360;
    particleColor = color(150,0,255);
  }
  
  void move()
  {
    double xSpeed = Math.cos(angle)*speed;
    double ySpeed = Math.sin(angle)*speed;
    x+=xSpeed;
    y+=ySpeed;
  }
  
  void show()
  {
    noStroke();
    fill(particleColor);
    ellipse((float)x,(float)y,20,20); 
  }
}


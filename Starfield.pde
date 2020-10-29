Particles[] John = new Particles[700];
Oddballs[] Brian = new Oddballs[500];

void setup()
{
  size(500,500);
  frameRate(60);
  for(int i = 0; i < John.length; i++)
  {
    John[i] = new Particles();
  }
  for(int i = 0; i < Brian.length; i++)
  {
    Brian[i] = new Oddballs();
  }
}

void draw()
{
  background(0);
  for(int i = 0; i < John.length; i++)
  {
    John[i].show();
    John[i].move();
  }
  for(int i = 0; i < Brian.length; i++)
  {
    Brian[i].show();
    Brian[i].move();
  } 
}

void mousePressed()
{
  
  for(int i = 0; i < John.length; i++)
  {
    John[i].speed*=-1;
  }
  
  for(int i = 0; i < Brian.length; i++)
  {
    Brian[i].speed*=-1;
  }   
  
}

class Particles
{
  double x;
  double y;
  double speed = Math.random()*10;
  double angle;
  color particleColor = color(255,255,255);
  
  Particles()
  {
    x = 250;
    y = 250;
    angle = Math.random()*360;
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
    if(speed > 5)
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
    speed = 10;
    angle = Math.random()*360;
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
    fill(150,0,255);
    ellipse((float)x,(float)y,20,20); 
  }
}



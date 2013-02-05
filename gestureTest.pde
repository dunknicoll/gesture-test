import processing.opengl.*;

SampleListener listener;
Controller controller;

void setup()
{
  background(0);
  size(800, 600, OPENGL);

  listener = new SampleListener();
  controller = new Controller(listener);
}

void draw()
{
  background(0);
  stroke(255);
  fill(255);

  if ((listener.lastPos != null && listener.connected) || !listener.connected)
  {
    Vector lastPos;
    if (listener.connected)
    {
      // add the new position at index 0
      lastPos = listener.lastPos;

      float lx = (float)(lastPos.getX() + 200) / 400 * width;
      float ly = height - (float)(lastPos.getY()) / 600 * height;

      rect(lx, ly, 20, 20);

      if( listener.lastVel != null)
      {
        if( listener.lastVel.getX()>400 )
        {
          println("Swipe Right");
        }
        else if( listener.lastVel.getX()<-400 )
        {
          println("Swipe Left");
        }
      }

    }
  }
}
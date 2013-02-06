import processing.opengl.*;

SampleListener listener;
Controller controller;
boolean swiping;

void setup()
{
  background(0);
  size(800, 600, OPENGL);

  listener = new SampleListener();
  controller = new Controller(listener);
  swiping = false;
}

void draw()
{
  background(0);
  stroke(255);
  fill(255);

  if ((listener.palm1Pos != null && listener.connected) || !listener.connected)
  {
    Vector palm1Pos, finger1Pos, palm2Pos, finger2Pos;
    if (listener.connected)
    {
      // add the new position at index 0
      palm1Pos = listener.palm1Pos;
      finger1Pos = listener.finger1Pos;

      palm2Pos = listener.palm2Pos;
      finger2Pos = listener.finger2Pos;

      if( listener.palm1Pos != null )
      {

        float lx = (float)(palm1Pos.getX() + 200) / 400 * width;
        float ly = height - (float)(palm1Pos.getY()) / 600 * height;

        fill(255,0,0);
        rect(lx, ly, 20, 20);

      }

      if( listener.palm2Pos != null )
      {

        float l2x = (float)(palm2Pos.getX() + 200) / 400 * width;
        float l2y = height - (float)(palm2Pos.getY()) / 600 * height;

        fill(0,0,255);
        rect(l2x, l2y, 20, 20);

      }

      if( finger1Pos != null )
      {
        float fx = (float)(finger1Pos.getX() + 200) / 400 * width;
        float fy = height - (float)(finger1Pos.getY()) / 600 * height;
        fill(0,255,0);
        rect(fx, fy, 20, 20);
      }

      if( finger2Pos != null )
      {
        float f2x = (float)(finger2Pos.getX() + 200) / 400 * width;
        float f2y = height - (float)(finger2Pos.getY()) / 600 * height;
        fill(255,0,255);
        rect(f2x, f2y, 20, 20);
      }





      /*if( listener.palmVel != null)
      {
        if( listener.palmVel.getX()>400 && !swiping )
        {
          println("Swipe Right");
          swiping = true;
        }
        else if( listener.palmVel.getX()<-400 && !swiping )
        {
          println("Swipe Left");
          swiping = true;
        }
        if( listener.palmVel.getX() < 200 && listener.palmVel.getX() > -200 )
        {
          swiping = false;
        }
      }*/

    }
  }
}
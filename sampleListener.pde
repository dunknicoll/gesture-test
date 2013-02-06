class SampleListener extends Listener {

  Vector palm1Pos;
  Vector palm1Vel;
  Vector finger1Pos;
  Vector finger1Vel;

  Vector palm2Pos;
  Vector palm2Vel;
  Vector finger2Pos;
  Vector finger2Vel;
  boolean connected = false;


  public void onInit(Controller controller) {
    println("Initialized");
  }

  public void onConnect(Controller controller) {
    println("Connected");
    connected = true;
  }

  public void onDisconnect(Controller controller) {
    println("Disconnected");
    connected = false;
  }

  public void onFrame(Controller controller) {
    // Get the most recent frame and report some basic information

    Frame frame = controller.frame();

    if (!frame.hands().empty()) {
      // Get the first hand
      Hand hand1 = frame.hands().get(0);
      Hand hand2 = frame.hands().get(1);

      Vector pvel1 = Vector.zero();
      Vector ppos1 = Vector.zero();
      pvel1 = hand1.palmVelocity();
      ppos1 = hand1.palmPosition();

      palm1Pos = ppos1;
      palm1Vel = pvel1;

      Vector pvel2 = Vector.zero();
      Vector ppos2 = Vector.zero();
      pvel2 = hand2.palmVelocity();
      ppos2 = hand2.palmPosition();

      palm2Pos = ppos2;
      palm2Vel = pvel2;

      FingerList fingers1 = hand1.fingers();
      if (!fingers1.empty())
      {
        Finger fi1 = fingers1.get(0);
        finger1Pos = fi1.tipPosition();
      }

      FingerList fingers2 = hand2.fingers();
      if (!fingers2.empty())
      {
        Finger fi2 = fingers2.get(0);
        finger2Pos = fi2.tipPosition();
      }
    }
  }
}
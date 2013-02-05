class SampleListener extends Listener {

  Vector lastPos;
  Vector lastVel;
  boolean hasHands;
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
      Hand hand = frame.hands().get(0);
      hasHands = true;

      // Check if the hand has any fingers
      FingerList fingers = hand.fingers();
      if (!fingers.empty()) {
        // Calculate the hand's average finger tip position
        Vector pos = Vector.zero();
        Vector vel = Vector.zero();
        for (Finger finger : fingers) {
          pos = pos.plus(finger.tipPosition());
          vel = vel.plus(finger.tipVelocity());
        }
        pos = pos.divide(fingers.count());
        vel = vel.divide(fingers.count());
        
        lastPos = pos;
        lastVel = vel;
      }
    }
  }
}
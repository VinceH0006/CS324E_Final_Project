import ddf.minim.*;

AudioPlayer jump, traffic;
Minim minim;
Player p;
Boolean mute = false;

void setup(){
  size(500, 500);
  p = new Player();
  minim = new Minim(this);
  jump = minim.loadFile("jump.wav");
  traffic = minim.loadFile("traffic.wav");
  traffic.loop();
  
}

void draw(){
}

void keyPressed(){
  if (key == 'm'){
    mute = !mute;
    if (mute){
      traffic.pause();
    }
    else{
      traffic.rewind();
      traffic.loop();
    }
  }
  if (keyCode == UP){
    p.move(true, false, false);
    p.display();
    if (!mute){
      jump.rewind();
      jump.play();
    }
  }
  
  else if (keyCode == LEFT){
    p.move(false, true, false);
    p.display();
  }
  
  else if (keyCode == RIGHT){
    p.move(false, false, true);
    p.display();
  }
}
    

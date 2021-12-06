
PFont font; 
PFont font1;
PImage image;
PImage image2;
Screens start; 
Screens howTo; 
Screens exit; 
Screens mainMenu;
Screens pause; 
Screens resume;
boolean startPressed = false;
boolean howToPressed = false;
boolean exitPressed = false; 
boolean mainMenuPressed = false;
boolean pausePressed = false;
boolean resumePressed = false;
boolean gameOver = false;
int score;
int lives;

void setup(){
  size(700,600);
  font = createFont("MuktaMahee-Bold", 23);
  font1 = createFont("MuktaMahee-Bold", 80);
  image = loadImage("start.jpg");
  image2 = loadImage("how.jpg");
  start = new Screens(width/2, 175, 200, 100, color(#219347), color(#28B458), "START");
  howTo = new Screens(width/2, 350, 200, 100, color(#B4B028), color(#D6D130), "How To Play?");
  exit = new Screens(width/2, 425, 200, 100, color(#B43628), color(#F0412E), "EXIT");
  mainMenu = new Screens(400, 400, 200, 100, color(#7123B7), color(#8E2EE3), "Main Menu");
  pause = new Screens(50, 50, 175, 75, color(#B43628), color(#F0412E), "Pause");
  resume = new Screens(width/2, 125, 200, 100, color(#B43628), color(#F0412E), "Resume");

}
void draw(){
  background(255);
  if(howToPressed == false && startPressed == false && exitPressed == false && gameOver == false){ 
    //Title screen
    image(image, 0, 0, 700, 600);
    textFont(font1); 
    textAlign(CENTER);
    fill(0);
    text("Crossing", width/2, 100);
    start = new Screens(width/2, 175, 200, 100, color(#219347), color(#28B458), "START");
    start.update(mouseX, mouseY);
    start.display();
    howTo = new Screens(width/2, 335, 200, 100, color(#B4B028), color(#D6D130), "How To Play?");
    howTo.update(mouseX, mouseY);
    howTo.display();
    exit = new Screens(width/2, 500, 200, 100, color(#B43628), color(#F0412E), "EXIT");
    exit.update(mouseX, mouseY);
    exit.display();
  }else if(howToPressed){
    //how to play screen
    image(image2, 0, 0, 700, 600);
    textFont(font1);
    textAlign(CENTER);
    text("How To Play?", width/2, 75);
    textAlign(LEFT);
    textFont(font);
    text("Purpose: Get your player to the other side by crossing through", 20, 125);
    text("traffic without getting hit by cars!", 117, 150);
    text("Keys: Use the UP, LEFT, and RIGHT arrow keys to move your player", 20, 200);
    text("across the road. (If you get hit by a car you lose a life!)", 80, 225);
    text("How to win?: Try to get the highscore! You will recieve 20", 20, 275);
    text("points everytime you reach the other side. You have", 153, 300);
    text("three lives to play with.", 153, 325);
    mainMenu = new Screens(600, 400, 150, 75, color(#7123B7), color(#8E2EE3), "Main Menu");
    mainMenu.update(mouseX, mouseY);
    mainMenu.display();
  }else if(pausePressed){
    textFont(font1);
    textAlign(CENTER);
    text("Game Paused", width/2, 75);
    resume = new Screens(width/2, 175, 200, 100, color(#219347), color(#28B458), "Resume");
    resume.update(mouseX, mouseY);
    resume.display();
    exit = new Screens(width/2, 350, 200, 100, color(#B43628), color(#F0412E), "EXIT");
    exit.update(mouseX, mouseY);
    exit.display();
  } else if(gameOver){
    //once player reaches 0 lives 
    background(0);
    fill(255);
    textAlign(CENTER);
    textFont(font1);
    text("GAME OVER :'(", width/2, 75);
    text("Highscores:", width/ 2, 170);
    mainMenu = new Screens(width/ 4, 500, 145, 75, color(#7123B7), color(#8E2EE3), "Main Menu");
    mainMenu.update(mouseX, mouseY);
    mainMenu.display();
    start = new Screens(width/2, 500, 145, 75, color(#219347), color(#28B458), "Play Again");
    start.update(mouseX, mouseY);
    start.display();
    exit = new Screens(3*width/4, 500, 145, 75, color(#B43628), color(#F0412E), "EXIT");
    exit.update(mouseX, mouseY);
    exit.display();
  }else{
    //Play game
    noFill();
    rect(600, 50, 175, 75);
    textAlign(LEFT);
    fill(0);
    pause = new Screens(60, 40 , 100, 50, color(#B43628), color(#F0412E), "Pause");
    pause.update(mouseX, mouseY);
    pause.display();
    //p.display();
    // increase score if player makes it to other side
    /*
    if(p.y < 20){
      score += 20;
      p.y = 600;
    }*/
    
    // **** write code for interaction b/w cars and player here for minus lives) 
    textAlign(LEFT);
    text("Score: " + score, 520, 40);
    text("Lives: " + lives, 520, 80);
  }
  //once out of lives --> game over
  /*
  if(lives == 0){
    gameOver = true;
    //reset lives to 3 so main menu button can work
    lives = 3;
  }*/
}

void mousePressed(){
  if(howTo.isPressed()){
    howToPressed = true;
    howTo.isMouseOver = false;
    howTo.isMousePressed = false;
  }
  if(mainMenu.isPressed()){
    startPressed = false;
    gameOver = false;
    howToPressed = false;
    mainMenu.isMouseOver = false;
    mainMenu.isMousePressed = false;
    mainMenuPressed = false;
  }
  if(exit.isPressed()){
    exit.isMouseOver = false;
    exit.isMousePressed = false;
    exit();
  }
  if(start.isPressed()){
    startPressed = true; 
    gameOver = false;
    howToPressed = false;
    start.isMouseOver = false;
    start.isMousePressed = false;
    score = 0; 
    lives = 3;
  }
  if(resume.isPressed()){
    pausePressed = false;
    resume.isMouseOver = false;
    resume.isMousePressed = false;
    loop();
  }
  if(pause.isPressed()){
    pausePressed = true;
    pause.isMouseOver = false;
    pause.isMousePressed = false;
  }
}

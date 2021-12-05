class Player{
  float x = width / 2;
  float y = 700;
  float playerSpeed = 75;
  float size = 10;
  
  Player(){
  }
  
  void display() {
    
    
    line(x - size, y, x + size, y); // center line
    line(x, y - size, x, y + size); // vert center line
    fill(255, 255, 255);
    ellipse(x, y - size * 2, size * 2, size * 2); // head
    line(x + size, y, x + size, y + size); // right arm
    line(x - size / 2, y + size, x + size / 2, y + size); // hort leg line
    line(x - size / 2, y + size, x - size / 2, y + size * 1.5); // vert leg line
    line(x + size / 2, y + size, x + size / 2, y + size * 1.5); // vert leg line 2
    strokeWeight(1.5);
    rectMode(CENTER);
    
    // dog
    fill(255, 255, 255);
    rect(x - size - (size * 2.5 / 4), y + size, size, 1.25 * size); // body
    ellipse(x - size - (size * 2.5 / 4), y, size, size); // head
    line(x - size * 3, y - size / 2, x - size - (size * 5 / 4), y + size / 2); // left front leg
    line(x - size * 3, y - size / 2 + 3 * size, x - size - (size * 5 / 4), y + size / 2 + 1.25 * size);  // left back leg
    line(x - size * 3 + size * 2, y + size / 2 + 1.25 * size, x - size / 3, y - size / 2 + 3 * size); // right back
    fill(0, 0, 0);
    line(x - size, y, x - size - (size * 2.5 / 4), (y + size)); // leash
  }
  
  void move(boolean up, boolean left, boolean right){
    if (up){
      y -= playerSpeed;
    }
    else if (left){
      x -= playerSpeed;
    }
    
    else if (right){
      x += playerSpeed;
    }
  }
}
    

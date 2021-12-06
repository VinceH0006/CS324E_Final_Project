class Screens extends Options {
  int x; 
  int y;
  int w;
  int h;
  String s;

  
  Screens(int x, int y, int w, int h, color selected, color unselected, String s) {
    super(selected, unselected);
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.s = s;
  }
  
  void update(int mx, int my) {
    if (mx > x - w/2 && mx < x + w/2 && my > y - h/2 && my < y + h/2) {
      isMouseOver = true; 
    } else {
      isMouseOver = false; 
    }
  }
  
  void drawButton() {
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(30);
    rect(x, y, w, h); 
    fill(0);
    text(s, x, y + 10);
  }
}

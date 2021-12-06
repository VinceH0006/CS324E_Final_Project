class Options {
  boolean isMouseOver;
  boolean isMousePressed;
  color selected;
  color unselected;
  
  Options(color selected, color unselected) {
    this.selected = selected;
    this.unselected = unselected;
    isMouseOver = false;
    isMousePressed = false;
  }
  
  void display() {
    if (isMouseOver) {
      fill(selected);
    } else {
      fill(unselected); 
    }
    drawButton();
  }
  
  void drawButton() {}
  
  boolean isPressed() {
    if (isMouseOver) {
      isMousePressed = true;
      return true;
    }
    return false;
  }
  
  boolean isReleased() {
    isMousePressed = false;
    return false;
  }
}

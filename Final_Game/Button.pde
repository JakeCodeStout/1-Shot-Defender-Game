//Class for buttons
class Button{
  
//Button Variables
int buttonX;
int buttonY;
int buttonW;
int buttonH;
color buttonC;

//Button Hitbox
int buttonTop;
int buttonBottom;
int buttonRight;
int buttonLeft;

//Button Speed
int speedX;
int speedY;

//Initializing Variables
Button (int x, int y, int w, int h, int c, int sX, int sY){
  
//Button
buttonX = x;
buttonY = y;
buttonW = w;
buttonH = h;
buttonC = c;

//Button Speed
speedX = sX;
speedY = sY;
  
}
  
//Function to render box
void render(){
    
fill(buttonC);

//Button Hitbox
buttonTop = buttonY + buttonH/2;
buttonBottom = buttonY - buttonH/2;
buttonRight = buttonX + buttonW/2;
buttonLeft = buttonX - buttonW/2;

if (buttonC == color(255,0,0)){
redAnimation.display(buttonX, buttonY);
}
if (buttonC == color(0,255,0)){
greenAnimation.display(buttonX, buttonY);
}
if (buttonC == color(0,0,255)){
blueAnimation.display(buttonX, buttonY);
}
  
}

//FUnction to tell when the mouse is in the button
boolean inButton(){
  
if (mouseX < buttonRight && mouseX > buttonLeft && mouseY < buttonTop && mouseY > buttonBottom){
 return true;
}
else{
return false;
}

}
  
//Function to tell what to do when the 1st (start) button is pressed
void button1Pressed(){

if (inButton() == true && mousePressed == true){
  
gameState += 2;
player1.score = 0;
removeEnemies = false;
e1.interval = 600;

}

}

//Function to tell what to do when the 2nd (controls) button is pressed
void button2Pressed(){
  
if (inButton() == true && mousePressed == true){
  
gameState += 1;
  
}  

}

//Function to tell what to do when the 9th (return) button is pressed
  void button9Pressed(){
  
if (inButton() == true && mousePressed == true){
  
gameState -= 1;
  
}  

}

//Function to display controls
void howToPlay(){
  
fill(0);
textSize(50);
text("Press 'w' to move up", 25, 100);
text("Press 's' to move down", 25, 250);
text("Press 'SPACE BAR' to shoot", 25, 400);

//Text to tell how to use abilities
//Use Wall
text("Click to  fire a wall", 150, 550);
text("Costs 2000 points", 150, 600);

//Increase ball speed
text("Click and hold to increase ball speed ", 150, 700);
text("DRAINS POINTS!", 150, 750);

//Slow Down Enemies
text("Click and hold to slow enemies", 150, 850);
text("DRAINS POINTS!", 150, 900);

}

//Function to tell what to do when the 3rd button (remove all enemies) is pressed
  void button3Pressed(){
  
if (inButton() == true && mousePressed == true && player1.score >= 2000){
   
weapon1.needHelp = true;
player1.score -= 2000;
  
}  

  }
  
//Function to move buttons
void buttonMove(){
  
buttonX += speedX;
buttonY += speedY;
  
}

//Function to bounce the buttons
void bounceButton(){
  
if (buttonTop <= 0){
speedY = abs(speedY);  
}  
if (buttonBottom >= height){
speedY = -abs(speedY);  
}  
if (buttonLeft <= 0){
speedX = abs(speedX);  
}
if (buttonLeft >= width){
speedX = -abs(speedX);  
}
  
}

//Function to drain points when in button 5 (slows enemies)
void drainPointsSlow(){
  
if(inButton() == true && player1.score >= 1 && mousePressed == true){
 
player1.score -= 5; 
  
}
  
}

//Function to drain points when in button 4 (increase ball speed)
void drainPointsFast(){
  
if(inButton() == true && player1.score >= 1 && mousePressed == true){
 
player1.score -= 1; 
  
}
  
}

}

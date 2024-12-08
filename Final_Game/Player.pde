//Class to put the player in
class Player{
  
//Player Variables
int playerX;
int playerY;
color playerC;
int playerS;

//Variables for player hitbox
int playerTop;
int playerBottom;
int playerRight;
int playerLeft;

//Variables to display player Hit Points
int displayX;
int displayY;
int displayS;
color displayC;

//Variables to display arrow feature
int arrowX1;
int arrowY1;
int arrowX2;
int arrowY2;
int arrowX3;
int arrowY3;
color arrowC;

//Variables to move the arrow
boolean moveArrowUp;
boolean moveArrowDown;

//Score Variables
int score;
int scoreMultiplier;

//Player Health 
int playerState;

//Time Survived
int timeAlive;

//Initializing Player Variables
Player(){
 
//Player Position
playerX = 100;
playerY = 500;
playerC = color(255);
playerS = 75;

//Player Hitbox
playerTop = playerY - playerS/2;
playerBottom = playerY + playerS/2;
playerRight = playerX + playerS/2;
playerLeft = playerX - playerS/2;

//Heath display location
displayX = 100;
displayY = 100;
displayS = 175;
displayC = color(0);

//Arrow
arrowX1 = playerRight + 30;
arrowY1 = playerTop + 15;
arrowX2 = arrowX1;
arrowY2 = playerBottom - 15;
arrowX3 = playerX + playerS + 45;
arrowY3 = playerY;
arrowC = color(255);

//Arrow Movement
moveArrowUp = false;
moveArrowDown = false;

//Initializing Score
score = 0;
scoreMultiplier = 1;

//Player Health
playerState = 0;

}

//Function to make player appear
void render(){

characterAnimation.display(playerX + 10, playerY - 45);
  
}

//Function to tell how many hits the player can take
void health(){

healthyAnimation.display(displayX + 25, displayY + 50);

if (playerState == 1){
 

unhealthyAnimation.display(displayX + 25, displayY + 50);  
  
}
  
}
//Function to show arrow for weapon direction
void arrow(){
  
fill(arrowC);
triangle(arrowX1, arrowY1, arrowX2, arrowY2, arrowX3, arrowY3);

}

//Function to move the arrow up and down
void moveArrow(){
  
if (moveArrowUp == true && arrowY3 > playerTop - 15 && arrowX2 <= arrowX2 + 10){
arrowX2 += 1;
arrowX1 -= 1;
arrowY3 -= 3;
}

if (moveArrowDown == true && arrowY3 < playerBottom + 15 && arrowX1 <= arrowX1 + 10){
arrowX1 += 1; 
arrowX2 -= 1;
arrowY3 += 3;
}  
  
}

//Function to tell when the player has been hit by weapon
boolean weaponHitPlayer(){
if (weapon1.weaponLeft < playerRight && weapon1.weaponRight > playerLeft && weapon1.weaponTop < playerBottom && weapon1.weaponBottom > playerTop){
return true;
}
else{
return false;
}
  
}

//Function to display score
void displayScore(){
  
fill(255);
textSize(100);
text(score, width/2 - 200, 100); 
  
}

//Function that kills player
void gameOver(){
  
fill(200);
textSize(125);
text("YOU WERE", 200, 200);
text("OVERTAKEN!", 150, 350);
textSize(75);
text("Press 'r' to return to main menu", 5, 450);

if (keyPressed == true && key == 'r' && gameState >= 3){
gameState = 0;
playerState = 0;
}

}

//Function that displays time
void showTime(){
  
//Time Alive
timeAlive = e1.currentTime/1000;  

fill(0);
textSize(100);
text(timeAlive, width/2 + 100, 100);
  
}

}

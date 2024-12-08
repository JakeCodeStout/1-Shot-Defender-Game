//Enemy class
class Enemy{
  
//Enemy Variables
int enemyX;
int enemyY;
int enemyS;
color enemyC;

//Enemy hitbox
int enemyTop;
int enemyBottom;
int enemyRight;
int enemyLeft;

//Enemy Speed
int speedX;
float speedY;

//Enemy Timers
int startTime;
int interval;
int currentTime;
int spawnAfter;

//Array of enemy positions
int [] enemyPositioning = {100, 200, 300, 425, 500, 600, 700, 800};

//Variable to tell enemy what position to go to
int enemyPlacement;

//Array of enemy sizes
int [] enemySize = {50, 100, 150, 200};

//Variable to tell what size the enemy is
int enemyState;
  
//Initializing variables
Enemy(){
  
//Initializing enemy placement
enemyPlacement = int(random(0,8)); 

//Initializing enemy size
enemyState = int(random(0,3));
  
//Enemy
enemyX = width + 200;
enemyY = enemyPositioning[enemyPlacement];
enemyS = enemySize[enemyState];  
enemyC = color(0, 255, 0);

//Speed
speedX = 0;
speedY = 0;

//Enemy Time
startTime = millis();
interval = 600;
spawnAfter = 600;
  
}

//Function to render enemy in game
void render(){

//Hitbox
enemyTop = enemyY - enemyS/2;
enemyBottom = enemyY + enemyS/2;
enemyRight = enemyX + enemyS/2;
enemyLeft = enemyX - enemyS/2;
  
}

//Function to move enemies
void enemyMove(){
  
enemyX += speedX;
enemyY += speedY;
  
}

void bounceEnemy(){

if (enemyTop <= 0){
speedY = abs(speedY);
  
}

if (enemyBottom >= height){
speedY = -abs(speedY);
  
}

if (enemyRight >= width){
speedX = -abs(speedX);
  
}

if (enemyLeft <= 0){
speedX = abs(speedX);
  
}
  
}

//Function to tell when weapon is in the enemy hitbox
boolean inEnemyHitbox(){

if (weapon1.weaponBottom > enemyTop && weapon1.weaponRight > enemyLeft && weapon1.weaponTop < enemyBottom && weapon1.weaponLeft < enemyRight){
return true;
}
else{
  return false;
}

}

//Function to add enemy
boolean addEnemy(){
  
currentTime = millis() - startScreenT;

if (currentTime - startTime > interval){
interval += spawnAfter;
return true;
}
else{
return false;
}
  
}

//Function to tell when the player has been hit by enemy
boolean enemyHitPlayer(){
if (enemyLeft < player1.playerRight && enemyRight > player1.playerLeft && enemyTop < player1.playerBottom && enemyBottom > player1.playerTop){
return true;
}
else{
return false;
}
  
}

//Function to tell the speed of enemies
void determineEnemySpeed(){
  
if (enemyState == 0){
zombieAnimation.isAnimating = true;
zombieAnimation.display(enemyX + 25, enemyY + 15);
speedX = -10;
speedY = player1.playerY/50 - enemyY/50;

}
if (enemyState == 1){
alienAnimation.isAnimating = true;
alienAnimation.display(enemyX, enemyY);
speedX = -7;
speedY = player1.playerY/80 - enemyY/80;
}

if (enemyState == 2){
dogAnimation.isAnimating = true;
dogAnimation.display(enemyX - 25, enemyY - 50);
speedX = -3;
speedY = player1.playerY/200 - enemyY/200;
}

if (enemyState == 3){
speedX = -1;
speedY = player1.playerY/500 - enemyY/500;
}
  
}

//Function to tell when wall is in the enemy hitbox
boolean wallHitEnemy(){

if (weapon1.wallX >= enemyX){
return true;
}
else{
  return false;
}

}

}

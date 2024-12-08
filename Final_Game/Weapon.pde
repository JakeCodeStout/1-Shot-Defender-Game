//Class to put in the weapon
class Weapon{
  
//Weapon Variables
int weaponX;
int weaponY;
int weaponS;
color weaponC;
  
//Weapon Hitbox Variables
int weaponTop;
int weaponBottom;
int weaponRight;
int weaponLeft;

//Weapon speed
int speedX;
int speedY;

//Variables to move weapon
boolean moveWeaponUp;
boolean moveWeaponDown;

//Variables to use weapon
boolean weaponThrown;
boolean onWall;

//Kill wall variables
int wallX;
int wallY;
int wallW;
int wallH; 
int wallC;
int wallSpeed;

//Wall Hitbox Variables
int wallTop;
int wallBottom;
int wallLeft;
int wallRight;

//Variable for deploying wall
boolean needHelp;
  
//Initializing weapon variables
Weapon (){
  
//Weapon placement
weaponX = player1.arrowX3 + 20;
weaponY = player1.arrowY3;
weaponS = 30;
weaponC = color(0);

//Speed
speedX = 0;
speedY = 0;

//Move weapon
moveWeaponUp = false;
moveWeaponDown = false;
weaponThrown = false;

onWall = false;

//Kill Wall
wallX = player1.playerX;
wallY = player1.playerY;
wallW = 50;
wallH = 500;
wallC = color(0);
wallSpeed = 0;
needHelp = false;

//Wall Hitbox
wallTop = wallY - wallH/2;
wallBottom = wallY + wallH/2;
wallRight = wallX + wallW/2;
wallLeft = wallX - wallW/2;

} 

//Function to render the weapon
void render(){
  
//Adding the weapon  
fill(weaponC);
circle(weaponX, weaponY, weaponS);

//Weapon hitbox
weaponTop = weaponY - weaponS/2;
weaponBottom = weaponY + weaponS/2;
weaponRight = weaponX + weaponS/2;
weaponLeft = weaponX - weaponS/2;
  
}

//Function to move the weapon along with the arrow
void moveWeapon(){
  
if (moveWeaponUp == true && weaponY > player1.playerTop - 15){
weaponY -= 3;
}

if (moveWeaponDown == true && weaponY < player1.playerBottom + 15){
weaponY += 3;
}  
  
}

//Function to use the weapon and have it return
void throwWeapon(){
  if (weaponRight >= width){
   onWall = true;
 }
 if (weaponRight < player1.arrowX3) {
   onWall = false;
   weaponThrown = false;
 }
if (onWall == true){
weaponLeft = 2000;
}
 
  if (weaponThrown == false && onWall == false){
weaponX = player1.arrowX3 + 20;
weaponY = player1.arrowY3;
 }
  
if (keyPressed == true && key == ' '){
weaponThrown = true;
}

if (weaponThrown == true){
 player1.moveArrowUp = false;
 player1.moveArrowDown = false;
 if (onWall == false){
speedX = 25;
speedY = player1.arrowY3/3 - player1.playerY/3;
weaponX += speedX;
weaponY += speedY;
   
 } else {
   
   weaponX -= speedX;
weaponY -= speedY;
 }
 
}

if (weaponThrown == false){
weaponLeft = 2000;
}

}

void returnWeaponFromEnemy(){
  
onWall = true;
  
}

//Function to deploy kill wall
void deployWall(){  
  
fill(wallC);
rect(wallX, wallY, wallW, wallH);
wallSpeed = 30;
wallX += wallSpeed;

if (wallX >= width){
  
wallSpeed = 0;
wallX = player1.playerX;
needHelp = false;
}

}

}

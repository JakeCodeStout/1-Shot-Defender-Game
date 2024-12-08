//Adding different enemy characters to the game
//Zombie crawler
Animation zombieAnimation;
PImage[] zombieImages = new PImage[2];

//Grey Alien
Animation alienAnimation;
PImage[] alienImages = new PImage[4];

//Dog
Animation dogAnimation;
PImage[] dogImages = new PImage [4];


//Buttons
Animation redAnimation;
Animation greenAnimation;
Animation blueAnimation;

PImage[] redImage = new PImage[1];
PImage[] greenImage = new PImage[1];
PImage[] blueImage = new PImage[1];

//Health
Animation healthyAnimation;
PImage[] healthy = new PImage[1];

Animation unhealthyAnimation;
PImage[] unhealthy = new PImage[1];

//Player
Animation characterAnimation;
PImage[] character = new PImage[1];

//Backgrounds
//Start Screen
PImage startScreen;
//Main Screen
PImage mainScreen;
//Game Over Screen
PImage endScreen;

import processing.sound.*;

//Background music
SoundFile background;

//Enemy Dying sound
SoundFile enemyDeath;

//Adding in the player
Player player1 = new Player();

//Adding in the weapon
Weapon weapon1 = new Weapon();

//Adding Enemies to the game
Enemy e1;
ArrayList<Enemy> enemyList;

//Variable to remove all enemies 
boolean removeEnemies;

int highscore;

//Adding boxes into game
//Boxes on the Starting screen
Button button1 = new Button(500, 450, 500, 250, color(255),0,0);
Button button2 = new Button(500, 750, 500, 250, color(255),0,0);
//Boxes in the game
Button button3 = new Button(325, 175, 65, 65, color (255,0,0),8,8);
Button button4 = new Button(425, 175, 65, 65, color(0,255,0),-1,1);
Button button5 = new Button(525, 175, 65, 65, color(0,0,255),4,-4);
//Boxes to show controls
Button button6 = new Button(100, 575, 0, 0, color (255,0,0),0,0);
Button button7 = new Button(100, 725, 0, 0, color(0,255,0),0,0);
Button button8 = new Button(100, 875, 0, 0, color(0,0,255),0,0);
//Box to retun to start screen from controls
Button button9 = new Button(800, 100, 250, 125, color(255),0,0);


//Game State Variable
int gameState;

//Time on "start" Screen
int startScreenT;

//Time on "controls" screen
int controlScreenT;

void setup(){
size(1000, 950);
rectMode(CENTER);

//Load all images for animation
//Zombie
for (int i = 0; i<zombieImages.length; i++){
  zombieImages[i] = loadImage("Zombie"+i+".png");
}
zombieAnimation = new Animation (zombieImages, .1, .25);

//Alien
for (int i = 0; i< alienImages.length; i++){
  alienImages[i] = loadImage("Alien"+i+".png");
}
alienAnimation = new Animation (alienImages, .075, .25);

//Dog
for (int i = 0; i< dogImages.length; i++){
  dogImages[i] = loadImage("Dog"+i+".png");
}
dogAnimation = new Animation (dogImages, .02, .3);

//Buttons
redImage[0] = loadImage("RedButton.png");
greenImage[0] = loadImage("GreenButton.png");
blueImage[0] = loadImage("BlueButton.png");

redAnimation = new Animation (redImage, .075, .25);
greenAnimation = new Animation (greenImage, .075, .25);
blueAnimation = new Animation (blueImage, .075, .25);

//Health
healthy[0] = loadImage("Health0.png");
unhealthy[0] = loadImage("Health1.png");

healthyAnimation = new Animation (healthy, 1 , 1);
unhealthyAnimation = new Animation (unhealthy, 1 , 1);

//Character
character[0] = loadImage("Character.png");

characterAnimation = new Animation (character, 1, .75);

//Backgrounds
//Start Screen
startScreen = loadImage("StartScreen.png");
startScreen.resize(1000,950);
//Main Game
mainScreen = loadImage("MainBackground.jpg");
mainScreen.resize(1000,950);
//End Screen
endScreen = loadImage("GameOverScreen.png");
endScreen.resize(1000,950);

//State of the game
gameState = 0;

//Highscore
highscore = 0;

//Initializing background music
background = new SoundFile (this, "BackgroundMusic.wav");
background.play();
background.rate(0.1);
background.amp(0.5);

//Initializing death sound
enemyDeath = new SoundFile (this, "Enemy Dying Sound.wav");
enemyDeath.rate(1.8);
  
//Initializing enemy array list
e1 = new Enemy();
enemyList = new ArrayList<Enemy>();
enemyList.add(e1);

//Remove enemies
removeEnemies = false;

}

void draw(){
switch(gameState){
  
case 0:
background(startScreen);

startScreenT = millis();
//Start Button
button1.render();
fill(255);
textSize(50);
text("CLICK HERE TO START", 275, 465);
button1.button1Pressed();

//High Score
fill(255);
textSize(50);
text("SCORE:", 400, 555);
if (player1.timeAlive >= highscore){
text(highscore, 560, 555);
}

//Controls Button
button2.render();
fill(255);
textSize(50);
text(" CLICK HERE FOR", 315, 765);
text("CONTROLS", 375, 815);
button2.button2Pressed();

//Title
fill(255);
textSize(125);
text("1-SHOT" ,300, 150);
text("DEFENDER" ,225, 275);

break;

case 1:
background(200);

button1.howToPlay();

button6.render();
button7.render();
button8.render();

button9.render();
fill(0);
textSize(50);
text("RETURN", 715, 115);
button9.button9Pressed();

break;

case 2:
background(mainScreen);

//Highscore
highscore = player1.timeAlive;

if (background.isPlaying() == false) {
background.play();
}
  
//Putting together the pieces to put character into game
player1.render();
player1.health();
player1.arrow();
player1.moveArrow();
player1.displayScore();
player1.showTime();

//Putting together the pieces to put in a functional weapon into game
weapon1.render();
weapon1.moveWeapon();
weapon1.throwWeapon();

//Putting in the kill wall
if (weapon1.needHelp == true){
weapon1.deployWall();
}

//Statement to add enemies into game
  if (e1.addEnemy() == true && removeEnemies == false){
enemyList.add (new Enemy());
}

//Function to put enemies into game
for(int numEnemy = 0; numEnemy < enemyList.size(); numEnemy++){

enemyList.get(numEnemy).render();
enemyList.get(numEnemy).enemyMove();
enemyList.get(numEnemy).determineEnemySpeed();
enemyList.get(numEnemy).bounceEnemy();

//Statements to remove enemies when the game is over
if (removeEnemies == true){
  
enemyList.remove(enemyList.get(numEnemy));

}

if (enemyList.size() <= 0 && player1.playerState == 1 && removeEnemies == true){
player1.playerState = 2;

}

if (player1.playerState == 2){
gameState = 3;

}

}

//Function to take enemies out of game
for (int i = enemyList.size()-1; i>=0; i=i-1){
  Enemy anEnemy = enemyList.get(i);
  
//Statements to tell what to do when the enemy is hit
  if (anEnemy.inEnemyHitbox() == true){
    weapon1.returnWeaponFromEnemy();
    enemyDeath.play();

    if (anEnemy.enemyState == 0){
    enemyList.remove(anEnemy);
    player1.score += 150;
  }
  if (anEnemy.enemyState == 1){
    enemyList.remove(anEnemy);
    player1.score += 100; 
  }
  if (anEnemy.enemyState == 2){
    enemyList.remove(anEnemy);
    player1.score += 250;
  }
  if (anEnemy.enemyState == 3){
    enemyList.remove(anEnemy);
    player1.score += 1000;
  }
 }
 //Statement to tell what to do when the player is hit
  if (anEnemy.enemyHitPlayer() == true && player1.playerState == 0){
    enemyList.remove(anEnemy);
    weapon1.needHelp = true;
    player1.score -= player1.score/2; 
    player1.playerState = 1;
    
  }
//Statement that tells kill wall what to do
  if (anEnemy.wallHitEnemy() == true){
  enemyList.remove(anEnemy);
 }
 //Statement to end the game
 if(anEnemy.enemyHitPlayer() == true && player1.playerState == 1 && weapon1.needHelp == false){
   
  enemyList.remove(anEnemy);
   removeEnemies = true;
   
 }
//Freeze Enemies
 if (button5.inButton() == true && player1.score >= 1 && mousePressed == true){
   anEnemy.speedX = -1;
   anEnemy.speedY = 0;
   
 }
 
//Increasing ball speed
 if (button4.inButton() == true && player1.score >= 1 && mousePressed == true){
   weapon1.speedX = 100;
   
 }
  
}

//Putting together the pieces to put boxes into game
//Remove Enemies Button
button3.render();
button3.button3Pressed();

//Increase ball speed
button4.render();
button4.drainPointsFast();

//Freezes enemies
button5.render();
button5.drainPointsSlow();

break;

//Death Screen
case 3:
background(endScreen);

player1.gameOver();

break;

}

}

//Function to make arrow stop moving when key is released
void keyReleased(){
  
if (key == 'w'){
player1.moveArrowUp = false;
weapon1.moveWeaponUp = false;
}

if(key == 's'){
player1.moveArrowDown = false;
weapon1.moveWeaponDown = false;
} 
  
}

//Function to make arrow move when the key is pressed
void keyPressed(){
  
if (key == 'w'){
player1.moveArrowUp = true;
weapon1.moveWeaponUp = true;
}

if(key == 's'){
player1.moveArrowDown = true;
weapon1.moveWeaponDown = true;
} 

}

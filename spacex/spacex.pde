/*
todo
 - justere kamera
 - laste bakgrunnsbilde
 - legge til bloom
 - bytte ut spheres med pngs
 - sørge for at stjernene fortsetter å komme (ring Array)
   https://processing.org/tutorials/arrays/
 - inspirasjon https://www.youtube.com/watch?v=FjfQNBYv2IY
 */

Debris debris;
float cx, cy;
Debris[] specks = new Debris[200];
PImage bg;

void setup() {
  fullScreen(P3D);
  //size(800, 600, P3D);
  frameRate(60);
  bg = loadImage("wil-stewart-23388-unsplash.jpg");
  camera(
    width/2.0, 
    height/2.0, 
    10000, 
    width/2.0, 
    height/2.0, 
    0, 0, 1, 0);

  float fov = PI/9.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
    perspective(
    fov, 
    float(width)/float(height),
    cameraZ/10.0,
    cameraZ*10.0);

  for (int i = 0; i < specks.length; i++) {
    specks[i] = new Debris();
  }
  cx = width/2;
  cy = height/2;
}

void draw() {
  bg.resize(width,height);
  background(bg);
  for (int i = 0; i < specks.length; i++) {
    specks[i].move();
    specks[i].display();
  }
}

class Debris {
  PVector pos;
  PVector vel;
  float rad;
  Debris() {
    sphereDetail(6);
    pos = new PVector(random(-6000,width+6000), random(-5000,height+5000), -20000);
    vel = new PVector(0, 0, random(40, 80));
    rad = random(24);
    noStroke();
  }

  void move() {
    pos = pos.add(vel);
  }
  void display() {
    pushMatrix();
      translate(pos.x, pos.y, pos.z);
      fill(255);
      sphere(rad); 
    popMatrix();
  }
}

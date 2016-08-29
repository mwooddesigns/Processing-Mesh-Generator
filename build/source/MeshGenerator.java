import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import nervoussystem.obj.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class MeshGenerator extends PApplet {



boolean record = false;

public void setup() {
  
  noStroke();
  colorMode(HSB, 100);
}

public void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2, random(30));
  if(record) {
    OBJExport obj = (OBJExport) createGraphics(10,10,"nervoussystem.obj.OBJExport","generated.obj");
    obj.setColor(true);
    obj.beginDraw();
    generateCylinder(1000, 0, 50);
    // generateTree(radians(20), 90, 30, 30);
    // generateSpiral(0, 300, 20);
    obj.endDraw();
    obj.dispose();
    record = false;
  }
  popMatrix();
}

public void keyPressed() {
  if(key == 's' || key == 'S') {
    record = true;
  }
}

public void generateCylinder(float mod, float deg, float noise) {
  if(mod == 1) {
    return;
  }
  fill(mod, 100, 100);
  pushMatrix();
  translate(sin(mod)*(width/2 - random(noise)), cos(mod)*(height/2 - random(noise)), mod);
  rotateY(radians(deg));
  rotateX(0.5f);
  noStroke();
  box(20);
  popMatrix();
  generateCylinder(mod - 1, deg + 1, noise);
}

public void generateTree(float theta, float size, float spacing, float variation) {
  size *= .65f;
  if(size > 2) {
    pushMatrix();
    rotateZ(theta);
    box(size);
    translate(0, spacing, random(variation));
    generateTree(theta, size, spacing, variation);
    rotateZ(-theta);
    box(size);
    translate(0, spacing, random(variation));
    generateTree(theta, size, spacing, variation);
    popMatrix();
  }
}

public void generateSpiral(float start, float end, float nodeSize) {
  start++;
  nodeSize *= 0.99f;
  if(start < end) {
    pushMatrix();
    translate(cos(start) * start, sin(start) * start);
    sphere(nodeSize);
    popMatrix();
    generateSpiral(start, end, nodeSize);
  }
}
  public void settings() {  size(600, 400, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "MeshGenerator" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

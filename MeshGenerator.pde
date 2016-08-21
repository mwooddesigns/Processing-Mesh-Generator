import nervoussystem.obj.*;

boolean record = false;

void setup() {
  size(600, 400, P3D);
  noStroke();
}

void draw() {
  if(record) {
    beginRecord("nervoussystem.obj.OBJExport", "test.obj");
  }
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  // generateCylinder(1000, 0, 50
  generateTree(radians(20), 90, 30);
  popMatrix();
  if(record) {
    endRecord();
    record = false;
  }
}

void keyPressed() {
  if(key == 's' || key == 'S') {
    record = true;
  }
}

void generateCylinder(float mod, float deg, float noise) {
  if(mod == 1) {
    return;
  }
  pushMatrix();
  translate(sin(mod)*(width/2 - random(noise)), cos(mod)*(height/2 - random(noise)), mod);
  rotateY(radians(deg));
  rotateX(0.5);
  noStroke();
  box(20);
  popMatrix();
  generateCylinder(mod - 1, deg + 1, noise);
}

void generateTree(float theta, float size, float spacing) {
  size *= .65;
  if(size > 2) {
    pushMatrix();
    rotateZ(theta);
    box(size);
    translate(0, spacing, random(30));
    generateTree(theta, size, spacing);
    rotateZ(-theta);
    box(size);
    translate(0, spacing, random(30));
    generateTree(theta, size, spacing);
    popMatrix();
  }
}

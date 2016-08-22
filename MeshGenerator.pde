import nervoussystem.obj.*;

boolean record = false;

void setup() {
  size(600, 400, P3D);
  noStroke();
}

void draw() {
  if(record) {
    beginRecord("nervoussystem.obj.OBJExport", "spiralTest.obj");
  }
  background(0);
  pushMatrix();
  translate(width/2, height/2, random(30));
  // generateCylinder(1000, 0, 50);
  // generateTree(radians(20), 90, 30, 30);
  generateSpiral(0, 300, 20);
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

void generateTree(float theta, float size, float spacing, float variation) {
  size *= .65;
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

void generateSpiral(float start, float end, float nodeSize) {
  start++;
  nodeSize *= 0.99;
  if(start < end) {
    pushMatrix();
    translate(cos(start) * start, sin(start) * start);
    sphere(nodeSize);
    popMatrix();
    generateSpiral(start, end, nodeSize);
  }
}

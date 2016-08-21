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
  generateMesh(1000, 0);
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

void generateMesh(int mod, int deg) {
  if(mod == 1) {
    return;
  }
  pushMatrix();
  translate(width/2, height/2);
  translate(sin(mod)*(width/2 - random(50)), cos(mod)*(height/2 - random(50)), mod);
  rotateY(deg);
  rotateX(0.5);
  noStroke();
  box(20);
  popMatrix();
  generateMesh(mod - 1, deg + 1);
}
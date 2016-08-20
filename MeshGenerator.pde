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
  generateMesh(100);
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

void generateMesh(int mod) {
  if(mod == 1) {
    return;
  }
  pushMatrix();
  translate(width/2, height/2);
  translate(sin(mod)*(width/2 - 50), cos(mod)*(height/2 - 50), mod);
  rotateY(1.2);
  rotateX(0.5);
  noStroke();
  box(20);
  popMatrix();
  generateMesh(mod - 1);
}
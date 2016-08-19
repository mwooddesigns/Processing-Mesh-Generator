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
  generateMesh();
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

void generateMesh() {
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(1.2);
  rotateX(0.5);
  noStroke();
  box(100);
  popMatrix();
}
void setup() {
  
  frameRate(meuframeRate);
  size(900,900);
  noStroke();
  //Canva (2,1)
  Canva(0,300,300, 107, 4, 37);
  //Canva (2,2)
  Canva(300,300,300, 4, 107, 104);

}

void draw() {
  
  //Desenha todos os backgrounds
  Canvas();
  //Desenha o Canva (1,1)
  Canva1();
  //Desenha o Canva (1,2)
  Canva2();
  //Desenha o Canva (1,3)
  Canva3();
  //Desenha o Canva (2,1)
  Canva4();
  //Desenha o Canva (2,2)
  Canva5();
  //Desenha o Canva (2,3)
  Canva6();
  //Desenha o Canva (3,1)
  Canva7();
  //Desenha o Canva (3,2)
  Canva8();
  //Desenha o Canva (3,3)
  Canva9();
  //Apaga o Canva 2,1 e 2,2 apos a lua atingir o ponto inicial.
  if ((frameCount/meuframeRate) == 20) {
    Canva(0,300,300, 107, 4, 37);
    Canva(300,300,300, 4, 107, 104); //Apague essa linha caso queira q o rastro no Canva 2,2 n se apague.
    frameCount = 0;
  }
}


int meuframeRate = 30;
int[] vertex_1_1 = {0,3,4,5,6,7,8,9,10,11,12};
int selectedVertex_1_1;
int[] vertex_1_2 = {0,1,2,3,4,5};
int selectedVertex_1_2;

void Koch(PVector a, PVector b, int Nivel) {
  float O = PI/3;
  PVector A = a;
  PVector B = b;
  if (Nivel == 0) {
    line(A.x,A.y,B.x,B.y);
    return;
  }
  PVector C = new PVector (0,0); 
  PVector D = new PVector (0,0);
  PVector E = new PVector (0,0);
  C.set((B.x-A.x)*1/3 + A.x, (B.y-A.y)*1/3 + A.y);
  D.set((B.x-A.x)*2/3 + A.x, (B.y-A.y)*2/3 + A.y);
  E.set(((D.x - C.x) * cos(O) + (D.y - C.y)*sin(O)) + C.x, ((D.y - C.y) * cos(O) - (D.x - C.x)*sin(O)) + C.y);
 
  Koch(A, C, Nivel-1);
  Koch(C, E, Nivel-1);
  Koch(E, D, Nivel-1);
  Koch(D, B, Nivel-1);
}

void Canva(int x, int y, int extent,int r, int g, int b) {
  fill(r,g,b);
  square(x,y,extent);
}

void Canvas() {
  //Canva (1,1)
  Canva(0,0,300, 245, 81, 79);
  //Canva (1,2)
  Canva(300,0,300, 22, 94, 124);
  //Canva (1,3)
  Canva(600,0,300, 155, 200, 209);
  //Canva (2,1)
  //Esta no setup
  //Canva (2,2)
  //Esta no setup
  //Canva (2,3)
  Canva(600,300,300, 185, 219, 18);
  //Canva (3,1)
  Canva(0,600,300, 173, 148, 234);
  //Canva (3,2)
  Canva(300,600,300, 143, 223, 91);
  //Canva (3,3)
  Canva(600,600,300, 49, 206, 174);
}

void Canva1() {
  pushMatrix();
  if (frameCount % (2*int(meuframeRate)) == 0) {
    selectedVertex_1_1++;
    if (selectedVertex_1_1 == vertex_1_1.length){
      selectedVertex_1_1 = 0;   
    }
  }
  
  int n = (vertex_1_1[selectedVertex_1_1 % vertex_1_1.length]);
  float a = -TWO_PI/n;
  int r = 4 * (width/3)/10;
  translate(width/6,height/6);
  noFill();
  stroke(0,0,0);
  beginShape();
  for(int i=0; i<n; i++) {
    float x = r*cos(i*a);
    float y = r*sin(i*a);
    vertex(x,y);
  }
  endShape(CLOSE);
  popMatrix();
}

void Canva2() {
  pushMatrix();
  if (frameCount % (2*int(meuframeRate)) == 0) {
    selectedVertex_1_2++;
    if (selectedVertex_1_2 == vertex_1_2.length){
      selectedVertex_1_2 = 0;   
    }
  }
  
  int n = (vertex_1_2[selectedVertex_1_2 % vertex_1_2.length]);
  float a = -TWO_PI/4;
  int r = 4 * (width/3)/10;
  translate(width * 3/6,height/6);
  noFill();
  stroke(0,0,0);
  beginShape();
    PVector A = new PVector (r*cos(0*a),r*sin(0*a));
    PVector B = new PVector (r*cos(1*a),r*sin(1*a));
    PVector C = new PVector (r*cos(2*a),r*sin(2*a));
    PVector D = new PVector (r*cos(3*a),r*sin(3*a));
    for(int i=0; i<n; i++) {
      Koch(A,B,n);
      Koch(B,C,n);
      Koch(C,D,n);
      Koch(D,A,n);
    }
  endShape(CLOSE);
  popMatrix();
}


void Canva3() {
  pushMatrix();
  //sol
  translate(width * 5/6,height/6);
  fill(255,255,0);
  noStroke();
  circle(0,0,50);
  //terra
  rotate(frameCount*(TWO_PI)/(meuframeRate*20));
  translate(90,0);
  fill(0,0,255);
  circle(0,0,25);
  //lua
  rotate(frameCount*(TWO_PI)/(meuframeRate*5));
  translate(25,0);
  fill(50);
  circle(0,0,10);
  popMatrix();
}

void Canva4() {
  pushMatrix();
  //sol
  translate(width * 1/6,height * 3/6);
  noFill();
  noStroke();
  circle(0,0,50);
  //terra
  rotate(frameCount*(TWO_PI)/(meuframeRate*20));
  translate(90,0);
  noFill();
  circle(0,0,25);
  //lua
  rotate(frameCount*(TWO_PI)/(meuframeRate*5));
  translate(25,0);
  fill(0);
  circle(0,0,10);
  popMatrix();
}

void Canva5() {
  pushMatrix();
  //sol
  translate(width* 3/6,height * 3/6);
  noFill();
  noStroke();
  circle(0,0,50);
  //terra
  rotate(frameCount*(TWO_PI)/(meuframeRate*20));
  translate(30,0);
  noFill();
  circle(0,0,25);
  //lua
  rotate(frameCount*(TWO_PI)/(meuframeRate*5));
  translate(55,0);
  fill(0);
  circle(0,0,10);
  popMatrix();
}

void Canva6() {
  pushMatrix();
  popMatrix();
}

void Canva7() {
  pushMatrix();
  popMatrix();
}

void Canva8() {
  pushMatrix();
  popMatrix();
}

void Canva9() {
  pushMatrix();
  popMatrix();
}

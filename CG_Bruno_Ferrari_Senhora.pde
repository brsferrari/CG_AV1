void setup() {
  colorMode(RGB);
  frameRate(meuframeRate);
  size(900,900);
  noStroke();
  
  //Canva (2,1)
  Canva(0,300,300, 107, 4, 37);
  
  //Canva (2,2)
  Canva(300,300,300, 4, 107, 104);
  
  //Canva (2,3)
  Canva(600,300,300, 185, 219, 18);
}

void draw() {
  //Desenha os Canvas
  Canvas();
  
  //Apaga o Canva 2,1 e 2,2 apos a lua atingir o ponto inicial.
  if ((frameCount/meuframeRate) == 20) {
    Canva(0,300,300, 107, 4, 37);
    Canva(300,300,300, 4, 107, 104); //Apague essa linha caso queira q o rastro no Canva 2,2 n se apague.
    frameCount = 0;
  }
}


void mouseClicked() {
    cor = cor + 25;
    if (cor > 256) {
      cor = 0;
    }
}


//Vetor que contem o numero de lados para a celula 1,1 e o nivel de Koch para a celula 1,2
int meuframeRate = 30;
int[] vertex_1_1 = {0,3,4,5,6,7,8,9,10,11,12};
int selectedVertex_1_1;
int[] vertex_1_2 = {0,1,2,3,4,5};
int selectedVertex_1_2;

//Funcao Koch
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


//Funcao que desenha cada quadrado (Canva)
void Canva(int x, int y, int extent,int r, int g, int b) {
  colorMode(RGB);
  noStroke();
  fill(r,g,b);
  square(x,y,extent);
}

//Funcao que desenha todos os Canvas 
void Canvas() {
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
}


//Canva 1,1
void Canva1() {
  Canva(0,0,300, 245, 81, 79);
  colorMode(RGB);
  strokeWeight(1);
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


//Canva 1,2
void Canva2() {
  Canva(300,0,300, 22, 94, 124);
  colorMode(RGB);
  strokeWeight(1);
  pushMatrix();
  if (frameCount % (2*int(meuframeRate)) == 0) {
    selectedVertex_1_2++;
    if (selectedVertex_1_2 == vertex_1_2.length){
      selectedVertex_1_2 = 0;   
    }
  }
  
  //Caso queira aumentar o nivel do Koch adicione ao array "vertex_1_2"
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


//Canva 1,3
void Canva3() {  
  Canva(600,0,300, 155, 200, 209);
  colorMode(RGB);
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


//Canva 2,1
void Canva4() {
  colorMode(RGB);
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


//Canva 2,2
void Canva5() {
  colorMode(RGB);
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


//Canva 2,3
float u = 0;

void Canva6() {
  colorMode(RGB);
  pushMatrix();
  //Translada para o Canva que a gente quer
  translate(width * 5/6,height * 3/6);
  //Ajusta o tamanho e cor dos pontos
  strokeCap(ROUND);
  strokeWeight(5);
  stroke(0,0,0);
  //Contador de acordo com o frame count que desenha os pontos de acordo;
   if (frameCount % 1 == 0 && u <= 360) {
     float xu = 30 * cos(u) * (exp(cos(u)) - 2 * cos(4 * u) - sin(pow((u/12), 5)));
     float yu = 30 * sin(u) * (exp(cos(u)) - 2 * cos(4 * u) - sin(pow((u/12), 5)));
     point(xu,yu);
     u++;
   }
  popMatrix();
}


//Canva 3,1
float O;
float R = 70;
float O1 = 15;
float O2 = 20;
float a = 0.4;
float b = 0.6;
float rO = R * (1 + a*cos(20+O1) + b*cos(30+O2));

void Canva7() {
  colorMode(RGB);
  pushMatrix();
  //Translada para o Canva que a gente quer
  translate(width * 1/6,height * 5/6);
  //Ajusta o tamanho e cor dos pontos
  strokeCap(ROUND);
  strokeWeight(5);
  stroke(0,0,0);
  //Contador de acordo com o frame count que desenha os pontos de acordo;
   if (frameCount % 2 == 0 && O <= 360) {
     float px =  rO * sin(O);
     float py =  rO * cos(O);
     point(px,py);
     O++;
   }
  popMatrix();
}



//Canva 3,2
PVector location = new PVector(450,650);
PVector velocity = new PVector(2,2.1);
PVector gravity = new PVector(0,0.3);
int variableName;

void Canva8() {
  Canva(300,600,300, 0, 0, 0);
  colorMode(RGB);
  pushMatrix();
  location.add(velocity);
  velocity.add(gravity);
  
  //Bordas
  if ((location.x > 585) || (location.x < 325)) {
    velocity.x = velocity.x * -1;
  }
  if (location.y > height) {
    velocity.y = velocity.y * -0.95; 
    location.y = height;
  }

  stroke(0);
  strokeWeight(1);
  colorMode(HSB);
  fill(color(variableName, 255, 255));
  variableName++;
  if (variableName > 255) {
    variableName = 0;
  }
  ellipse(location.x,location.y,30,30);
  popMatrix();
}



//Canva 3,3
float randomx, randomy;
boolean winner = false;
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

float mx = 750;
float my = 755;
float easing = 0.20;
int cor = 0;

void Canva9() {
  Canva(600,600,300, 49, 206, 174);
  colorMode(HSB);
  pushMatrix();
  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }
  
  mx = constrain(mx, 615, 885);
  my = constrain(my, 615, 885);
  stroke(1);
  fill(color(cor, 255, 255)); 
  ellipse(mx, my, 25, 25);
  fill(0,0,0);
  text("click in any place to change color",610,620);
  popMatrix();
}

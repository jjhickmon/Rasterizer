int x = 564;
int img_w;
boolean incr_dpi = false;
PImage img;
float min;
float max;

void setup(){
  fullScreen();
  img = loadImage("photo.jpeg");
  img.resize(height, height);
  img_w = img.width;
  min = 1;
  max = 282;
}

void draw(){
  background(255);
  fill(0);
  noStroke();
  push();
  translate(img_w/4 + 56, 0);
  
  float dots = map(x, 0, max, max, min);
  float max_size = img_w/dots;
  
  for(int i = 0; i < dots; i++){
    for(int j = 0; j < dots; j++){
      color x = img.get(int(j*max_size), int(i*max_size));
      float size = map(brightness(x), 0, 255, max_size, 0)+2;
      if(size > 2){
        circle(j*max_size+max_size/2, i*max_size+max_size/2, size);
      }
    }
  }
  if(incr_dpi){
    x += 3;
  }else{
    x -= 3;
  }
  if(x <= min){
    incr_dpi = true;
  } else if(x >= max){
    incr_dpi = false;
  }
  pop();
  textSize(15);
  text("resolution: " + dots + "px, " + dots + "px", 50, 50);
}

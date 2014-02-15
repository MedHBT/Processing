// Snowing stars
//It's a sketch with star's shape in diffrent postions,angles,dimensions and proportions

//Define Color Palette
color[] palette = {#000000,#FD6B23,#FFFFFF,#FBE307,#49E308,#E49019};
float counter = 0;

//Create setup code block
void setup(){
 //maximum window size
 size(800, 600);
 //select the first color from the selected palette
 background(palette[0]);
}

//Create the draw code block
void draw(){
 //Setup while loop counting up to 8000
 while(counter < 8000){
   //Set stroke color to random palette color
   stroke(palette[int(random(1, 6))]);
   //Set stroke weight randomly
   strokeWeight(int(random(1, 10)));
   //Set fill color randomly from palette
   fill(palette[int(random(1, 6))]);
   //set star origin location x to random of screen width
   float x = random(width);
   //set star origin location x to random of screen height    
   float y = random(height);
   //set star height and width randomly
   float d = random(10, 80);
   //set star angle
   float a = random(-PI/4.0);
   //set star proportion
   float p = random(0.5);
   //draw star 
   star(5,x,y,d,d,a,p);
   //change limiter count randomly between -1 and +2
   counter += random(-1, +2);
 }
}
//star drawing function
void star(int n, float cx, float cy, float w, float h,
  float startAngle, float proportion)
{
  if (n > 2)
  {
    float angle = TWO_PI/ (2 *n);  // twice as many sides
    float dw; // draw width
    float dh; // draw height
    
    w = w / 2.0;
    h = h / 2.0;
    
    beginShape();
    for (int i = 0; i < 2 * n; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) // for odd vertices, use short radius
      {
        dw = w * proportion;
        dh = h * proportion;
      }
      vertex(cx + dw * cos(startAngle + angle * i),
        cy + dh * sin(startAngle + angle * i));
    }
    endShape(CLOSE);
  }
}

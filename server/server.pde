import processing.net.*;

Server ludoServer;
   int val = 0;

void setup() {
  size(200, 200);
  // Starts a myServer on port 5204
  ludoServer = new Server(this, 5204); 
  //Maybe write in functions here???
}   

void draw() {
  //write in the board
}

import processing.net.*;

Server ludoServer;
Client client;

int number = 0;
int playerNumber = 1;

int timer = 0;
boolean timerBoolean;

boolean rollDice;

int port = 8000;
int diceRoll;

int piece;

//Green array___________________________________________________________
int gp11_loc = -1;
int gp12_loc = -1;
int gp13_loc = -1;
int gp14_loc = -1;

int gp11X;
int gp12X;
int gp13X;
int gp14X;
int gp11Y;
int gp12Y;
int gp13Y;
int gp14Y;

int[] Gxvalues = { 
  72, 111, 148, 186, 223, 261, 261, 261, 261, 261, 261, 299, 337, 
  337, 337, 337, 337, 337, 373, 412, 449, 487, 525, 562, 562, 562, 
  525, 487, 449, 412, 373, 337, 337, 337, 337, 337, 337, 299, 261, 
  261, 261, 261, 261, 261, 223, 186, 148, 111, 72, 35, 35, 35, 
  //road
  72, 72, 111, 148, 186, 223, 262, 262, 262, 262, 262, 262, 262
};

int[] Gyvalues = { 261, 261, 261, 261, 261, 223, 186, 148, 111, 72, 35, 35, 35, 
  72, 111, 148, 186, 223, 261, 261, 261, 261, 261, 261, 299, 337, 
  337, 337, 337, 337, 337, 373, 412, 449, 487, 525, 562, 562, 562, 
  525, 487, 449, 412, 373, 337, 337, 337, 337, 337, 337, 299, 261, 
  //road
  261, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299
};

//Yellow array___________________________________________________________________________
int gp21_loc = -1;
int gp22_loc = -1;
int gp23_loc = -1;
int gp24_loc = -1;

int gp21X;
int gp22X;
int gp23X;
int gp24X;
int gp21Y;
int gp22Y;
int gp23Y;
int gp24Y;

int[] Yxvalues = {
  337, 337, 337, 337, 337, 373, 412, 449, 487, 525, 562, 562, 562, 
  525, 487, 449, 412, 373, 337, 337, 337, 337, 337, 337, 299, 261, 
  261, 261, 261, 261, 261, 223, 186, 148, 111, 72, 35, 35, 35, 
  72, 111, 148, 186, 223, 261, 261, 261, 261, 261, 261, 299, 337, 
  //road
  337, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299
};

int[] Yyvalues = {
  72, 111, 148, 186, 223, 261, 261, 261, 261, 261, 261, 299, 337, 
  337, 337, 337, 337, 337, 373, 412, 449, 487, 525, 562, 562, 562, 
  525, 487, 449, 412, 373, 337, 337, 337, 337, 337, 337, 299, 261, 
  261, 261, 261, 261, 261, 261, 223, 186, 148, 111, 72, 72, 
  //road
  72, 72, 111, 148, 186, 223, 262, 262, 262, 262, 262, 262, 262
};

//Blue array__________________________________________________________________________
int gp31_loc = -1;
int gp32_loc = -1;
int gp33_loc = -1;
int gp34_loc = -1;

int gp31X;
int gp32X;
int gp33X;
int gp34X;
int gp31Y;
int gp32Y;
int gp33Y;
int gp34Y;

int[] Bxvalues = {
  525, 487, 449, 412, 373, 337, 337, 337, 337, 337, 337, 299, 261, 
  261, 261, 261, 261, 261, 223, 186, 148, 111, 72, 35, 35, 35, 
  72, 111, 148, 186, 223, 261, 261, 261, 261, 261, 261, 299, 337, 
  337, 337, 337, 337, 337, 373, 412, 449, 487, 525, 562, 562, 562, 
  //road
  525, 525, 487, 449, 412, 373, 335, 335, 335, 335, 335, 335, 335
};

int[] Byvalues = {
  337, 337, 337, 337, 337, 373, 412, 449, 487, 525, 562, 562, 562, 
  525, 487, 449, 412, 373, 337, 337, 337, 337, 337, 337, 299, 261, 
  261, 261, 261, 261, 261, 261, 223, 186, 148, 111, 72, 72, 
  72, 111, 148, 186, 223, 261, 261, 261, 261, 261, 261, 299, 337, 
  //road
  337, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299
};

//Red array__________________________________________________________________________
int gp41_loc = -1;
int gp42_loc = -1;
int gp43_loc = -1;
int gp44_loc = -1;

int gp41X;
int gp42X;
int gp43X;
int gp44X;
int gp41Y;
int gp42Y;
int gp43Y;
int gp44Y;

int[] Rxvalues = {
  261, 261, 261, 261, 261, 223, 186, 148, 111, 72, 35, 35, 35, 
  72, 111, 148, 186, 223, 261, 261, 261, 261, 261, 261, 299, 337, 
  337, 337, 337, 337, 337, 373, 412, 449, 487, 525, 562, 562, 562, 
  525, 487, 449, 412, 373, 337, 337, 337, 337, 337, 337, 299, 261, 
  //road
  261, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299, 299
};

int[] Ryvalues = {
  525, 487, 449, 412, 373, 337, 337, 337, 337, 337, 337, 299, 261, 
  261, 261, 261, 261, 261, 261, 223, 186, 148, 111, 72, 72, 
  72, 111, 148, 186, 223, 261, 261, 261, 261, 261, 261, 299, 337, 
  337, 337, 337, 337, 337, 373, 412, 449, 487, 525, 562, 562, 562, 
  //road
  525, 525, 487, 449, 412, 373, 335, 335, 335, 335, 335, 335, 335
};

void setup() {

  size(200, 200);

  // Starts a myServer on port 5255
  ludoServer = new Server(this, 5255);
}  

Client Player;
void serverEvent(Server server, Client client) { 
  println(" A new client has connected: "+ client.ip()); 
  Player = client;
}

void draw() {

  Client c = ludoServer.available();
  if (c != null) {
    number = c.read();
    String whatClientSaid = c.readString();
    //println(whatClientSaid);

    if (whatClientSaid.length() > 1)
      piece = Integer.parseInt(whatClientSaid);
    else
      diceRoll = Integer.parseInt(whatClientSaid);
  }

  if (diceRoll == 0 || piece == 0) return;

  if (timer == 0 && !timerBoolean) {
    ludoServer.write(number);
    timerBoolean = true;
  }

  if (timerBoolean == true) {
    timer++;
    if (timer == 1) {
      timerBoolean = false;
      timer = 0;
    }
  }

  //Green___________________________________________________________________
  if (piece == 11) { 
    gp11_loc = gp11_loc + diceRoll;
    gp11X = Gxvalues[gp11_loc]; 
    gp11Y = Gyvalues[gp11_loc];
  } else if (piece == 12) { 
    gp12_loc = gp12_loc + diceRoll;
    gp12X = Gxvalues[gp12_loc]; 
    gp12Y = Gyvalues[gp12_loc];
  } else if (piece == 13) { 
    gp13_loc = gp13_loc + diceRoll;
    gp13X = Gxvalues[gp13_loc]; 
    gp13Y = Gyvalues[gp13_loc];
  } else if (piece == 14) { 
    gp14_loc = gp14_loc + diceRoll;
    gp14X = Gxvalues[gp14_loc]; 
    gp14Y = Gyvalues[gp14_loc];
  }

  //Yellow________________________________
  else if (piece == 21) { 
    gp21_loc = gp21_loc + diceRoll;
    gp21X = Gxvalues[gp21_loc]; 
    gp21Y = Gyvalues[gp21_loc];
  } else if (piece == 22) { 
    gp22_loc = gp22_loc + diceRoll;
    gp22X = Gxvalues[gp22_loc]; 
    gp22Y = Gyvalues[gp22_loc];
  } else if (piece == 23) { 
    gp23_loc = gp23_loc + diceRoll;
    gp23X = Gxvalues[gp23_loc]; 
    gp23Y = Gyvalues[gp23_loc];
  } else if (piece == 24) { 
    gp24_loc = gp24_loc + diceRoll;
    gp24X = Gxvalues[gp24_loc]; 
    gp24Y = Gyvalues[gp24_loc];
  } 
  //Blue______________________________
  else if (piece == 31) { 
    gp31_loc = gp31_loc + diceRoll;
    gp31X = Gxvalues[gp31_loc]; 
    gp31Y = Gyvalues[gp31_loc];
  } else if (piece == 32) { 
    gp32_loc = gp32_loc + diceRoll;
    gp32X = Gxvalues[gp32_loc]; 
    gp32Y = Gyvalues[gp32_loc];
  } else if (piece == 33) { 
    gp33_loc = gp33_loc + diceRoll;
    gp33X = Gxvalues[gp33_loc]; 
    gp33Y = Gyvalues[gp33_loc];
  } else if (piece == 34) { 
    gp34_loc = gp24_loc + diceRoll;
    gp34X = Gxvalues[gp34_loc]; 
    gp34Y = Gyvalues[gp34_loc];
  } 
  //Red______________________________
  else if (piece == 41) { 
    gp41_loc = gp41_loc + diceRoll;
    gp41X = Gxvalues[gp41_loc]; 
    gp41Y = Gyvalues[gp41_loc];
  } else if (piece == 42) { 
    gp42_loc = gp42_loc + diceRoll;
    gp42X = Gxvalues[gp42_loc]; 
    gp42Y = Gyvalues[gp42_loc];
  } else if (piece == 43) { 
    gp43_loc = gp43_loc + diceRoll;
    gp43X = Gxvalues[gp43_loc]; 
    gp43Y = Gyvalues[gp43_loc];
  } else if (piece == 44) { 
    gp44_loc = gp44_loc + diceRoll;
    gp44X = Gxvalues[gp44_loc]; 
    gp44Y = Gyvalues[gp44_loc];
  } 

  //Sends data to client 
  //Green
  if (piece == 11) ludoServer.write("gp11," + gp11X + "," + gp11Y );
  else if (piece == 12) ludoServer.write("gp12," + gp12X + "," + gp12Y );
  else if (piece == 13) ludoServer.write("gp13," + gp13X + "," + gp13Y );
  else if (piece == 14) ludoServer.write("gp14," + gp14X + "," + gp14Y );
  //Yellow
  else if (piece == 21) ludoServer.write("gp21," + gp21X + "," + gp21Y );
  else if (piece == 22) ludoServer.write("gp22," + gp22X + "," + gp22Y );
  else if (piece == 23) ludoServer.write("gp23," + gp23X + "," + gp23Y );
  else if (piece == 24) ludoServer.write("gp24," + gp24X + "," + gp24Y );
  //Blue
  else if (piece == 31) ludoServer.write("gp31," + gp31X + "," + gp31Y );
  else if (piece == 32) ludoServer.write("gp32," + gp32X + "," + gp32Y );
  else if (piece == 33) ludoServer.write("gp33," + gp33X + "," + gp33Y );
  else if (piece == 34) ludoServer.write("gp34," + gp34X + "," + gp34Y );
  //Red
  else if (piece == 41) ludoServer.write("gp41," + gp41X + "," + gp41Y );
  else if (piece == 42) ludoServer.write("gp42," + gp42X + "," + gp42Y );
  else if (piece == 43) ludoServer.write("gp43," + gp43X + "," + gp43Y );
  else if (piece == 44) ludoServer.write("gp44," + gp44X + "," + gp44Y );

  diceRoll = 0;
  piece = 0;
}

#define songlength 16
#define i0 20  //handshake bit
#define i1 21  //songsel1
#define i2 22  //songsel2
#define i3 23  //songsel3
#define o0 24  //note0
#define o1 25  //note1
#define o2 26  //note2


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(i0, INPUT_PULLUP);
  pinMode(i1, INPUT_PULLUP);
  pinMode(i2, INPUT_PULLUP);
  pinMode(i3, INPUT_PULLUP);
  pinMode(o0, OUTPUT);
  pinMode(o1, OUTPUT);
  pinMode(o2, OUTPUT);
}

void loop() {
  int i = 0;
  bool input0, input1, input2, input3 = 0;
  input0 = digitalRead(i0);
  input1 = digitalRead(i1);
  input2 = digitalRead(i2);
  input3 = digitalRead(i3);
  
  
  int song[songlength] = {0};
  char SEL_SONG = 0;
  
  do
  if      (input1 == 0 && input2 == 0 && input3 == 0) {SEL_SONG = 0; i = 0;} //
  else if (input1 == 0 && input2 == 0 && input3 == 1) SEL_SONG = 1;
  else if (input1 == 0 && input2 == 1 && input3 == 0) SEL_SONG = 2;
  else if (input1 == 0 && input2 == 1 && input3 == 1) SEL_SONG = 3;
  else if (input1 == 1 && input2 == 0 && input3 == 0) SEL_SONG = 4;
  else if (input1 == 1 && input2 == 0 && input3 == 1) SEL_SONG = 5;
  else if (input1 == 1 && input2 == 1 && input3 == 0) SEL_SONG = 6;
  else if (input1 == 1 && input2 == 1 && input3 == 1) SEL_SONG = 7;
  else    SEL_SONG = 0;
  while(SEL_SONG == 0);
  
  switch (SEL_SONG) //choose song, continue if no song is given yet
  {
    case 1:
      getsong1(song);
      break;
    case 2:
      getsong2(song);
      break;
    case 3:
      getsong3(song);
      break;
    case 4:
      getsong4(song);
      break;
    case 5:
      getsong5(song);
      break;
    case 6:
      getsong5(song);
      break;
    case 7:
      getsong7(song);
      break;
  }

  for(i = 0; i<songlength; i++)
  {
    while(input0 == 0){}
    if(input0 == 1) //handshake
    {
      do
      switch (song[i]) //send note
      {
      case 0:
        digitalWrite(o2, LOW); digitalWrite(o1, LOW); digitalWrite(o0, LOW);
        break;
      case 1:
        digitalWrite(o2, LOW); digitalWrite(o1, LOW); digitalWrite(o0, HIGH);
        break;
      case 2:
        digitalWrite(o2, LOW); digitalWrite(o1, HIGH); digitalWrite(o0, LOW);
        break;
      case 3:
        digitalWrite(o2, LOW); digitalWrite(o1, HIGH); digitalWrite(o0, HIGH);
        break;
      case 4:
        digitalWrite(o2, HIGH); digitalWrite(o1, LOW); digitalWrite(o0, LOW);
        break;
      case 5:
        digitalWrite(o2, HIGH); digitalWrite(o1, LOW); digitalWrite(o0, HIGH);
        break;
      case 6:
        digitalWrite(o2, HIGH); digitalWrite(o1, HIGH); digitalWrite(o0, LOW);
        break;
      case 7:
        digitalWrite(o2, HIGH); digitalWrite(o1, HIGH); digitalWrite(o0, HIGH);
        break;
      }
      while(input0 == 1);
    }
  }
  delay(500); //delay to ensure no loading of same song at the end of loading previous song
  
}

void getsong1(int (&song1)[songlength]){
  int song[] = {1, 2, 3, 2, 1, 2, 3, 2, 3, 4, 5, 3, 4, 5, 1, 0};
  *song1 = *song;
}

void getsong2(int (&song2)[songlength]){
  int song[] = {5, 6, 7, 2, 4, 6, 1, 2, 7, 4, 5, 6, 3, 4, 5, 0};
  *song2 = *song;
}

void getsong3(int (&song3)[songlength]){
  int song[] = {7, 3, 2, 4, 1, 5, 6, 7, 3, 4, 2, 7, 3, 4, 5, 0};
  *song3 = *song;
}

void getsong4(int (&song4)[songlength]){
  int song[] = {6, 3, 2, 3, 1, 3, 4, 2, 6, 7, 3, 2, 1, 4, 6, 0};
  *song4 = *song;
}

void getsong5(int (&song5)[songlength]){
  int song[] = {7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 6, 7, 0};
  *song5 = *song;
}

void getsong6(int (&song6)[songlength]){
  int song[] = {3, 6, 1, 3, 2, 4, 1, 6, 7, 5, 3, 5, 4, 2, 3, 0};
  *song6 = *song;
}

void getsong7(int (&song7)[songlength]){
  int song[] = {1, 2, 7, 5, 6, 3, 5, 3, 2, 4, 3, 2, 1, 3, 4, 0};
  *song7 = *song;
}

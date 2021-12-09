#define songlength 16
#define i0 30  //handshake bit
#define i1 31  //songsel1
#define i2 32  //songsel2
#define i3 33  //songsel3
#define o0 34  //note0
#define o1 35  //note1
#define o2 36  //note2
#define o3 37  //confirm

int *song;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(i0, INPUT);
  pinMode(i1, INPUT);
  pinMode(i2, INPUT);
  pinMode(i3, INPUT);
  pinMode(o0, OUTPUT);
  pinMode(o1, OUTPUT);
  pinMode(o2, OUTPUT);
  pinMode(o3, OUTPUT);
  song = (int*)calloc(songlength, sizeof(int));
}


void loop() {
  int i = 0;
  bool input0, input1, input2, input3, confirm = 0;
  
  char SEL_SONG = '0';

  digitalWrite(o3, LOW);
  
  while(SEL_SONG == '0'){
  input1 = digitalRead(i1);
  input2 = digitalRead(i2);
  input3 = digitalRead(i3);
  Serial.print("Input 12: ");
  Serial.print(input1);
  Serial.print(", Input 22: ");
  Serial.print(input2);
  Serial.print(", Input 32: ");
  Serial.println(input3);
  if      (input1 == LOW && input2 == LOW && input3 == LOW)     {SEL_SONG = '0'; i = 0;} //
  else if (input1 == LOW && input2 == LOW && input3 == HIGH)    SEL_SONG = '1';
  else if (input1 == LOW && input2 == HIGH && input3 == LOW)    SEL_SONG = '2';
  else if (input1 == LOW && input2 == HIGH && input3 == HIGH)   SEL_SONG = '3';
  else if (input1 == HIGH && input2 == LOW && input3 == LOW)    SEL_SONG = '4';
  else if (input1 == HIGH && input2 == LOW && input3 == HIGH)   SEL_SONG = '5';
  else if (input1 == HIGH && input2 == HIGH && input3 == LOW)   SEL_SONG = '6';
  else if (input1 == HIGH && input2 == HIGH && input3 == HIGH)  SEL_SONG = '7';
  else    SEL_SONG = '0';
  }
  
  switch (SEL_SONG) //choose song, continue if no song is given yet
  {
    case '1':
      getsong1();
      break;
    case '2':
      getsong2();
      break;
    case '3':
      getsong3();
      break;
    case '4':
      getsong4();
      break;
    case '5':
      getsong5();
      break;
    case '6':
      getsong6();
      break;
    case '7':
      getsong7();
      break;
  }


  for(i = 0; i<songlength; i++)
  {
    while(input0 == 0){
      input0 = digitalRead(i0);    
      Serial.print("Input 0: ");
      Serial.println(input0);}
    if(input0 == 1) //handshake
    {
      if(confirm == 0){
        digitalWrite(o3, HIGH);
        confirm = 1;
      } else {
        digitalWrite(o3, LOW);
        confirm = 0;
      }
      do{
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
      Serial.print("note: ");
      Serial.print(song[i]);
      Serial.print("  songselect: ");
      Serial.print(SEL_SONG);
      Serial.print("  i: ");
      Serial.println(i);
      Serial.print(song[0]);
      Serial.print(song[1]);
      Serial.print(song[2]);
      Serial.print(song[3]);
      Serial.print(song[4]);
      Serial.print(song[5]);
      Serial.print(song[6]);
      Serial.println(song[7]);
      input0 = digitalRead(i0);}
      while(input0 == 1);
    }
  }
  delay(500); //delay to ensure no loading of same song at the end of loading previous song
  
}

void getsong1(){
  int song1[songlength] = {1, 2, 3, 2, 1, 2, 3, 2, 3, 4, 5, 3, 4, 5, 1, 0};
  int i;
  for (i = 0; i < songlength; i++){
    song[i] = song1[i];
    }
}

void getsong2(){
  int song2[songlength] = {5, 6, 7, 2, 4, 6, 1, 2, 7, 4, 5, 6, 3, 4, 5, 0};
  int i;
  for (i = 0; i < songlength; i++){
    song[i] = song2[i];
    }
}

void getsong3(){
  int song3[songlength] = {7, 3, 2, 4, 1, 5, 6, 7, 3, 4, 2, 7, 3, 4, 5, 0};
  int i;
  for (i = 0; i < songlength; i++){
    song[i] = song3[i];
    }
}

void getsong4(){
  int song4[songlength] = {6, 3, 2, 3, 1, 3, 4, 2, 6, 7, 3, 2, 1, 4, 6, 0};
  int i;
  for (i = 0; i < songlength; i++){
    song[i] = song4[i];
    }
}

void getsong5(){
  int song5[songlength] = {7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 6, 7, 0};
  int i;
  for (i = 0; i < songlength; i++){
    song[i] = song5[i];
    }
}

int getsong6(){
  int song6[songlength] = {3, 6, 1, 3, 2, 4, 1, 6, 7, 5, 3, 5, 4, 2, 3, 0};
  int i;
  for (i = 0; i < songlength; i++){
    song[i] = song6[i];
    }
}

void getsong7(){
  int song7[songlength] = {1, 2, 7, 5, 6, 3, 5, 3, 2, 4, 3, 2, 1, 3, 4, 0};
  int i;
  for (i = 0; i < songlength; i++){
    song[i] = song7[i];
    }
}

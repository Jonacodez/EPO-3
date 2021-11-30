package constants_package is

  	constant h1: integer:= 96; --hpulse
	constant h2: integer:= 144; --hpulse + hbackport
	constant h3: integer:= 784; --hpulse + hbackport + hactive
	constant h4: integer:= 800; --hpulse + hbackport + hactive + hfrontport
	constant v1: integer:= 2;
	constant v2: integer:= 35;
	constant v3: integer:= 515;
	constant v4: integer:= 525;

	constant size1: integer := 20;
	constant size2: integer := 50;
	constant size3: integer := 80;

	constant block1_top: integer := v2;
	constant block1_bottom: integer := v2 + size1;

	constant block2_top: integer := v2;
	constant block2_bottom: integer := v2 + size2;

	constant block3_top: integer := v2;
	constant block3_bottom: integer := v2 + size3;

	constant note1_left: integer:= 144 + 0;
	constant note1_right: integer:= 144 + 79;

	constant note2_left: integer:= 144 + 80;
	constant note2_right: integer:= 144 + 159;

	constant note3_left: integer:= 144 + 160;
	constant note3_right: integer:= 144 + 239;

	constant note4_left: integer:= 144 + 240;
	constant note4_right: integer:= 144 + 319;

	constant note5_left: integer:= 144 + 320;
	constant note5_right: integer:= 144 + 399;
 
	constant note6_left: integer:= 144 + 400;
	constant note6_right: integer:= 144 + 479;

	constant note7_left: integer:= 144 + 480;
	constant note7_right: integer:= 144 + 559;

	constant note8_left: integer:= 144 + 560; --nice
	constant note8_right: integer:= 144 + 640;
end package constants_package;

package body constants_package is
end package body constants_package;

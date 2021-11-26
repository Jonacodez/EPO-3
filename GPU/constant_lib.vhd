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

	constant block1_top: integer := h2;
	constant block1_bottom: integer := h2 + size1;

	constant block2_top: integer := h2;
	constant block2_bottom: integer := h2 + size2;

	constant block3_top: integer := h2;
	constant block3_bottom: integer := h2 + size3;

	constant note1_left: integer:= 2+57 ;
	constant note1_right: integer:= 2;

	constant note2_left: integer:=2+57+2+58;
	constant note2_right: integer:=2+57+2;

	constant note3_left: integer:=2+57+2+58+2+58;
	constant note3_right: integer:=2+57+2+58+2;

	constant note4_left: integer:=2+57+2+58+2+58+2+58;
	constant note4_right: integer:=2+57+2+58+2+58+2;

	constant note5_left: integer:=2+57+2+58+2+58+2+58+2+58;
	constant note5_right: integer:=2+57+2+58+2+58+2+58+2;
 
	constant note6_left: integer:=2+57+2+58+2+58+2+58+2+58+2+58;
	constant note6_right: integer:=2+57+2+58+2+58+2+58+2+58+2;

	constant note7_left: integer:=2+57+2+58+2+58+2+58+2+58+2+58+2+58;
	constant note7_right: integer:=2+57+2+58+2+58+2+58+2+58+2+58+2;

	constant note8_left: integer:=2+57+2+58+2+58+2+58+2+58+2+58+2+58+2+57;
	constant note8_right: integer:=2+57+2+58+2+58+2+58+2+58+2+58+2+58+2;
end package constants_package;

package body constants_package is
end package body constants_package;

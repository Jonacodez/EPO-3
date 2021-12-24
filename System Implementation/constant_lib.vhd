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
	constant size2: integer := 40;
	constant size3: integer := 60;

	constant block1_top: integer := v2;
	constant block1_bottom: integer := v2 + size1;

	constant block2_top: integer := v2;
	constant block2_bottom: integer := v2 + size2;

	constant block3_top: integer := v2;
	constant block3_bottom: integer := v2 + size3;
	
	--note 1
	constant note1_left: integer:= 144 + 3;
	constant note1_right: integer:= 144 + 79;

	constant note1_bottom: integer := v2 + 480; 

	constant note1_top1: integer:= note1_bottom - size1;
	constant note1_top2: integer:= note1_bottom - size2;
	constant note1_top3: integer:= note1_bottom - size3;

	--note 2
	constant note2_left: integer:= 144 + 80;
	constant note2_right: integer:= 144 + 159;

	constant note2_bottom: integer := v2 + 420;

	constant note2_top1: integer:= note2_bottom - size1;
	constant note2_top2: integer:= note2_bottom - size2;
	constant note2_top3: integer:= note2_bottom - size3;
	
	--note 3
	constant note3_left: integer:= 144 + 160;
	constant note3_right: integer:= 144 + 239;

	constant note3_bottom: integer := v2 + 360;

	constant note3_top1: integer:= note3_bottom - size1;
	constant note3_top2: integer:= note3_bottom - size2;
	constant note3_top3: integer:= note3_bottom - size3;

	--note 4
	constant note4_left: integer:= 144 + 240;
	constant note4_right: integer:= 144 + 319;

	constant note4_bottom: integer := v2 + 300;

	constant note4_top1: integer:= note4_bottom - size1;
	constant note4_top2: integer:= note4_bottom - size2;
	constant note4_top3: integer:= note4_bottom - size3;
	
	--note 5
	constant note5_left: integer:= 144 + 320;
	constant note5_right: integer:= 144 + 399;

	constant note5_bottom: integer := v2 + 240;

	constant note5_top1: integer:= note5_bottom - size1;
	constant note5_top2: integer:= note5_bottom - size2;
	constant note5_top3: integer:= note5_bottom - size3;

	--note 6
	constant note6_left: integer:= 144 + 400;
	constant note6_right: integer:= 144 + 479;

	constant note6_bottom: integer := v2 + 180;

	constant note6_top1: integer:= note6_bottom - size1;
	constant note6_top2: integer:= note6_bottom - size2;
	constant note6_top3: integer:= note6_bottom - size3;
	
	--note 7
	constant note7_left: integer:= 144 + 480;
	constant note7_right: integer:= 144 + 559;

	constant note7_bottom: integer := v2 + 120;

	constant note7_top1: integer:= note7_bottom - size1;
	constant note7_top2: integer:= note7_bottom - size2;
	constant note7_top3: integer:= note7_bottom - size3;
	
	--note 8
	constant note8_left: integer:= 144 + 560; --nice
	constant note8_right: integer:= 144 + 640;

	constant note8_bottom: integer := v2 + 60;
	
	constant note8_top1: integer:= note8_bottom - size1;
	constant note8_top2: integer:= note8_bottom - size2;
	constant note8_top3: integer:= note8_bottom - size3;
end package constants_package;

package body constants_package is
end package body constants_package;

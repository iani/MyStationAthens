
{ SinOsc.arps (LFNoise0.kr (30).range (400, 1000))} ++> \test;
//:
{ SinOsc.arps (

	Lag.kr (LFNoise0.kr (30).range (400, 1000), 1)

)} ++> \test;
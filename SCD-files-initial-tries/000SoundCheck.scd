
{ SinOsc.ar ([400, 500], 0, SinOsc.kr (0.1, [0, pi / 2], 0.1)) } ++> 'soundCheck';

//:

{ SinOsc.ar ([400, 500], 0, SinOsc.kr ([0.4, 0.05], [0, pi / 2], 0.1)) } ++> 'soundCheck';

//:

{ PinkNoise.ar (SinOsc.kr ([2, 0.05], [0, pi / 2], 0.1)) } ++> 'soundCheck';

//:
Scenes.channelCheck;
//:
//:
Server.local.scope (zoom: 16);
//:
Scenes.channelCheck;
//:
"(whitenoise.kubustest)".arlink;
//:
SF.kubus ++> \kubustest;
{ PinkNoise.ar (0.1) } ++> \whitenoise;
//:
{ PinkNoise.ar (0.1) } ++> \whitenoise;
//: alternative
{ PinkNoise.ar (Decay2.kr (Impulse.kr (1, 0, 0.1), 0.3)) } ++> \whitenoise;
//:
0.0 +>.width \kubustest;
//:
0.25 +>.x \kubustest;
//:
0.5 +>.x \kubustest;
//:
0.75 +>.x \kubustest;
//:
1.0 +>.x \kubustest;
//:
0.5 +>.y \kubustest;
//:
1.0 +>.y \kubustest; 
//:
0.5 +>.width \kubustest;
//:
1.0 +>.width \kubustest;


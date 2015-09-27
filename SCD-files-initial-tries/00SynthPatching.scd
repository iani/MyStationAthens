//:
Server.local.scope (zoom: 16);
//:
Scenes.channelCheck;
//:
"(whitenoise.kubustest)".arlink;
//:
SF.kubus ++> \kubustest;
{ PinkNoise.ar (0.1) } ++> \whitenoise;
//: alternative
{ PinkNoise.ar (Decay2.kr (Impulse.kr (1, 0, 0.1), 0.3)) } ++> \whitenoise;
 //:
0.0 +>.width \kubustest;
//:
0.2 +>.x \kubustest;
//:
1.0 +>.y \kubustest;
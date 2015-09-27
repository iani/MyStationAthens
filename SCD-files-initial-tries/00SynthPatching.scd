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
////////////////////////////////////////////////////////////////

//: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// ================================================================

"(b0.k0)(b1.k1)(b2.k2)(b3.k3)(b4.k4)(b5.k5)(b6.k6)(b7.k7)([m1.m2.m3.m4]rm.km)([e1.e2.e3.e4]re.ke)".arlink;

{ | n |
	SF.kubus ++> format ("k%", n).asSymbol;
} ! 8;
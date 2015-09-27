//:
43 / 8;
//:

{
	WhiteNoise.ar (0.0);
} ++> \x0;
//:
"x0.a0".arlink;
//:
{ Inp.ar } ++> \a0;
//:
"(b0.k0)(b1.k1)(b2.k2)(b3.k3)(b4.k4)(b5.k5)(b6.k6)(b7.k7)([m1.m2.m3.m4]rm.km)([e1.e2.e3.e4]re.ke)".arlink;
//:
{ WhiteNoise.ar }
l
//:
{ | n |
	var name;
	name = format("b%", n).asSymbol;
	n = n % 4;
	{
		Blip.arp(
			1 + n / 2 * Line.kr(Rand(20, 80).midicps, Rand(20, 80).midicps, Rand(0.1, 1)),
			Line.kr(Rand(5, 25), Rand(5, 25), 0.5)
		).perform([\perc, \sine]@@n);
	} +> name;

	([0.25.pn(14), 5 ! 3, 1, 2, 0.1 ! 10, 3] / (0.5 + (n / 4))).flat.prand *> name;
} ! 8;
//:
{ | n |
	var name;
	name = format("b%", n).asSymbol;
	n = n % 4;
	{
		WhiteNoise.ar (0.05)
	} ++> name;

	//	([0.25.pn(14), 5 ! 3, 1, 2, 0.1 ! 10, 3] / (0.5 + (n / 4))).flat.prand *> name;
} ! 8;
//:
{ | n |
	var name;
	name = format("b%", n).asSymbol;
	n = n % 4;
	name.release;

	//	([0.25.pn(14), 5 ! 3, 1, 2, 0.1 ! 10, 3] / (0.5 + (n / 4))).flat.prand *> name;
} ! 8;
//:
{ | n |
	var name;
	name = format("b%", n).asSymbol;
	n = n % 4;
	name.release;

	//	([0.25.pn(14), 5 ! 3, 1, 2, 0.1 ! 10, 3] / (0.5 + (n / 4))).flat.prand *> name;
} ! 8;
//:

{ SinOsc.ar } ++> \k0;
1 +>.x \k1;
0 +>.vol \k2;

\k6.release;


{ Silent.ar } ++> \k0;
{ Silent.ar } ++> \k1;
{ Silent.ar } ++> \k2;
{ Silent.ar } ++> \k3;
{ Silent.ar } ++> \k4;
{ Silent.ar } ++> \k5;


{ Silent.ar } ++> \m0;
{ Silent.ar } ++> \m7;

//: #+BEGIN_SRC sclang
\b0 **>.xoooo \b0; // use **> to prevent re-starting the master Task
\b1 **>.xoooo \b1;
\b2 **>.xoooo \b2;
\b3 **>.x \b3;
\b4 **>.xoooo \b4;
\b5 **>.xoooo \b5;
\b6 **>.xoooo \b6;
\b7 **>.xoooo \b7;

//: #+BEGIN_SRC sclang
\b0 **>.xoooo \b0;
\b1 **>.o \b1;
\b2 **>.o \b2;
\b3 **>.x \b3;
\b4 **>.o \b4;
\b5 **>.o \b5;
\b6 **>.o \b6;
\b7 **>.xo \b7;

//: #+BEGIN_SRC sclang
\b7 **> \b7;
\b6 **>.xo \b7;
\b5 **>>.xo \_b7;
\b4 **>>.xo \__b7;
\b3 **>>.xo \___b7;
\b2 **>>.xo \____b7;
\b1 **>>.xo \_____b7;
\b0 **>>.xo \______b7;

//: #+BEGIN_SRC sclang
\b7 *> 0.1;
//: #+BEGIN_SRC sclang
([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3] / 4).flat.prand *> \b7;
{ | n | Pfunc({ 0.01 exprand: 0.35 }) +>.amp format("b%", n).asSymbol } ! 8;

//: #+BEGIN_SRC sclang
([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3] / 4).flat.prand *> \b7;
\b7 **> \b7;
\b6 **>.xo \b7;
\b5 **>>.xo \_b7;
\b4 **>>.xo \__b7;
([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3]).flat.prand *> \b3;
\b3 **>.xoo \b3;
\b2 **>>.xoo \_b3;
\b1 **>>.xoo \__b3;
\b0 **>>.xoo \___b3;

//: #+BEGIN_SRC sclang
TaskPlayer.stopAll;
//: #+BEGIN_SRC sclang
0.01 *> \b0;
//: #+BEGIN_SRC sclang
0.1 *> \b1;

//: #+BEGIN_SRC sclang
\b2 **>>.xo \b1;
0.5 +>.amp \b2;

//: #+BEGIN_SRC sclang
\b3 **>>.xo \_b1;


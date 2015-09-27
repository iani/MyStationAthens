//:
{ | n |
	var name;
	name = format("multi%", n).asSymbol;
	n = n % 4;
	{
		Blip.arps(
			1 + n / 2 * Line.kr(Rand(20, 80).midicps, Rand(20, 80).midicps, Rand(0.1, 1)),
			Line.kr(Rand(5, 25), Rand(5, 25), 0.5)
		).perform([\perc, \sine]@@n)
	} +> name;

	([0.25.pn(14), 5 ! 3, 1, 2, 0.1 ! 10, 3] / (0.5 + (n / 4))).flat.prand *> name;
} ! 8;
//:

//: #+BEGIN_SRC sclang
\multi0 **>.xoooo \multi0; // use **> to prevent re-starting the master Task
\multi1 **>.xoooo \multi1;
\multi2 **>.xoooo \multi2;
\multi3 **>.x \multi3;
\multi4 **>.xoooo \multi4;
\multi5 **>.xoooo \multi5;
\multi6 **>.xoooo \multi6;
\multi7 **>.xoooo \multi7;

//: #+BEGIN_SRC sclang
\multi0 **>.xoooo \multi0;
\multi1 **>.o \multi1;
\multi2 **>.o \multi2;
\multi3 **>.x \multi3;
\multi4 **>.o \multi4;
\multi5 **>.o \multi5;
\multi6 **>.o \multi6;
\multi7 **>.xo \multi7;

//: #+BEGIN_SRC sclang
\multi7 **> \multi7;
\multi6 **>.xo \multi7;
\multi5 **>>.xo \_multi7;
\multi4 **>>.xo \__multi7;
\multi3 **>>.xo \___multi7;
\multi2 **>>.xo \____multi7;
\multi1 **>>.xo \_____multi7;
\multi0 **>>.xo \______multi7;

//: #+BEGIN_SRC sclang
\multi7 *> 0.1;
//: #+BEGIN_SRC sclang
([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3] / 4).flat.prand *> \multi7;
{ | n | Pfunc({ 0.01 exprand: 0.35 }) +>.amp format("multi%", n).asSymbol } ! 8;

//: #+BEGIN_SRC sclang
([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3] / 4).flat.prand *> \multi7;
\multi7 **> \multi7;
\multi6 **>.xo \multi7;
\multi5 **>>.xo \_multi7;
\multi4 **>>.xo \__multi7;
([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3]).flat.prand *> \multi3;
\multi3 **>.xoo \multi3;
\multi2 **>>.xoo \_multi3;
\multi1 **>>.xoo \__multi3;
\multi0 **>>.xoo \___multi3;

//: #+BEGIN_SRC sclang
TaskPlayer.stopAll;
//: #+BEGIN_SRC sclang
0.01 *> \multi0;
//: #+BEGIN_SRC sclang
0.1 *> \multi1;

//: #+BEGIN_SRC sclang
\multi2 **>>.xo \multi1;
0.5 +>.amp \multi2;

//: #+BEGIN_SRC sclang
\multi3 **>>.xo \_multi1;


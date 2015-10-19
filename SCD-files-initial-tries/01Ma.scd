//:
Ma.start;
//:
Ma.narrowKubus;
//:
Ma.kubusMove (13.91);
//:
Ma.r1_150;
Ma.r1_200;
Ma.r1_250;
Ma.r1_300;
Ma.r1_0;
Ma.r1_1000;
Ma.r1_90;
Ma.r1_50;
Ma.r1_25;
Ma.r1_25cluster;
Ma.r1_25cluster;
Ma.r1_250cluster;
Ma.r1_1000cluster;
Ma.r1_2500cluster;
Ma.r1_2500gliss;
Ma.r1_2500gliss (1);
Ma.r1_rgliss (20);

0.1 +>.fadeTime \rm1;
0.5 +>.fadeTime \rm1;
1.1 +>.fadeTime \rm1;
2.1 +>.fadeTime \rm1;

Ma.r1_rgliss (1);
Ma.r1_rgliss (0.1);
Ma.r1_rgliss (0.5);

Ma.r1_noise0 (100, 120, 10);
Ma.r1_noise0 (1000, 1200, 10);
Ma.r1_noise0 (1000, 1500, 1);

Ma.r1_noise1 (100, 120, 10);
Ma.r1_noise1 (1000, 1200, 10);
Ma.r1_noise1 (1000, 1500, 1);


Ma.r2_150;
Ma.r2_200;
Ma.r2_250;
Ma.r2_300;
Ma.r2_0;

//:
Ma.m2;
Ma.m3;
Ma.m4;
//:


//:
1.25 +>.vol \pm1;
0.82 +>.vol \pm1;
0.72 +>.vol \pm1;
0.62 +>.vol \pm1;
0.52 +>.vol \pm1;
0.42 +>.vol \pm1;
0.32 +>.vol \pm1;
0.1 +>.vol \pm1;
0.05 +>.vol \pm1;
0.01 +>.vol \pm1;
0.005 +>.vol \pm1;

//:
1 +>.vol \rm1;
0.82 +>.vol \rm1;
0.72 +>.vol \rm1;
0.62 +>.vol \rm1;
0.52 +>.vol \rm1;
0.42 +>.vol \rm1;
0.32 +>.vol \rm1;
0.1 +>.vol \rm1;
0.05 +>.vol \rm1;
0.01 +>.vol \rm1;
0.005 +>.vol \rm1;

//:
1 +>.vol \rm2;
0.82 +>.vol \rm2;
0.72 +>.vol \rm2;
0.62 +>.vol \rm2;
0.52 +>.vol \rm2;
0.42 +>.vol \rm2;
0.32 +>.vol \rm2;
0.1 +>.vol \rm2;
0.05 +>.vol \rm2;
0.01 +>.vol \rm2;
0.005 +>.vol \rm2;

////////////////////////////////////////////////////////////////
//:
0.0 +>.rate \m1;
1.0 +>.rate \m1;
0.0 +>.rate \m2;
1.0 +>.rate \m2;
0.0 +>.rate \m3;
1.0 +>.rate \m3;
1.0 +>.rate \m4;
0.0 +>.rate \m4;
0.1 +>.rate \m1;

//:
0.1 +>.rate \m1;

//:
0.12 +>.vol \pm1;

//:
0.001 +>.vol \pm1;

//:
0.001 +>.vol \rm1;

//:
{ | vol = 0.8 pos = 0 width = 0.8 |
	var src;
	src = Mix (Resonz.ar (Inp.ar, 100 * [1, 1.2, 1.25, 1.8, 2, 3],
		XLine.kr (1, 0.0005, 30)))
	* XLine.kr (1, 15, 60);
	//	PanAz.ar (43, src * vol, pos, 1, width * 43 + 2);
	src;
} ++> \rm1;
//:
{ | vol = 1 pos = 0 width = 0.8 |
	var src;
	src = Inp.ar;
	PanAz.ar (43, src * vol, pos, 1, width * 43 + 2);
} ++> \pm1;

//:
\levteris_speaks.bufnum +>.buf \m1;
273.8 +>.startPos \m1;
1 +>.rate \m1;
1 +>.loop \m1;
SF.playbuf ++> \m1;
//:
\levteris_speaks.bufnum +>.buf \m2;
273.8 +>.startPos \m2;
1 +>.rate \m2;
1 +>.loop \m2;
SF.playbuf ++> \m2;
//:
3 +>.fadeTime \rm1;
3 +>.fadeTime \rm2;


//:
3.0 +>.rate \m1;

//:
0.75 +>.rate \m1;

//:
0.15 +>.vol \rm1;

//:
0.15 +>.vol \rm2;
//:
0.1 +>.vol \pm1;
//:
//:
{ Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0001))
	* 10

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	// LFDNlise1.kr (1).range (0.0001, 1)
	0.1

   ))
	* 1

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 750 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0001))
	* 10

} ++> \rm2;
//:
{ Mix (Resonz.ar (Inp.ar, 200 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 200 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 80 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 90 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 50 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 25 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rm1;

//
//:
{ | vol = 1 pos = 0 width = 0 |
	var src;
	src = Mix (Resonz.ar (Inp.ar, 1500 * [1, 1.2, 1.25, 1.8, 2, 3],
	1.5))
	* 10;
} +> \rm2;
//:
{ | vol = 1 pos = 0 width = 0 |
	var src;
	src = Mix (Resonz.ar (Inp.ar, 200 * [1, 1.2, 1.25, 1.8, 2, 3],
	0.0001))
	* 20;
	PanAz.ar (43, src * vol, pos, 1, width * 43 + 2);
} +> \rm2
//:
{ | vol = 1 pos = 0 width = 0 |
	var src;
	src = Mix (Resonz.ar (Inp.ar, 250 * [1, 1.2, 1.25, 1.8, 2, 3],
	0.0005))
	* 20;
	PanAz.ar (43, src * vol, pos, 1, width * 43 + 2);
} +> \rm1;
//:
150 +>.rate \m1;


//:
{
	var src;
	src = Mix (Resonz.ar (Inp.ar, 250 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3],
	0.0005))
	* 10;

	Out.ar (1, src);

} ++> \rm1;
//:
{
	var src;
	src = Mix (Resonz.ar (Inp.ar, 250 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3],
	0.0005))
	* 10;

	Out.ar (0, [src, src.abs, src, src]);

} ++> \rm1;
//:
{
	var src;
	src = Mix (Resonz.ar (Inp.ar, 250 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3],
	0.0001))
	* 1;

	Out.ar (0, [LPF.ar (src.abs, 100), src.abs]);

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 100 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0001))
	* 10

} ++> \rm1;
//:
{ Mix (Resonz.ar (
	Inp.ar,
	LFDNoise1.kr (1).range (100, 200)
	* [1, 1.2, 1.25, 1.8, 2, 3],
	0.0005))
	* 10
} ++> \rm1;
//:
{ Mix (Resonz.ar (
	Inp.ar,
	LFDNoise0
.kr (10).range (100, 120)
	* [1, 1.2, 1.25, 1.8, 2, 3],
	0.0005))
	* 20
} ++> \rm1;
//:
{ Mix (Resonz.ar (
	Inp.ar,
	LFDNoise0
.kr (1).range (100, 120)
	* [1, 1.2, 1.25, 1.8, 2, 3],
	0.0005))
	* 10
} ++> \rm2;

//:
{
	var src;
	src = Mix (Resonz.ar (Inp.ar,
		90 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0005
	)) * 3;

	Out.ar (1, src);

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 90 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	LFNoise1.kr (0.2).range (0.0005, 0.05)
))
	* 3

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 
	LFDNoise0.kr (10).range (50, 100)
	* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	LFNoise1.kr (0.2).range (0.0005, 0.05)
)) * 3

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 
	LFDNoise1.kr (10).range (50, 100)
	* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	LFNoise1.kr (0.2).range (0.0005, 0.05)
))
	* 3

} ++> \rm1;
//:
{ Mix (Resonz.ar (Inp.ar, 
	LFDNoise1.kr (10).range (250, 500)
	* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	LFNoise1.kr (0.2).range (0.0005, 0.05)
))
	* 3

} ++> \rm1;

//:
////////////////////////////////////////////////////////////////
//:
\levteris_speaks.bufnum +>.buf \m2;
273.8 +>.startPos \m2;
1 +>.rate \m2;
1 +>.loop \m2;
SF.playbuf ++> \m2;
//:

\levteris_speaks.bufnum +>.buf \m3;
273.8 +>.startPos \m3;
1 +>.rate \m3;
1 +>.loop \m3;
SF.playbuf ++> \m3;
//:

\levteris_speaks.bufnum +>.buf \m4;
273.8 +>.startPos \m4;
1 +>.rate \m4;
1 +>.loop \m4;
SF.playbuf ++> \m4;


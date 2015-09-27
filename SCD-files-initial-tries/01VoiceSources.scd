
\eisitirio.bufnum +>.buf \e1;
1 +>.loop \e1;
SF.playbuf ++> \e1;

//:

\eisitirio.bufnum +>.buf \e2;
1 +>.loop \e2;
SF.playbuf ++> \e2;

//:
"([e1.e2]thru)".arlink;

//:
{ Inp.ar } ++> \thru;
//:
{ Resonz.ar (Inp.ar, 1000, 0.01) } ++> \thru;
//:
{ Mix (Resonz.ar (Inp.ar, 1000 * [1, 1.2, 1.25, 1.8, 2, 3], 0.01)) } ++> \thru;
//:
{ Mix (Resonz.ar (Inp.ar, Line.kr (100, 2000, 100) *
	[1, 1.2, 1.25, 1.8, 2, 3], 0.001)) } ++> \thru;
//:
{ Mix (Resonz.ar (Inp.ar, Line.kr (100, 2000, 100) *
	[1, 1.2, 1.25, 1.8, 2, 3], XLine.kr (1, 0.001, 10))) } ++> \thru;
//:
{ Mix (Resonz.ar (Inp.ar, Line.kr (100, 2000, 100) *
	LFNoise1.kr ([1, 2, 3]).range (1, 2), XLine.kr (1, 0.001, 10))) } ++> \thru;
//:
{ Mix (Resonz.ar (Inp.ar, Line.kr (100, 2000, 100) *
	LFNoise1.kr ([1, 2, 3, 4, 5, 6]).range (1, 2), XLine.kr (1, 0.001, 10))) } ++> \thru;
//:
{ Mix (Resonz.ar (Inp.ar, Line.kr (100, 2000, 100) *
	LFNoise1.kr ([1, 2, 3, 4, 5, 6]).range (1, 2), XLine.kr (0.001, 0.1, 10))) } ++> \thru;
//:

15 +>.rate \e1;
//:

0.15 +>.rate \e2;
//:
////////////////////////////////////////////////////////////////
//:

\levteris_speaks.bufnum +>.buf \l1;
273.8 +>.startPos \l1; 
1 +>.loop \l1;
SF.playbuf ++> \l1;
\levteris_speaks.buf.duration / 60;
{ Mix (Resonz.ar (Inp.ar, 100 * [1, 1.2, 1.25, 1.8, 2, 3],
	XLine.kr (1, 0.001, 30)))
	* XLine.kr (1, 15, 30)
} ++> \rl1;
"(l1[rl1.rl2])".arlink;
//:
3 +>.fadeTime \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 100 * [1, 1.2, 1.25, 1.8, 2, 3],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 100 * [1, 1.2, 1.25, 1.8, 2, 3],
	0.0005))
	* 10

} ++> \rl2;
//:
{ Mix (Resonz.ar (Inp.ar, 100 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 100 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 200 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 200 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 80 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 90 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 50 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 25 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (
	Inp.ar,
	LFDNoise0
.kr (1).range (100, 200)
	* [1, 1.2, 1.25, 1.8, 2, 3],
	0.0005))
	* 10

} ++> \rl1;
//:
{ Mix (Resonz.ar (
	Inp.ar,
	LFDNoise0
.kr (10).range (100, 120)
	* [1, 1.2, 1.25, 1.8, 2, 3],
	0.0005))
	* 20
} ++> \rl1;
//:
{ Mix (Resonz.ar (
	Inp.ar,
	LFDNoise0
.kr (1).range (100, 120)
	* [1, 1.2, 1.25, 1.8, 2, 3],
	0.0005))
	* 10
} ++> \rl1;

//:
{ Mix (Resonz.ar (Inp.ar, 90 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	0.05
))
	* 3

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 90 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	LFNoise1.kr (0.2).range (0.0005, 0.05)
))
	* 3

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 
	LFDNoise0.kr (10).range (50, 100)
	* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	LF
Noise1.kr (0.2).range (0.0005, 0.05)
))
	* 3

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 
	LFDNoise1.kr (10).range (50, 100)
	* [0
.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	LFNoise1.kr (0.2).range (0.0005, 0.05)
))
	* 3

} ++> \rl1;
//:
{ Mix (Resonz.ar (Inp.ar, 
	LFDNoise1.kr (10).range (250, 500)
	* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
	LFNoise1.kr (0.2).range (0.0005, 0.05)
))
	* 3

} ++> \rl1;

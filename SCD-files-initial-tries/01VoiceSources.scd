
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
1 +>.loop \l1;
SF.playbuf ++> \l1;
//:
\levteris_speaks.buf.duration / 60;

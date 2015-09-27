
\hasansong.release(1);

{ WhiteNoise.ar(0.1) } ++> \test;

\test.release(0.5);


"rezasong".arlink;
"--- Starting Reza2 Song: PLAIN".postln;
'song1'.bufnum +>.buf \rezasong;
0.2 +>.vol \rezasong;
SF.playbuf ++> \rezasong;
\rezasong.release(1);


Lefteris.start;
Reza.start;
Hasan.start;
10 +>.thresh 'pv';

HasanSong.plain;
HasanSong.pv;

Eisitirio.intro;

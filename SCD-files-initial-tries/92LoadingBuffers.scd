Help.gui;

\reza1.buf.play;
\reza1.bufnum;

//:
'reza1'.bufnum +>.buf \bufrd;
{ | buf = 0 |
	BufRd.ar(1, buf,
		Phasor.ar(0, BufRateScale.kr(buf), 0, BufFrames.kr(buf)),
		0, 0, 2
	);
} ++> \bufrd;

//:
'reza1'.bufnum +>.buf \bufrd;
{ | buf = 0 |
	BufRd.ar(1, buf,
		Line.ar (0, BufFrames.kr(buf), 10),
		1, 1, 2
	);
} ++> \bufrd;

//:
f = { | buf = 0 |
	BufRd.ar(1, buf,
		Phasor.ar(0, BufRateScale.kr(buf), 0, BufFrames.kr(buf)),
		0, 0, 2
	);
};

{ | buf = 0 | f.(buf) } +> \bufrd;

//:
\xeno.bufnum +>.buf \bufrd;
{ | buf = 0 |
	BufRd.ar(2, buf,
		Phasor.ar(0, BufRateScale.kr(buf) * 0.4, 42000, 50000, 0),
		0, 0, 2
	);
} ++> \bufrd;
//:
'eisitirio'.bufnum +>.buf \bufrd;
{ | buf = 0 |
	BufRd.ar(2, buf,
		Line.ar(0, BufFrames.kr(buf), BufFrames.kr (buf) / BufSampleRate.kr (buf)),
		0, 0, 2
	);
} ++> \bufrd;
//:
'eisitirio'.bufnum +>.buf \bufrd;
{ | buf = 0 |
	BufRd.ar(2, buf,
		Line.ar(BufFrames.kr(buf), 0, BufFrames.kr (buf) / BufSampleRate.kr (buf)),
		0, 0, 2
	);
} ++> \bufrd;
//:
\xeno.bufnum +>.buf \bufrd;
{ | buf = 0 |
	BRD(2, buf);
} ++> \bufrd;
//:
'xeno-gr'.bufnum +>.buf \bufrd;
//:

Help.gui;

//:

{ WhiteNoise.arps.perc } ++> \test;

//:

OSCFunc ({ | msg |
	msg.postln; "received".postln;
	
}, \x_y);

//:

NetAddr.localAddr.sendMsg ('/x_y', 1, 2, 3);

//:

//:
\xeno.bufnum +>.buf \bufrd;
{ | buf = 0, from = 0, to = 1 |
	BufRd.ar(2, buf,
		Phasor.ar(0, BufRateScale.kr(buf) * 0.6,
			from * BufFrames.kr (buf),
			to * BufFrames.kr (buf), 0),
		0, 0, 2
	);
} ++> \bufrd;

//:

OSCFunc ({ | msg |
	msg.postln; "received".postln;
    msg [1] / 1439 +>.from \bufrd;
	msg [2] / 899 +>.to \bufrd;	
}, \x_y);


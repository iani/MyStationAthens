Help.gui;
//:
BufferList.showList;
/*
ar (numChannels, bufnum: 0, rate: 1, trigger: 1, startPos: 0, loop: 0, doneAction: 0)
*/
//:
'reza1'.bufnum +>.buf \bufplay;
{ | buf = 0, rate = 1, trigger = 0, startPos = 0, loop = 0, doneAction = 0 |
	PlayBuf.ar(1, buf, rate * BufRateScale.kr(buf),
		trigger, startPos * BufSampleRate.kr (buf),
		loop, doneAction
	);
} ++> \bufplay;
0.0 +>.trigger \bufplay;
//:
15 +>.startPos \bufplay;
1 +>.trigger \buffplay;
0 +>.trigger \buffplay;
//:
{
	-1 +>.trigger \bufplay;
	0.1.wait;
	1 +>.trigger \bufplay;

}.fork;

//:
/*
BufRd: 
arg numChannels, trigger=0, bufnum=0, rate=1, centerPos=0,
			dur=0.1, pan=0, amp=0.1, interp=4;
Phasor:

PlayBuf: 
arg numChannels, bufnum=0, rate=1.0, trigger=1.0, startPos=0.0, loop = 0.0, doneAction=0;
*/
//:
'reza1'.buf.duration;
//:
'reza1'.bufnum +>.buf \bufrd;
0 +>.from \bufrd;
'reza1'.buf.duration +>.to \bufrd;
{ | buf = 0, rate = 1, from = 0, to = 1 |
	BufRd.ar(1, buf,
		Phasor.ar(0, BufRateScale.kr(buf) * rate,
			from * BufSampleRate.kr (buf),
			to * BufSampleRate.kr (buf), 0),
		0, 0, 2
	);
} ++> \bufrd;
//:
1.4 +>.from \bufrd;
3 +>.to \bufrd;

//: PlayBuf: Use envelope to stop. Startpos, dur, rate
'reza1'.bufnum +>.buf 'playbuf';
0 +>.from 'playbuf';
'reza1'.buf.duration * 10 +>.dur 'playbuf';
{ | buf = 0 from = 0 dur = 1 rate = 1 trigger = 1 |
	PlayBuf.ar (1, buf,
		rate * BufRateScale.kr (buf),
		trigger,
		from * BufSampleRate.kr (buf),
		1, 0
	)
	* EnvGen.kr (Env ([0, 1, 1, 0], [0.01, dur - 0.02 max: 0.03, 0.01]),
		trigger, doneAction: 0
	);

} ++> 'playbuf';
//: PlayBuf: Use envelope to stop. Startpos, dur, rate
'eisitirio'.bufnum +>.buf 'playbuf';
0 +>.from 'playbuf';
'eisitirio'.buf.duration * 10 +>.dur 'playbuf';
{ | buf = 0 from = 0 dur = 1 rate = 1 trigger = 1 |
	PlayBuf.ar (1, buf,
		rate * BufRateScale.kr (buf),
		trigger,
		from * BufSampleRate.kr (buf),
		1, 0
	)
	* EnvGen.kr (Env ([0, 1, 1, 0], [0.01, dur - 0.02 max: 0.03, 0.01]),
		trigger, doneAction: 0
	);

} ++> 'playbuf';
//:
{
	-1 +>.trigger 'playbuf';
	0.1.wait;
	5 +>.from 'playbuf';
	1 +>.trigger 'playbuf'
}.fork;

//:
{
	-1 +>.trigger 'playbuf';
	0 +>.from 'playbuf';
	0.1.wait;
	15 +>.from 'playbuf';
	1 +>.trigger 'playbuf'
}.fork;

//:
{ | thresh = 10000 |
	RHPF.ar (Inp.ar, thresh)
} ++> 'hpf'
//:
{ | thresh = 500 |
	RLPF.ar (Inp.ar, thresh)
} ++> 'lpf'
//:
"(playbuf.hpf)".arlink;
//:
"(playbuf.lpf)".arlink;
//:
{ | freq = 1000, q = 1 vol = 1 |
	var src;
	src = Resonz.ar (Inp.ar, freq * LFNoise0.kr (0.25).range (0.5, 2) * [1, 1.2, 1.5], q);
	Mix (src) * vol
} ++> 'resonz';
//:
{ | freq = 1000, q = 1, vol = 1, rate = 1 |
	var src;
	src = Resonz.ar (Inp.ar, freq * LFNoise0.kr (rate).range (0.5, 2)
		* [1, 1.2, 1.5, 1.6, 1.7, 1.8, 1.9, 2], q);
	Mix (src) * vol
} ++> 'resonz';
//:
{ | freq = 1000, q = 1, vol = 1 |
	var src;
	src = Resonz.ar (Inp.ar, freq * LFDNoise1.kr (0.25).range (0.15, 4) * [1, 1.2, 1.5], q);
	Mix (src) * vol
} ++> 'resonz';
//:
{ | freq = 1000, q = 1, vol = 1, rate = 1 |
	var src;
	src = Resonz.ar (Inp.ar, freq * Lag.kr (LFDNoise0.kr (rate).range (0.05, 4), 0.05) * [1, 1.2, 1.5], q);
	Mix (src) * vol
} ++> 'resonz';
//:
{ | freq = 1000, q = 1 |
	var inp, pitch, src;
	inp = Inp.ar;
	
	src = Resonz.ar (Inp.ar, freq * LFDNoise1.kr (0.25).range (0.25, 4) * [1, 1.2, 1.5], q);
	Mix (src)
} ++> 'presonz';
//:
"([playbuf.playbuf2].resonz)".arlink;
//:

260 +>.freq 'resonz';
//:
0.01 +>.q 'resonz';
//:
20 +>.rate 'resonz';
//:
30 +>.rate 'resonz';
//:
0.31 +>.rate 'resonz';
//:
1 +>.rate 'resonz';
//:
2.2 +>.rate 'resonz';
//:
'eisitirio'.bufnum +>.buf 'playbuf';
//:
1 +>.rate 'bufrd';
//:
0.2 +>.rate 'playbuf';
//:
0.006 +>.q 'resonz';

//:
1.5 +>.vol 'resonz';


//:
'resonz'
//:
"([playbuf.playbuf2].resonz)(playbuf3.pv)".arlink;
//:
"(playbuf3.pv)".arlink;
//:
"playbuf3".arlink;
//:
"(playbuf.resonz)".arlink;
//:
////////////////////////////////////////////////////////////////

//: PlayBuf: Use envelope to stop. Startpos, dur, rate
'speaks1'.bufnum +>.buf 'playbuf3';
0 +>.from 'playbuf3';
'eisitirio'.buf.duration * 10 +>.dur 'playbuf3';
{ | buf = 0 from = 0 dur = 1 rate = 1 trigger = 1 |
	PlayBuf.ar (1, buf,
		rate * BufRateScale.kr (buf),
		trigger,
		from * BufSampleRate.kr (buf),
		1, 0
	)
	* EnvGen.kr (Env ([0, 1, 1, 0], [0.01, dur - 0.02 max: 0.03, 0.01]),
		trigger, doneAction: 0
	);

} ++> 'playbuf3';
//:
{ | vol = 1 |
	var in, chain;
	in = Inp.ar;
	chain = FFT(LocalBuf(2048), in);
	chain = PV_MagBelow(chain, MouseX.kr(0, 10));
    IFFT(chain) * vol;
} ++> 'pv';
//:
{
	var in, chain;
	in = Inp.ar;
	chain = FFT(LocalBuf(2048), in);
	chain = PV_MagSmear(chain, MouseX.kr(0, 100));
    IFFT(chain);
} *ma++> 'pv';
//:
'song1'.bufnum +>.buf 'playbuf3';
//:
{
	var in, chain;
	in = Inp.ar;
	chain = FFT(LocalBuf(2048), in);
	chain = PV_MagFreeze(chain, MouseY.kr > 0.5 );
    IFFT(chain);
} ++> 'pv';

//:
"(playbuf.resonz)".arlink;
//:
5 +>.vol 'pv';

//:
0.5 +>.q 'resonz';
//:
1 +>.rate 'resonz';

//:
400 +>.freq 'resonz';
1 +>.rate 'resonz';
50 +>.vol 'resonz';

//:
1.5 +>.rate 'bufrd';

//:
0.001 +>.q 'resonz';
//:
"(playbuf3.pv)".arlink;

//:
"(tickly.lpf)".arlink;




{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(3),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/1).abs/a)) * 0.5} ++> \tickly;

//:

{ | vol = 1 | Resonz.ar(Inp.ar, [500, 1000], 0.1) * 5 * vol } ++> \lpf;

//:



//:

// { | vol = 1 | Resonz.ar(Inp.ar, LFNoise0.kr(2, 1000, 1100), 0.1) * 100 } ++> \lpf;

//:
{b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([8, 4]),
		PinkNoise.ar)*437),0.1,0.01)
} ++> \tickly;
//:
{b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([8, 4]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
} ++> \tickly;
//:
{b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([8, 6]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
} ++> \tickly;
//:
{b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([4, 2]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
} ++> \tickly;
//:
{b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([3, 2]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
} ++> \tickly;
//:
{b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([1, 2]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
} ++> \tickly;
//:

////////////////////////////////////////////////////////////////

//:
	{ 10 * GVerb.ar(TGrains.ar(2, Pulse.ar(30),
			Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
	} ++> \dalwlk;
//"
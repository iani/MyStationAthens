

//:
a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2 * \fader0.kr(1) * 3 } ++> \ypochthonio;
//:

{FreeVerb2.ar(a=Klank.ar(`[[2,3,5,7]], Dust.ar(XLine.kr(4,0.01,49)))*BrownNoise.ar,a,0.5)} ++> \dryklank;

//:
SynthTree.faders;
//:
Server.killAll;

//:


{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(9),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/8).abs/a))} ++> \tickly;

//:


{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(9),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/1).abs/a))} ++> \tickly;

//:


{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(4),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/1).abs/a))} ++> \tickly;

//:


{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(3),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/1).abs/a))} ++> \tickly;

//:
"(tickly.lpf)".arlink;
//:

{ Resonz.ar(Inp.ar, [500, 1000], 0.1) * 20 } ++> \lpf;

//:

{ Resonz.ar(Inp.ar, LFNoise0.kr(2, 1000, 1100), 0.1) * 150 } ++> \lpf;

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

////////////////////////////////////////////////////////////////

//:
	{ 10 * GVerb.ar(TGrains.ar(2, Pulse.ar(3),
			Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
	} ++> \dalwlk;
//"
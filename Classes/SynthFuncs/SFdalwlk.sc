
+ SF {
	
	
	*dalwlk1 {
		var x;
		{ 10 * GVerb.ar(TGrains.ar(2, Pulse.ar(3),
			Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
		} ++> \dalwlk;
	}

	*dalwlk2 {
		var x;
		{ 100 * GVerb.ar(TGrains.ar(2, Pulse.ar(3),
			Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
		} ++> \dalwlk;
	}

	//:

	*dalwlk3 {
		var x;
		{ 100 * GVerb.ar(TGrains.ar(2, Pulse.ar(30),
			Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
		} ++> \dalwlk;
	}

	//:

	*dalwlk4 {
		var x;
		{ 140 * GVerb.ar(TGrains.ar(2, Pulse.ar(3),
			Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(16s)), x, Sweep.ar(x)))
		} ++> \dalwlk;
	}

	//:

	*dalwlk5 {
		var x;
		{ 50 * GVerb.ar(TGrains.ar(4, Pulse.ar(3),
			Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(1)), x, Sweep.ar(x)))
		} ++> \dalwlk;
	}

	//:

	*dalwlk6 {
		var x;
		{
			25 * GVerb.ar(TGrains.ar(4, Pulse.ar(3),
				Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(LFNoise0.kr(0.3, 5, 5.2))), x, Sweep.ar(x)))
		} ++> \dalwlk;
	}
	
}




/*
SF.dalwlk6;

//:

{
{ 10 * GVerb.ar(TGrains.ar(2, Pulse.ar(3),
	Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
} ++> \dalwlk;
}

//:
\dalwlk.st.fadeTime_(0.05)
//:

{
{ 100 * GVerb.ar(TGrains.ar(2, Pulse.ar(3),
	Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
} ++> \dalwlk;
}

//:

{
{ 100 * GVerb.ar(TGrains.ar(2, Pulse.ar(30),
	Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
} ++> \dalwlk;
}

//:

{
{ 140 * GVerb.ar(TGrains.ar(2, Pulse.ar(3),
	Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(16s)), x, Sweep.ar(x)))
} ++> \dalwlk;
}

//:

{
{ 50 * GVerb.ar(TGrains.ar(4, Pulse.ar(3),
	Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(1)), x, Sweep.ar(x)))
} ++> \dalwlk;
}

//:

{
{
	25 * GVerb.ar(TGrains.ar(4, Pulse.ar(3),
	Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(LFNoise0.kr(0.3, 5, 5.2))), x, Sweep.ar(x)))
} ++> \dalwlk;
}


*/


Aerodromio {
	*start {
		"--- Starting Aerodromio".postln;
		'istories'.bufnum +>.buf \aerodromio;
		1.6 +>.vol \aerodromio;
		SF.playbufpan ++> \aerodromio;

		"(veryfast.veryfastlpf)".arlink;
	}
	
	*veryfast {
		"(veryfast.veryfastlpf)".arlink;
		{ | vol = 1 | LPF.ar(Inp.ar, [400, 600]) * vol } ++> \veryfastlpf;
		{  | vol = 0.25 |
			var a, p;
			a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))
				* p.ar(16,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))
			* vol;
		} ++> \veryfast;


	}

	*hpf {
		{ HPF.ar(Inp.ar, [400, 600]) * 2 } ++> \veryfastlpf;
	}

	*lpfnoise {
		{ LPF.ar(Inp.ar, LFNoise0.kr([2, 3]).range(1000, 2000)) * 5 } ++> \veryfastlpf;
	}

	*hpfnoise {
		{ HPF.ar(Inp.ar, LFNoise0.kr([1, 2]).range(1000, 2000)) * 5 } ++> \veryfastlpf;
	}

	*resonznoise0 {
		{ Resonz.ar(Inp.ar, LFNoise0.kr([3, 2]).range(1800, 2000)) * 5 } ++> \veryfastlpf;	
	}

	*resonznoise1 {
		{ Resonz.ar(Inp.ar, LFNoise1.kr([5, 5]).range(200, 10000)) * 5 } ++> \veryfastlpf;	
	}

	*veryfast1 {
		{ var a, p;
			a=SinOsc;p=Pulse;GVerb.ar(
				WhiteNoise.ar*p.ar(
					TChoose.kr(a.kr(2),[5,8,20,30]))
				*p.ar(16,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))
		} ++> \veryfast;
	
	}

	*veryfast2 {
		{ var a, p;
			a=SinOsc;p=Pulse;GVerb.ar(
				WhiteNoise.ar*p.ar(
					TChoose.kr(a.kr(3),[5,8,20,30]))*p.ar(
						LFNoise1.ar(0.2).range(4, 20)
						,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))
		} ++> \veryfast;

	}

}
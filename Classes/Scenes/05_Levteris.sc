

Levteris {
	*start {
		"--- Starting Levteris".postln;
		"starting resonz".postln;
		{ | vol = 1 pos = 0 width = 0.8 |
			var src;
			src = Mix (Resonz.ar (Inp.ar, 100 * [1, 1.2, 1.25, 1.8, 2, 3],
				XLine.kr (1, 0.0005, 30)))
			* XLine.kr (1, 15, 60);
			PanAz.ar (43, src * vol, pos, 1, width * 43 + 2);
		} ++> \rm1;
		//:
		"starting lefteris ma".postln;
		\levteris_speaks.bufnum +>.buf \m1;
		273.8 +>.startPos \m1;
		1 +>.rate \m1;
		1 +>.loop \m1;
		SF.playbuf ++> \m1;		
	}

	*dance {
		var a, b;
		"(tickly.lpf)".arlink;
		{ | vol = 0.7 | Resonz.ar(Inp.ar, [500, 1000], 0.1) * 10 * vol
		} ++> \lpf;
		{ var b;
			b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(
				PulseCount.ar(Impulse.ar(3),PinkNoise.ar)*437
			),0.1,0.01),b.ar(79*b.ar(1/1).abs/a))
		} ++> \tickly;
	}

	*noiseresonz {
		{ | vol = 1 |
			Resonz.ar(Inp.ar, [500, 1000] *
				LFNoise0.kr (5).range (1, 2), 0.1) * 10 * vol
		} ++> \lpf;
	}

	*faster1 {
		{
			var a, b;
			b=SinOsc;
			AllpassC.ar(a=b.ar(PulseCount.ar(
				Impulse.ar([8, 4]),
				PinkNoise.ar)*437),0.1,0.01)
		} ++> \tickly;
	}

	*faster2 {
		{
			var a, b;
			b=SinOsc;
			AllpassC.ar(a=b.ar(PulseCount.ar(
				Impulse.ar([8, 4]),
				PinkNoise.ar)*
				[500, 1000] ),
				0.1,
				LFNoise1.kr(0.5).range(0.01, 0.5))
		} ++> \tickly;
	}
}

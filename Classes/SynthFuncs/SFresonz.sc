+ SF {
	*resonzpan {
		^{ | q = 0.001, freq = 400, freqmul = 1, pos = 0, vol = 1 |
			var src;
			q = Lag.kr (q, 0.2);
			src = Resonz.ar (Inp.ar, freq * [1, 1.2, 1.25, 1.5, 1.6, 12] * freqmul, q);
			Pan2.ar (Mix (src), pos, vol * (q.reciprocal / 50));
		}
	}

	*resonzpanmod0 {
		^{ | q = 0.001, freq = 400, freqmul = 1,
			lo = 0.9, hi = 1.1, rate = 5,
			pos = 0, vol = 1 |
			var src;
			q = Lag.kr (q, 0.1);
			src = Resonz.ar (Inp.ar,
				freq * Lag.kr (LFNoise0.kr (rate).range (lo, hi), 0.01)
				* [1, 1.2, 1.25, 1.5, 1.6, 12] * freqmul,

				q);
			Pan2.ar (Mix (src), pos, vol * (q.reciprocal / 50));
		}
	}

	*resonzpanmod0pink {
		^{ | q = 0.001, freq = 400, freqmul = 1,
			lo = 0.9, hi = 1.1, rate = 5,
			pos = 0, vol = 1 |
			var inp, src, amp, noise;
			// inp 
			q = Lag.kr (q, 0.1);
			src = Resonz.ar (Inp.ar,
				freq * Lag.kr (LFNoise0.kr (rate).range (lo, hi), 0.01)
				* [1, 1.2, 1.25, 1.5, 1.6, 12] * freqmul,

				q);
			Pan2.ar (Mix (src), pos, vol * (q.reciprocal / 50));
		}
	}
}

/*
'song1'.bufnum +>.buf \hasansong;
0.2 +>.vol \hasansong;
SF.playbuf ++> \hasansong;


SF.amp ++> \pv;
*/
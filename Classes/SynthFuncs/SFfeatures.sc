+ SF {


	////////////////////////////////////////////////////////////////
	// Features
	////////////////////////////////////////////////////////////////

	*pinkamp {
		^{ | wet = 0 |
			var in, amp, src;
			in = Inp.ar;
			amp = Amplitude.kr (in);
			1 - wet * in + (wet * PinkNoise.ar (amp));
		}
	}

	*pinkamppan {
		^{ | wet = 0 pos = 0 vol = 1 |
			var in, amp, src;
			in = Inp.ar;
			amp = Amplitude.kr (in);
			src = 1 - wet * in + (wet * PinkNoise.ar (amp));
			Pan2.ar (src, pos, vol);
		}
	}

	*pitch {
		^{ | wet = 0 |
			var in, freq, hasfreq, resynth;
			in = Inp.ar;
			#freq, hasfreq = Pitch.kr (in);
			resynth = SinOsc.ar (freq, 0, hasfreq);
			1 - wet * in + (wet * resynth);
		}
	}

	*pitchpan {
		^{ | wet = 0 pos = 0 vol = 1 |
			var in, freq, hasfreq, resynth, src;
			in = Inp.ar;
			#freq, hasfreq = Pitch.kr (in);
			resynth = SinOsc.ar (freq, 0, hasfreq);
			src = 1 - wet * in + (wet * resynth);
			Pan2.ar (src, pos, vol);
		}
	}
}

/*
'song1'.bufnum +>.buf \hasansong;
0.2 +>.vol \hasansong;
SF.playbuf ++> \hasansong;


SF.amp ++> \pv;
*/



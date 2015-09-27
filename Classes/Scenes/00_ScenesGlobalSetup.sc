Scenes {
	*init {
		Server.local.options.numOutputBusChannels = 43;
		Server.local.boot;
		BufferList.loadFolder;
		MIDIIn.connectAll;
		// MIDIFunc trace: true;
		this.connectLivid;
		this.connectJLC;
		Server.local.doWhenBooted ({
			Server.local.scope (zoom: 16);
			{ this.setupKubus; }.defer (1);
		});
	}

	*channelCheck {
		{ | chan = 0 rate = 1 vol = 0.1 |
			var src;
			src = PinkNoise.ar (Decay2.kr (Impulse.kr (rate), decayTime: rate.reciprocal));
			Out.ar (chan, src * vol)
		} ++> \channelCheck;
		{
			inf do: { | i |
				i = i % 43;
				postf ("Setting output channel to %\n", i);
				i +>.chan \channelCheck;
				1.wait;
			}
		}.fork;
	}
	
	*connectLivid {
		/*
			Blip "Multi" b0-7:
			On Livid Code controller knobs:

			Columns 1 to 8 correspond to Multi0 - Multi7.
			Rows are:
			1. (Top row:) y (elevation)
			2. (second row:) x (azimuth)
			3. width
			4. vol  (level)
		*/
		Dial (1, { | val |
			val / 127 +>.y \k0; [\y, \k0].postln;
		});
		Dial (2, { | val |
			val / 127 +>.x \k0; [\x, \k0].postln;
		});
		Dial (3, { | val |
			val / 127 +>.width \k0; [\width, \k0].postln;
		});
		Dial (4, { | val |
			val / 127 +>.vol \k0; [\vol, \k0].postln;
		});
		Dial (5, { | val |
			val / 127 +>.y \k1; [\y, \k1].postln;
		});
		Dial (6, { | val |
			val / 127 +>.x \k1; [\x, \k1].postln;
		});
		Dial (7, { | val |
			val / 127 +>.width \k1; [\width, \k1].postln;
		});
		Dial (8, { | val |
			val / 127 +>.vol \k1; [\vol, \k1].postln;
		});
		Dial (9, { | val |
			val / 127 +>.y \k2; [\y, \k2].postln;
		});
		Dial (10, { | val |
			val / 127 +>.x \k2; [\x, \k2].postln;
		});
		Dial (11, { | val |
			val / 127 +>.width \k2; [\width, \k2].postln;
		});
		Dial (12, { | val |
			val / 127 +>.vol \k2; [\vol, \k2].postln;
		});
		Dial (13, { | val |
			val / 127 +>.y \k3; [\y, \k3].postln;
		});
		Dial (14, { | val |
			val / 127 +>.x \k3; [\x, \k3].postln;
		});
		Dial (15, { | val |
			val / 127 +>.width \k4; [\width, \k3].postln;
		});
		Dial (16, { | val |
			val / 127 +>.vol \k4; [\vol, \k3].postln;
		});
		Dial (17, { | val |
			val / 127 +>.y \k5; [\y, \k4].postln;
		});
		Dial (18, { | val |
			val / 127 +>.x \k5; [\x, \k4].postln;
		});
		Dial (19, { | val |
			val / 127 +>.width \k5; [\width, \k4].postln;
		});
		Dial (20, { | val |
			val / 127 +>.vol \k5; [\vol, \k4].postln;
		});
		Dial (21, { | val |
			val / 127 +>.y \k2; [\y, \k5].postln;
		});
		Dial (22, { | val |
			val / 127 +>.x \k2; [\x, \k5].postln;
		});
		Dial (23, { | val |
			val / 127 +>.width \k3; [\width, \k5].postln;
		});
		Dial (24, { | val |
			val / 127 +>.vol \k3; [\vol, \k5].postln;
		});
		Dial (25, { | val |
			val / 127 +>.y \k3; [\y, \k6].postln;
		});
		Dial (26, { | val |
			val / 127 +>.x \k3; [\x, \k6].postln;
		});
		Dial (27, { | val |
			val / 127 +>.width \k4; [\width, \k6].postln;
		});
		Dial (28, { | val |
			val / 127 +>.vol \k4; [\vol, \k6].postln;
		});
		Dial (29, { | val |
			val / 127 +>.y \k4; [\y, \k7].postln;
		});
		Dial (30, { | val |
			val / 127 +>.x \k4; [\x, \k7].postln;
		});
		Dial (31, { | val |
			val / 127 +>.width \k3; [\width, \k7].postln;
		});
		Dial (32, { | val |
			val / 127 +>.vol \k3; [\vol, \k7].postln;
		});
	}

	*connectJLC {
		JLbutton (1, 1, { HasanSong.plain }, { \hasansong release: 3 });
		JLbutton (1, 2, { HasanSong.ypochthonio }, { \hasansong release: 3 });
		JLbutton (1, 3, { HasanSong.dalwlk }, { \dalwlk release: 3 });

		JLbutton (2, 1, { Eisitirio.intro }, { \eisagogi release: 3 });
		JLbutton (2, 2, { Eisitirio.harmonies }, { \eisagogi release: 3 });
		JLbutton (2, 3, { Eisitirio.harmonies2 }, {
			\eisagogi2 release: 3;
			// \harmonies2 release: 3;
		});
		
		JLbutton (3, 1, { Reza.start }, { \reza release: 3 });

		JLbutton(4, 1, { RezaSong.plain }, { \rezasong release: 3 } );
		// JLbutton(4, 2, { RezaSong.pv }, { \rezasong release: 3 });

		JLbutton (5, 1, { Levteris.start }, { \levteris release: 3 });
		JLbutton (5, 2, { Levteris.dance }, { \tickly release: 3 });
		JLbutton (5, 3, { Levteris.noiseresonz }, { \tickly release: 3 });
		JLbutton (5, 4, { Levteris.faster1 }, { \tickly release: 3 });
		JLbutton (5, 5, { Levteris.faster2 }, { \tickly release: 3 });
		JLbutton (6, 1, { Aerodromio.start }, { \aerodromio release: 10 });
		JLbutton (6, 2, { Aerodromio.veryfast }, { \veryfast release: 0.1 });
		JLbutton (6, 3, { Aerodromio.hpf }, { \veryfast release: 0.1 });
		JLbutton (6, 4, { Aerodromio.lpfnoise }, { \veryfast release: 0.1 });
		JLbutton (6, 5, { Aerodromio.hpfnoise }, { \veryfast release: 0.1 });
		JLbutton (7, 1, { Aerodromio.resonznoise0 }, { \veryfast release: 0.1 });
		JLbutton (7, 2, { Aerodromio.resonznoise1 }, { \veryfast release: 0.1 });
		JLbutton (7, 3, { Aerodromio.veryfast1 }, { \veryfast release: 0.1 });
		JLbutton (7, 4, { Aerodromio.veryfast2 }, { \veryfast release: 0.1 });		
	}
	
	*setupKubus {
		"================================================================".postln;
		"WIRING SYNTHS".postln;
		"(b0.k0)(b1.k1)(b2.k2)(b3.k3)(b4.k4)(b5.k5)(b6.k6)(b7.k7)([m1.m2.m3.m4]rm.km)([e1.e2.e3.e4]re.ke)".arlink;
		"SETTING UP KUBUS".postln;
		{ | n |
			SF.kubus ++> format ("k%", n).asSymbol;
		} ! 8;
		SF.kubus ++> \km;
		SF.kubus ++> \ke;
		"------------------- READY TO GO !!!!!!! ---------------".postln;
	}

	*ma {
		
	}

	*eisitirio {
		
	}
}

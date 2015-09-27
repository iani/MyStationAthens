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
			val / 127 +>.pos \b0; [\pos, \b0].postln;
		});
		Dial (2, { | val |
			val / 127 +>.x \b0; [\x, \b0].postln;
		});
		Dial (3, { | val |
			val / 127 +>.width \b0; [\width, \b0].postln;
		});
		Dial (4, { | val |
			val / 127 +>.vol \b0; [\vol, \b0].postln;
		});
		Dial (5, { | val |
			val / 127 +>.pos \b1; [\pos, \b1].postln;
		});
		Dial (6, { | val |
			val / 127 +>.x \b1; [\x, \b1].postln;
		});
		Dial (7, { | val |
			val / 127 +>.width \b1; [\width, \b1].postln;
		});
		Dial (8, { | val |
			val / 127 +>.vol \b1; [\vol, \b1].postln;
		});
		Dial (9, { | val |
			val / 127 +>.pos \b2; [\pos, \b2].postln;
		});
		Dial (10, { | val |
			val / 127 +>.x \b2; [\x, \b2].postln;
		});
		Dial (11, { | val |
			val / 127 +>.width \b2; [\width, \b2].postln;
		});
		Dial (12, { | val |
			val / 127 +>.vol \b2; [\vol, \b2].postln;
		});
		Dial (13, { | val |
			val / 127 +>.pos \b3; [\pos, \b3].postln;
		});
		Dial (14, { | val |
			val / 127 +>.x \b3; [\x, \b3].postln;
		});
		Dial (15, { | val |
			val / 127 +>.width \b3; [\width, \b3].postln;
		});
		Dial (16, { | val |
			val / 127 +>.vol \b3; [\vol, \b3].postln;
		});
		Dial (17, { | val |
			val / 127 +>.pos \b4; [\pos, \b4].postln;
		});
		Dial (18, { | val |
			val / 127 +>.x \b4; [\x, \b4].postln;
		});
		Dial (19, { | val |
			val / 127 +>.width \b4; [\width, \b4].postln;
		});
		Dial (20, { | val |
			val / 127 +>.vol \b4; [\vol, \b4].postln;
		});
		Dial (21, { | val |
			val / 127 +>.pos \b5; [\pos, \b5].postln;
		});
		Dial (22, { | val |
			val / 127 +>.x \b5; [\x, \b5].postln;
		});
		Dial (23, { | val |
			val / 127 +>.width \b5; [\width, \b5].postln;
		});
		Dial (24, { | val |
			val / 127 +>.vol \b5; [\vol, \b5].postln;
		});
		Dial (25, { | val |
			val / 127 +>.pos \b6; [\pos, \b6].postln;
		});
		Dial (26, { | val |
			val / 127 +>.x \b6; [\x, \b6].postln;
		});
		Dial (27, { | val |
			val / 127 +>.width \b6; [\width, \b6].postln;
		});
		Dial (28, { | val |
			val / 127 +>.vol \b6; [\vol, \b6].postln;
		});
		Dial (29, { | val |
			val / 127 +>.pos \b7; [\pos, \b7].postln;
		});
		Dial (30, { | val |
			val / 127 +>.x \b7; [\x, \b7].postln;
		});
		Dial (31, { | val |
			val / 127 +>.width \b7; [\width, \b7].postln;
		});
		Dial (32, { | val |
			val / 127 +>.vol \b7; [\vol, \b7].postln;
		});
	}

	*connectJLC {
		JLbutton (1, 1, { HasanSong.plain }, { \hasansong release: 3 });
		JLbutton (1, 2, { HasanSong.pospochthonio }, { \hasansong release: 3 });
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
		JLbutton (5, 2, { Levteris.dance }, { \ticklpos release: 3 });
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
		"([m1.m2.m3.m4]rm)([e1.e2.e3.e4]re)".arlink;
		/*
		"SETTING UP KUBUS".postln;
		{ | n |
			SF.kubus ++> format ("k%", n).asSymbol;
		} ! 8;
		SF.kubus ++> \bm;
		SF.kubus ++> \be;
		*/
		"------------------- READY TO GO !!!!!!! ---------------".postln;
	}

	*ma {
		
	}

	*eisitirio {
		
	}
}

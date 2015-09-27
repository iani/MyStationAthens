Scenes {
	*init {
		Server.local.options.numOutputBusChannels = 43;
		Server.local.boot;
		BufferList.loadFolder;
		MIDIIn.connectAll;
		// MIDIFunc trace: true;
		this.connectJLC;
		this.connectLivid;
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

	*connectLivid {
		KnobOn (1, { Eisitirio.intro; });  // knob col 1 row 1
		// KnobOff (1, { "just testing knob off".postln; });
		KnobOn (5, { Reza.start });       // col 2 row 1
		KnobOn (9, { HasanSong.plain });  // col 3 row 1
		KnobOn (10, { HasanSong.pv });    // col 3 row 2
		KnobOn (13, { Levteris.start });  // col 4 row 1
	}
}

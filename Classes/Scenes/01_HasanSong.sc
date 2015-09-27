HasanSong {
	*plain {
		"--- Starting Hasan Song: PLAIN".postln;
		this.volSlider (1, 1, \hasansong);
		// "hasansong(dalwk.amp)".arlink;
		'song4_hasan'.bufnum +>.buf \hasansong;
		1.0 +>.vol \hasansong;
		SF.playbufpan ++> \hasansong;
	}

	*volSlider { | row = 1, col = 1, splayer |
		JLslider (row, col, { | val |
			val = val / 127 * 2;
			val +>.vol splayer;
		});
	}
	
	*ypochthonio {
		// var a, b, c;
		this.volSlider (1, 1, \hasansong);
		0.2 +>.vol \hasansong;
		
		"/Users/iani/Library/Application Support/SuperCollider/Extensions/150921PerformigrationsOsmosisTransitions/Classes/Scenes/ypochthonio.scd".load;

		/*
		a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};
		
		{FreeVerb.ar((a++"9"++c).interpret)!2 * \fader0.kr(1) * 3 } ++> \hasansong;
		*/
	}

	*dalwlk {
		var x, b, sweepspec;
		sweepspec = ControlSpec (0.2, 30, 'exp');
		this.volSlider (1, 2, \dalwlk);
		JLslider (2, 1, { | val |
			val * 10 + 1 +>.pulse \dalwlk;
		});

		JLslider (2, 2, { | val |
			sweepspec.map (val / 127) +>.sweep \dalwlk;
		});

		JLbutton (1, 6, {
			3 +>.pulse \dalwk;
			4s +>.sweep \dalwk;
		}, {
			1000 +>.pulse \dalwk;		
		});
		
		OSCdef (\amp, { | msg |
			OF.send ([msg [0], msg [3]]);
			// msg.postln;
		}, '/amp').permanent = true;
		
		0 +>.vol \dalwlk;

		"hasansong.dalwlk".arlink;
		
		{ | vol = 1 pulse = 3 sweep = 4.1 |
			var src, amp;
			src = GVerb.ar(TGrains.ar(2, Pulse.ar(pulse),
				// Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),
				'song1'.bufnum,
				Sweep.ar(x=Pulse.ar(sweep)), x, Sweep.ar(x)
			)) * 10
			* vol;
			
			amp = Amplitude.kr (Mix.ar (*src));
			SendReply.kr (Impulse.kr (30), '/amp', amp + 0.5, -1);
			src;
		} ++> \dalwlk;

		
		/*
		{ | vol = 1 |
			var src;
			src = 10 * GVerb.ar(
				TGrains.ar(2, Pulse.ar(3),
					// Buffer.read(Server.default,Platform.resourceDir+/+"sounds/a11wlk01.wav"),
					'song1'.bufnum,
					Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x))
			);
			SendReply.kr (
				Impulse.kr (30), '/amp',
				[Amplitude.kr (src)],
				replyID: -1
			);
			src * vol;
		} ++> \dalwlk;
		*/
	}
	
	*bridge {
		"--- Starting Hasan Song: PV".postln;
		"(hasansong.pinkamp)".arlink;

		//	SF.magbelowpan ++> \pv;
		SF.magsmearpan ++> \pv;
		1 +>.wet \pinkamp;
		SF.pinkamppan ++> \pinkamp;
		
		'song4_hasan'.bufnum +>.buf \hasansong;
		0.2 +>.vol \hasansong;
		SF.playbuf ++> \hasansong;

		JLslider(1, 1, { | val |
			var scaled;
			scaled = val / 127;
			1 - scaled +>.wet 'pinkamp';
			// scaled + 0.5 +>.vol 'pv';
		});

		JLbutton (4, 3, {
			
		});

	}

	*pv {
		"--- Starting Hasan Song: PV".postln;
		"(hasansong.pv)".arlink;

		SF.magabovepan ++> \pv;
		
		'song4_hasan'.bufnum +>.buf \hasansong;
		0.2 +>.vol \hasansong;
		SF.playbuf ++> \hasansong;

		JLslider(2, 1, { | val |
			var scaled;
			scaled = val / 127;
			scaled * 100 +>.thresh 'pv';
			scaled + 0.5 +>.vol 'pv';
		});

		JLbutton (4, 3, {
			
		});

	}
	
}

/*

HasanSong.pv;
HasanSong.bridge;

2 +>.thresh \pv;

0.5 +>.rate \hasansong;

1 +>.wet \pinkamp;


*/
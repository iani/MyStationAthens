Eisitirio {
	*start {


		//: PlayBuf: Use envelope to stop. Startpos, dur, rate
		"--- EISITIRIO! ---".postln;
		this.introMIDI;

   		'eisitirio'.bufnum +>.buf '';
		0 +>.from 'eisagogi';
		1 +>.rate 'eisagogi';
		'eisitirio'.buf.duration * 1 +>.dur 'eisagogi';
		SF.playbuf ++> 'eisagogi';
	}

	*introMIDI {
		var rate = 1;
		var freqspec;
		freqspec = \freq.asSpec;
		ButtonOn (2, {
			rate = 'eisagogi'.get (\rate).postln;
			0 +>.rate 'eisagogi';
		});
		ButtonOff (2, {
			rate +>.rate 'eisagogi';
		});
		Dial (2, { | ... vals |
			vals.postln;
		})
	}

	*harmonies {
		var volspec, freqspec, qspec, ratespec, mulspec, lospec, hispec, panspec;
		"HARMONIES".postln;
		OSCdef (\pitchamp, { | msg |
			OF.send ([msg [0], freqspec.unmap (msg [3]), msg [4], msg [5]]);
			// msg.postln;
		}, '/pitchamp').permanent = true;

		volspec = \amp.asSpec;
		freqspec = \freq.asSpec;
		qspec = ControlSpec (0.00005, 1.0, 'exp');
		ratespec = ControlSpec (0.1, 50);
		mulspec = ControlSpec (1, 3);
		lospec = ControlSpec (0.5, 1);
		hispec = ControlSpec (1.0, 5.0);
		panspec = \pan.asSpec;

		JLslider (2, 1, { | val |    //////////////// AMP
			val = volspec.map (val / 127);
			val * 3 +>.vol \harmonies;
		});
		JLslider (2, 2, { | val | //////////////// FREQ
			val = freqspec.map (val / 127);
			val +>.freq \harmonies;
		});

		JLslider (2, 3, { | val | //////////////// FREQ
			val = ratespec.map (val / 127);
			val +>.rate \harmonies;
		});
		
		JLslider (2, 4, { | val | //////////////// Q
			val = qspec.map (val / 127);
			val +>.q \harmonies;
		});
 
		JLslider (2, 5, { | val | //////////////// frequency multiplier
			val = mulspec.map (val / 127);
			val +>.freqmul \harmonies;
		});

		JLslider (2, 6, { | val | //////////////// lo
			val = lospec.map (val / 127);
			val +>.lo \harmonies;
		});

		JLslider (2, 7, { | val | //////////////// hi
			val = hispec.map (val / 127);
			val +>.hi \harmonies;
		});

		JLslider (2, 8, { | val | //////////////// hi
			val = panspec.map (val / 127);
			val +>.pan \harmonies;
		});
		
		"(eisagogi[sendpitchamp.harmonies])(eisagogi2.harmonies2)".arlink;
		//"(eisagogi[harmonies.sendpitchamp])".arlink;
		'eisitirio'.bufnum +>.buf 'eisagogi';
		1 +>.rate 'eisagogi';
		1 +>.loop 'eisagogi';
		0.1 +>.rate 'harmonies';
		0.8 +>.lo 'harmonies';
		SF.resonzpanmod0 ++> 'harmonies';
		SF.playbuf ++> 'eisagogi';
		SF.sendpitchamp ++> \sendpitchamp;
	}

	*harmonies2 {
		var volspec, freqspec, qspec, ratespec, mulspec, lospec, hispec, panspec;
		"HARMONIES 2".postln;

		volspec = \amp.asSpec;
		freqspec = \freq.asSpec;
		qspec = ControlSpec (0.00005, 1.0, 'exp');
		ratespec = ControlSpec (0.1, 50);
		mulspec = ControlSpec (1, 3);
		lospec = ControlSpec (0.5, 1);
		hispec = ControlSpec (1.0, 5.0);
		panspec = \pan.asSpec;

		JLslider (2, 9, { | val |    //////////////// AMP
			val = volspec.map (val / 127);
			val * 3 +>.vol \harmonies2;
		});
		JLslider (2, 10, { | val | //////////////// FREQ
			val = freqspec.map (val / 127);
			val +>.freq \harmonies2;
		});

		JLslider (2, 11, { | val | //////////////// FREQ
			val = ratespec.map (val / 127);
			val +>.rate \harmonies2;
		});
		
		JLslider (2, 12, { | val | //////////////// Q
			val = qspec.map (val / 127);
			val +>.q \harmonies2;
		});
 
		JLslider (2, 13, { | val | //////////////// frequency multiplier
			val = mulspec.map (val / 127);
			val +>.freqmul \harmonies2;
		});

		JLslider (2, 14, { | val | //////////////// lo
			val = lospec.map (val / 127);
			val +>.lo \harmonies2;
		});

		JLslider (2, 15, { | val | //////////////// hi
			val = hispec.map (val / 127);
			val +>.hi \harmonies2;
		});

		JLslider (2, 16, { | val | //////////////// hi
			val = panspec.map (val / 127);
			val +>.pan \harmonies2;
		});
		
		"[(eisagogi[sendpitchamp.harmonies])]".arlink;
		//"(eisagogi[harmonies.sendpitchamp])".arlink;
		'eisitirio'.bufnum +>.buf 'eisagogi2';
		1 +>.rate 'eisagogi2';
		1 +>.loop 'eisagogi2';
		0.1 +>.rate 'harmonies2';
		0.8 +>.lo 'harmonies2';
		SF.resonzpanmod0 ++> 'harmonies2';
		SF.playbuf ++> 'eisagogi2';
		//		SF.sendpitchamp ++> \sendpitchamp;
	}

	*multi {
		/*
			Controls and params: 
			
			


		*/
		var volspec, freqspec, qspec, ratespec;
		volspec = \amp.asSpec;
		freqspec = \freq.asSpec;
		qspec = ControlSpec (0.1, 1.1, 0.0005, 1, \exp);
		ratespec = ControlSpec (0, 1, 0.2, 5);
		JLslider (2, 1, { | val |    //////////////// AMP
			val = volspec.map (val / 127);
			val * 3 +>.vol \harmonies;
		});
		JLslider (2, 2, { | val | //////////////// FREQ
			val = freqspec.map (val / 127);
			val +>.freq \harmonies;
		});
		/*
		JLslider (2, 3, { | val | //////////////// Q
			val = qspec.map (val / 127 + 0.1);
			val +>.q \harmonies;
		});
		*/
		/*
		JLslider (2, 4, { | val | //////////////// RATE
			val = ratespec.map (val / 127);
			val +>.rate \eisagogi;
		});
		*/
		"(eisagogi.harmonies)".arlink;
		'eisitirio'.bufnum +>.buf 'eisagogi';
		1 +>.rate 'eisagogi';
		SF.resonzpan ++> 'harmonies';
		SF.playbufpan ++> 'eisagogi';
	
	}
}

/*

\freq.asSpec.map(0);

0.3 +>.rate \eisagogi;
1 +>.rate \eisagogi;

0.001 +>.q \harmonies;
*/
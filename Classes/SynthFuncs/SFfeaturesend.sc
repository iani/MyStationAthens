+ SF {


	////////////////////////////////////////////////////////////////
	// Features
	////////////////////////////////////////////////////////////////

	*sendpitchamp {
		^{
			var in, amp, pitch, haspitch;
			in = Inp.ar;
			amp = Amplitude.kr (in);
			#pitch, haspitch = Pitch.kr (in);
			SendReply.kr (Impulse.kr (30), '/pitchamp',
				[pitch, haspitch, amp],
				replyID: -1
			) ;
			Silent.ar ()
		}
	}

	*sendamp {
		^{
			var in, amp;
			in = Inp.ar;
			amp = Amplitude.kr (in);
			SendReply.kr (Impulse.kr (30), '/amp',
				[amp],
				replyID: -1
			) ;
			Silent.ar ()
		}
	}
}

/*
'song1'.bufnum +>.buf \hasansong;
0.2 +>.vol \hasansong;
SF.playbuf ++> \hasansong;


SF.sendpitchamp ++> \test;

SF.sendamp ++> \amp;

SF.amp ++> \pv;
*/
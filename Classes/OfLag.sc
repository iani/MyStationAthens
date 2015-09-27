
OfLag {
	classvar <of;

	*initClass {
		of = NetAddr ("127.0.0.1", 12345);
	}

	*new { | param = 'lag' |
		var replyName;
		replyName = ("/" ++ param ++ 'val').asSymbol;

		{ | x = 0, y = 0, z = 0, lag = 0.5 |
			SendReply.kr (Impulse.kr (30), replyName, [
				Lag.kr (x, lag),
				Lag.kr (y, lag),
				Lag.kr (z, lag)
			], -1);
		} ++> param;

		OSCFunc ({ | val |
			"received from of".post; val.postln;
			val [1] +>.x param;
			val [2] +>.y param;
			val [3] +>.z param;
		}, param);

		OSCFunc ({ | val |
			postf ("Got smoothed reply for % of value %\n", replyName, val);
			of.sendMsg (param, *val [3..5]);
			// of.sendMsg (param, 1, 2, 3);
		}, replyName)


	}

	*setLag { | param = 'lag', lag = 0.5 |
		lag +>.lag (param ++ 'lag').asSymbol;
	}
}

/*

OfLag();

NetAddr.localAddr.sendMsg('lag', 1);

OSCFunc trace:false;

('asdf' ++ 'lag').asSymbol.asCompileString;



*/
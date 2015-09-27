+ SF {
 
	*panamp {
		^{ | pos = 0, vol = 1 |
			var src;
			src = Inp.ar;
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
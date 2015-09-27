+ SF {

	
	*magbelow {
		^{ | thresh = 0 vol = 1 |
			var in, chain;
			in = Inp.ar;
			chain = FFT(LocalBuf(2048), in);
			chain = PV_MagBelow(chain, thresh);
			IFFT(chain) * vol;
		}
	}

	*magbelowpan {
		^{ | thresh = 0 pos = 0 vol = 1 |
			var in, chain;
			in = Inp.ar;
			chain = FFT(LocalBuf(2048), in);
			chain = PV_MagBelow(chain, thresh);
			Pan2.ar (IFFT(chain), pos, vol);
		}
	}

	*magabovepan {
		^{ | thresh = 0 pos = 0 vol = 1 |
			var in, chain;
			in = Inp.ar;
			chain = FFT(LocalBuf(2048), in);
			chain = PV_MagAbove(chain, thresh);
			Pan2.ar (IFFT(chain), pos, vol);
		}
	}

	*magsmearpan {
		^{ | thresh = 0 pos = 0 vol = 1 |
			var in, chain;
			in = Inp.ar;
			chain = FFT(LocalBuf(2048), in);
			chain = PV_MagSmear(chain, thresh);
			Pan2.ar (IFFT(chain), pos, vol);
		} 
	}
}

/*
'song1'.bufnum +>.buf \hasansong;
0.2 +>.vol \hasansong;
SF.playbuf ++> \hasansong;


SF.amp ++> \pv;
*/
Ma {
	classvar <kMove;
	classvar <rMove;
	*start {
		"([m1.m2.m3.m4][rm1.rm2.rm3]pm1)".arlink;
		{ | vol = 0.5 pos = 0 width = 0.8 |
			var src;
			src = Mix (Resonz.ar (Inp.ar, 100 * [1, 1.2, 1.25, 1.8, 2, 3],
				XLine.kr (1, 0.0005, 30)))
			* XLine.kr (1, 15, 60);
			//	PanAz.ar (43, src * vol, pos, 1, width * 43 + 2);
			src;
		} ++> \rm1;
		{ | vol = 0.5 pos = 0 width = 0.8 |
			var src;
			src = Inp.ar;
			PanAz.ar (43, src * vol, Lag.kr (pos, 0.5), 1, width * 43 + 2);
		} ++> \pm1;
		
		\levteris_speaks.bufnum +>.buf \m1;
		273.8 +>.startPos \m1;
		1 +>.rate \m1;
		1 +>.loop \m1;
		SF.playbuf ++> \m1;

		3 +>.fadeTime \rm1;
		3 +>.fadeTime \rm2;
		3 +>.fadeTime \rm3;
		1 +>.fadeTime \pm1;		
	}

	*narrowKubus {
		{
			(1, 0.99 .. 0) do: { | i |
				i +>.width \pm1;
			}
		}.fork;
	}
	*kubusMove { | dt = 3 |
		if (kMove.notNil) { kMove.stop };
		kMove = {
			loop {
				-1.0.rrand(1.0) +>.pos \pm1;
				dt.next.wait;
			};
		}.fork;
	}
	*r1_150 {
		{ | vol = 1 |
			Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
			* vol * 10
		} ++> \rm1;
	}

	*r1_200 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 200 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
			* vol * 10
		} ++> \rm1;
	}
	*r1_250 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 250 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
			* vol * 10
		} ++> \rm1;
	}

	*r1_300 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 300 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
			* vol * 10
		} ++> \rm1;
	}

	*r1_1000 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 1000 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
			* vol * 10
		} ++> \rm1;
	}

	*r1_90 {{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 90 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0005))
			* vol * 10

	} ++> \rm1
	}
	//:
	*r1_50 {{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 50 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0005))
			* vol * 10

	} ++> \rm1
	}
	*r1_25 {
		//:
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 25 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0005))
			* vol * 10
			
		} ++> \rm1
	}

	*r1_25cluster {
		//:
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 25 * (1, 1.1 .. 3),
			0.0005))
			* vol * 2
			
		} ++> \rm1
	}

	*r1_250cluster {
		//:
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 250 * (1, 1.1 .. 3),
			0.0005))
			* vol * 2
			
		} ++> \rm1
	}

	*r1_1000cluster {
		//:
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 1000 * (1, 1.1 .. 3),
			0.0005))
			* vol * 2
			
		} ++> \rm1
	}

	*r1_2500cluster {
		//:
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 2500 * (1, 1.1 .. 3),
			0.0005))
			* vol * 2
			
		} ++> \rm1
	}

	*r1_2500gliss { | dur = 5 |
		//:
		{| vol = 1 |
			Mix (Resonz.ar (Inp.ar,

				XLine.kr (50, 2500, dur)

				* (1, 1.1 .. 3),
			0.0005))
			* vol * 2
		} ++> \rm1
	}

	*r1_rgliss { | dur = 5 |
		//:
		{| vol = 1 |
			Mix (Resonz.ar (Inp.ar,
				XLine.kr (50 rrand: 2500, 50 rrand: 2500, dur)
				* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0005))
			* vol * 10
		} ++> \rm1
	}

	*r1_noise0 { | lo = 100 hi = 120 rate = 20 |
		{| vol = 1 |
			Mix (Resonz.ar (Inp.ar,
				LFNoise0.kr (rate).range (lo, hi)
				* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0005))
			* vol * 10
		} ++> \rm1
	}

	*r1_noise1 { | lo = 100 hi = 120 rate = 20 |
		{| vol = 1 |
			Mix (Resonz.ar (Inp.ar,
				LFNoise1.kr (rate).range (lo, hi)
				* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0005))
			* vol * 10
		} ++> \rm1
	}
	
	*r1_0 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			// LFDNlise1.kr (1).range (0.0001, 1)
			0.1
			
		)) * 1
			
		} ++> \rm1;
	}



	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	*r2_150 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
			* vol * 10
		} ++> \rm2;
	}

	*r2_200 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 200 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
			* vol * 10
		} ++> \rm2;
	}
	*r2_250 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 250 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
			* vol * 10
		} ++> \rm2;
	}

	*r2_300 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 300 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
			* vol * 10
		} ++> \rm2;
	}

	*r2_1000 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 1000 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
			* vol * 10
		} ++> \rm2;
	}

	*r2_90 {{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 90 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0005))
			* vol * 10

	} ++> \rm2
	}
	//:
	*r2_50 {{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 50 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0005))
			* vol * 10

	} ++> \rm2
	}
	*r2_25 {
		//:
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 25 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0005))
			* vol * 10
			
		} ++> \rm2
	}

	*r2_25cluster {
		//:
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 25 * (1, 1.1 .. 3),
			0.0005))
			* vol * 10
			
		} ++> \rm2
	}

	*r2_250cluster {
		//:
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 250 * (1, 1.1 .. 3),
			0.0005))
			* vol * 10
			
		} ++> \rm2
	}

	*r2_1000cluster {
		//:
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 1000 * (1, 1.1 .. 3),
			0.0005))
			* vol * 10
			
		} ++> \rm2
	}

	*r2_2500cluster {
		//:
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 2500 * (1, 1.1 .. 3),
			0.0005))
			* vol * 10
			
		} ++> \rm2
	}

	*r2_0 {
		{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			// LFDNlise1.kr (1).range (0.0001, 1)
	 	0.1
			
		)) * 1
			
		} ++> \rm2;
	}
	

	
	*resMove {
		{
			[
				{
					
				}
			]
		}
	}
	
	
}
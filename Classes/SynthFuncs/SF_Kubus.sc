+ SF {
	*kubus {
		^{ | x = 0 y = 0 width = 0 vol = 1 ov = 0 o1 = 0 o2 = 0 o3 = 0 o4 = 0 |
			var source, vertical, ring1, ring2, ring3, ring4, ring5;
			source = Inp.ar;
			vertical = PanAz.ar(10, source, y * 0.8, vol, width * 8 + 2, ov);
			ring1 = PanAz.ar (14, vertical [0], x, 1, width * 18 + 2, o1);
			ring2 = PanAz.ar (14, vertical [1], x, 1, width * 18 + 2, o2);
			ring3 = PanAz.ar (8, vertical [2], x, 1, width * 12 + 2, o3);
			ring4 = PanAz.ar (6, vertical [3], x, 1, width * 10 + 2, o4);
			ring5 = vertical [4];
			Out.ar(0, ring1 * vol);
			Out.ar(14, ring2 * vol);
			Out.ar(28, ring3 * vol);
			Out.ar(36, ring4 * vol);
			Out.ar(42, ring5 * vol);
		}
	}
}
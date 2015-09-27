// LIVID - CODE

KnobOn {
	*new { | knobNum = 1 func |
		MIDIFunc.noteOn (func, knobNum, 0).permanent = true;
	}
}

KnobOff {
	*new { | knobNum = 1 func |
		MIDIFunc.noteOff (func, knobNum, 0).permanent = true;
	}
}

ButtonOn {
	*new { | knobNum = 1 func |
		KnobOn (knobNum + 32, func);
	}
}

ButtonOff {
	*new { | knobNum = 1 func |
		KnobOff (knobNum + 32, func);
	}
}

Dial {
	*new { | knobNum = 1 func |
		MIDIFunc.cc (func, knobNum, 0).permanent = true;
	}
}

// JL Cooper

JLbutton {
	classvar chans, nums;

	*initClass {
		chans = [14, 13, 13].dup.flat;
		nums = [(48..68), (112..127), (48..127), (33..47), (96..111), (32..47)];
	}
	
	*new { | col = 1 row = 1, onFunc, offFunc |
		col = col - 1;
		row = row - 1;
		/*
		postf ("JL button set for col: % row: %, which is num %, chan %\n",
			col, row, nums [row] [col], chans [row]
		);
		*/
		MIDIFunc.cc (
			{ | val |
				postf ("JLbutton received val: %\n", val);
				if (val == 127) { onFunc.value; } { offFunc.value; }
			},
			nums [row] [col],
			chans [row]
		).permanent = true;
	}
}

JLslider {
	classvar chans, nums;
	*initClass {
		chans = [15, 15];
		nums = [(16..31), (0..15)];
	}

	*new { | row = 1 col = 1, func |
		col = col - 1;
		row = row - 1;
		MIDIFunc.cc (func,
			nums [row] [col].postln,
			chans [row].postln
		).permanent = true;
	}
}

/*
JLbutton(4, 1, { | ... args | args.postln; });
MIDIFunc trace: true;

32 sliders, in 2 rows of 16 sliders each

1. Top row: Control (CC), channel 15, nums 16-31
2. Bottom row: Control (CC), channel 15, nums 0-15

JLslider(2, 1, { | val | val.postln; });

*/
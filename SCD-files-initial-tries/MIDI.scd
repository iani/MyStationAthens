MIDIIn.connectAll;

MIDIFunc trace: true;
/*
cc (func, ccNum, chan, srcID, argTemplate, dispatcher)
*/

//:
Dial(4, { | val |
	var scaled;
	scaled = val / 127;
	scaled +>.thresh 'pv'
})

//:

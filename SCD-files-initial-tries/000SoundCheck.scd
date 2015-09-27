
{ SinOsc.ar ([400, 500], 0, SinOsc.kr (0.1, [0, pi / 2], 0.1)) } ++> 'soundCheck';

//:

{ SinOsc.ar ([400, 500], 0, SinOsc.kr ([0.4, 0.05], [0, pi / 2], 0.1)) } ++> 'soundCheck';

//:

{ PinkNoise.ar (SinOsc.kr ([2 0.05], [0, pi / 2], 0.1)) } ++> 'soundCheck';
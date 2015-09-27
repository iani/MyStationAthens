Server.default.prepareForRecord;
//:
Server.default.record;
//:
Server.default.stopRecording;

//: Sound check:
////////////////////////////////////////////////////////////////

{ WhiteNoise.ar (Decay2.kr (Impulse.kr (10))) * 0.1 } ++> \soundcheck;


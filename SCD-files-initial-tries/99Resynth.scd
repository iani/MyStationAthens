// Adapted from Rogovos

"(playbuf3.b1f)".arlink;
//:

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = Inp.ar;
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / 4, 1), 0.1) * 0.01;
	resynth;
} +> \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = Inp.ar;
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / [4, 5], 1), 0.1) * 0.01;
	Mix (resynth);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = Inp.ar;
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / [4, 5, 6], 1), 0.1) * 0.04;
	Mix (resynth);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = Inp.ar;
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 1), 0.1) * 0.04;
	Mix (resynth);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = Inp.ar;
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid + LFNoise0.kr(1).range(100, 2000) / [4, 5, 6, 7], 1), 0.1) * 0.01;
	Mix (resynth);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = Inp.ar;
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid + LFNoise0.kr(01).range(100, 2000) / [4, 5, 6, 7], 10), 0.1) * 0.01;
	Mix (resynth);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = Inp.ar;
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 10) + LFNoise0.kr(10).range(100, 2000), 0.1) * 0.01;
	pan = PanAz.kr(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24, pan);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = Inp.ar;
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 10) + LFNoise0.kr(10).range(10, 200), 0.1) * 0.01;
	pan = PanAz.kr(4, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24 + 8, pan * 0.05);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = Inp.ar;
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 10) + LFNoise0.kr(10).range(10, 200), 0.1) * 0.01;
	Mix (resynth);
	/*
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24, pan * 0.45);
	*/
} => \b1f;

//:

//:
Help.gui;
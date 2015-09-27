

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};
{ | vol = 1 | FreeVerb.ar((a++"9"++c).interpret)!2 * \fader0.kr(1) * 2 * vol } ++> \hasansong;

/*

"/Users/iani/Library/Application Support/SuperCollider/Extensions/150921PerformigrationsOsmosisTransitions/Classes/Scenes/ypochthonio.scd".load;
*/
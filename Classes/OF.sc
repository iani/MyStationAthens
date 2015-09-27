OF {
	classvar addr;

	*initClass {
		addr = NetAddr ("192.168.0.2", 57120);
	}

	*send { | message |
		addr.sendMsg (*message)
	}
}

/*

NetAddr("192.168.0.2", 57120).sendMsg('/test');

OF.send(['/test']);



*/
//	@file Version: 1.0
//	@file Name: createWaitCondition.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 26/1/2013 15:19
//	@file Args: seconds

if(!isServer) exitwith { };

private["_startTime", "_running", "_currTime"];

_startTime = floor(time);
_running = true;

while { _running } do {
	_currTime = floor(time);
	if(_currTime - _startTime >= _this) then {
		_running = false;
	};

	sleep 1;
};

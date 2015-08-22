_player = _this select 0;
_pos = _this select 1;
_dir = _this select 2;

_player setPos [_pos select 0, _pos select 1, _pos select 2]; // Stop the player appearing on the ground for a split second before the HALO
_vel = velocity _player;
_speed = 1;
_player setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)];

[_player, _pos select 2] spawn bis_fnc_halo;

[] spawn spawnInfoText;

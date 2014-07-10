	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2013 Nicolas BOITEUX

	iniDBI TOOLS - save & restore all markers on the map
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	private ["_time"];

	// save markers each 10 seconds
	_time = 60;

	call compile preProcessFile "\inidbi\init.sqf";

	iniDB_save_markers = {
		private ["_globalmarkers", "_idx"];
		_globalmarkers  = [];
		_idx = 0;
		{
			_globalmarkers = _globalmarkers + [format["mrkidx%1", _idx]];
			_garbage = ["iniDBI", format["mrkidx%1", _idx], "type", getmarkerType _x] call iniDB_write;
			_garbage = ["iniDBI", format["mrkidx%1", _idx], "alpha", markerAlpha _x] call iniDB_write;
			_garbage = ["iniDBI", format["mrkidx%1", _idx], "brush", markerBrush _x] call iniDB_write;
			_garbage = ["iniDBI", format["mrkidx%1", _idx], "color", getmarkerColor _x] call iniDB_write;
			_garbage = ["iniDBI", format["mrkidx%1", _idx], "dir", markerDir _x] call iniDB_write;
			_garbage = ["iniDBI", format["mrkidx%1", _idx], "pos", markerPos _x] call iniDB_write;
			_garbage = ["iniDBI", format["mrkidx%1", _idx], "shape", markerShape _x] call iniDB_write;
			_garbage = ["iniDBI", format["mrkidx%1", _idx], "size", markerSize _x] call iniDB_write;
			_garbage = ["iniDBI", format["mrkidx%1", _idx], "text", markertext _x] call iniDB_write;
			_idx = _idx + 1;
		}foreach allMapMarkers;
		_garbage = ["iniDBI", "Markers", "globalmarkers", _globalmarkers] call iniDB_write;
	};

	iniDB_restore_markers = {
		private ["_alpha", "_brush", "_color", "_dir", "_globalmarkers", "_marker", "_pos", "_shape", "_size", "_text", "_type"];
		_globalmarkers = ["iniDBI", "Markers", "globalmarkers", "ARRAY"] call iniDB_read;
		{
			_type = ["iniDBI", _x, "type", "STRING"] call iniDB_read;
			_alpha = ["iniDBI", _x, "alpha", "SCALAR"] call iniDB_read;
			_brush = ["iniDBI", _x, "brush", "STRING"] call iniDB_read;
			_color = ["iniDBI", _x, "color", "STRING"] call iniDB_read;
			_dir = ["iniDBI", _x, "dir", "SCALAR"] call iniDB_read;
			_pos = ["iniDBI", _x, "pos", "ARRAY"] call iniDB_read;
			_shape = ["iniDBI", _x, "shape", "STRING"] call iniDB_read;
			_size = ["iniDBI", _x, "size", "ARRAY"] call iniDB_read;
			_text = ["iniDBI", _x, "text", "STRING"] call iniDB_read;
			_marker = createMarker [_x, _pos];
			_marker setmarkertype _type;
			_marker setmarkersize _size;
			_marker setmarkeralpha _alpha;
			_marker setmarkerbrush _brush;
			_marker setmarkercolor _color;
			_marker setmarkerdir _dir;
			_marker setmarkershape _shape;
			_marker setmarkertext _text;
		}foreach _globalmarkers;
	};
	
	[] call iniDB_restore_markers;

	while { true } do {
		[] call iniDB_save_markers;
		hint format["%1", count allMapMarkers];
		sleep _time;
	};
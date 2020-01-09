unit rtmidi;
{$mode objfpc}{$H+}

interface

	const
{$ifdef WINDOWS}
		rtmidilib = 'rtmidi.dll'; // MSVC
{$else}
	{$ifdef DARWIN}
	{$else}
		rtmidilib = 'librtmidi.so';
	{$endif}
{$endif}

	const
		RTMIDI_API_UNSPECIFIED = 0;
		RTMIDI_API_MACOSX_CORE = 1;
		RTMIDI_API_LINUX_ALSA = 2;
		RTMIDI_API_UNIX_JACK = 3;
		RTMIDI_API_WINDOWS_MM = 4;
		RTMIDI_API_RTMIDI_DUMMY = 5;
		RTMIDI_API_NUM = 6;

		RTMIDI_ERROR_WARNING = 0;
		RTMIDI_ERROR_DEBUG_WARNING = 1;
		RTMIDI_ERROR_UNSPECIFIED = 2;
		RTMIDI_ERROR_NO_DEVICES_FOUND = 3;
		RTMIDI_ERROR_INVALID_DEVICE = 4;
		RTMIDI_ERROR_MEMORY_ERROR = 5;
		RTMIDI_ERROR_INVALID_PARAMETER = 6;
		RTMIDI_ERROR_INVALID_USE = 7;
		RTMIDI_ERROR_DRIVER_ERROR = 8;
		RTMIDI_ERROR_SYSTEM_ERROR = 9;
		RTMIDI_ERROR_THREAD_ERROR = 10;

	type
		RtMidiApi = longint;
		RtMidiErrorType = longint;

		RtMidiPtr = ^RtMidiWrapper;
		RtMidiInPtr = ^RtMidiWrapper;
		RtMidiOutPtr = ^RtMidiWrapper;
		RtMidiWrapper = record
			ptr: pointer;
			data: pointer;
			ok: boolean;
			msg: pchar;
		end;

		RtMidiCCallback = function(timeStamp: double; const message: pchar; messageSize: sizeuint;
			userData: pointer): pointer;
		
	function rtmidi_get_compiled_api(apis: plongint; apis_size: longword): longint; cdecl; external rtmidilib;
	function rtmidi_api_name(api: RtMidiApi): pchar; cdecl; external rtmidilib;
	function rtmidi_api_display_name(api: RtMidiApi): pchar; cdecl; external rtmidilib;
	function rtmidi_compiled_api_by_name(const name: pchar): RtMidiApi; cdecl; external rtmidilib;
	procedure rtmidi_error(kind: RtMidiErrorType; const errorString: pchar); cdecl; external rtmidilib;
	procedure rtmidi_open_port(device: RtMidiPtr; portNumber: longword; const portName: pchar); cdecl; external rtmidilib;
	procedure rtmidi_open_virtual_port(device: RtMidiPtr; const portName: pchar); cdecl; external rtmidilib;
	procedure rtmidi_close_port(device: RtMidiPtr); cdecl; external rtmidilib;
	function rtmidi_get_port_count(device: RtMidiPtr): longword; cdecl; external rtmidilib;
	function rtmidi_get_port_name(device: RtMidiPtr; portNumber: longword): pchar; cdecl; external rtmidilib;
	function rtmidi_in_create_default: RtMidiInPtr; cdecl; external rtmidilib;
	function rtmidi_in_create(api: RtMidiApi; const clientName: pchar; queueSizeLimit: longword): RtMidiInPtr; cdecl; external rtmidilib;
	procedure rtmidi_in_free(device: RtMidiInPtr); cdecl; external rtmidilib;
	function rtmidi_in_get_current_api(device: RtMidiPtr): RtMidiApi; cdecl; external rtmidilib;
	procedure rtmidi_in_set_callback(device: RtMidiInPtr; callback: RtMidiCCallback; userData: pointer); cdecl; external rtmidilib;
	procedure rtmidi_in_cancel_callback(device: RtMidiInPtr); cdecl; external rtmidilib;
	procedure rtmidi_in_ignore_types(device: RtMidiInPtr; midiSysex, midiTime, midiSense: boolean); cdecl; external rtmidilib;
	function rtmidi_in_get_message(device: RtMidiInPtr; message: pbyte; size: psizeuint): double; cdecl; external rtmidilib;
	function rtmidi_out_create_default: RtMidiOutPtr; cdecl; external rtmidilib;
	function rtmidi_out_create(api: RtMidiApi; const clientName: pchar; queueSizeLimit: longword): RtMidiOutPtr; cdecl; external rtmidilib;
	procedure rtmidi_out_free(device: RtMidiOutPtr); cdecl; external rtmidilib;
	function rtmidi_out_get_current_api(device: RtMidiPtr): RtMidiApi; cdecl; external rtmidilib;
	function rtmidi_out_send_message(device: RtMidiPtr; const message: pbyte; length: longint): longint; cdecl; external rtmidilib;

implementation

end.

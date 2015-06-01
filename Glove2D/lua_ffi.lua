if not jit.os == "Windows" then return end


ffi.cdef "int SDL_SetHint(const char *name, const char *value);"

ffi.cdef[[
		void Sleep(int ms);
		int poll(struct pollfd *fds, unsigned long nfds, int timeout);
	]]

ffi.load( 'User32.dll' )





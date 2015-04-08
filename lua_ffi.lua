ffi.cdef "int SDL_SetHint(const char *name, const char *value);"

ffi.cdef[[
		void Sleep(int ms);
		int poll(struct pollfd *fds, unsigned long nfds, int timeout);
	]]
		

ffi.cdef("void* malloc(size_t size); void free(void* ptr);") -- wow


ffi.load( 'User32.dll' )




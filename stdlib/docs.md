# STD lib :

_STD_STRLEN(const char\* buffer) -> rax: int

_STD_PRINTLN(const char\* buffer) -> void

_STD_SUBSTR(const char\* buffer, const int start, const int to) -> rax: const char\*

_STD_EXIT(const int exit_code) -> void

# STD I/O lib :

_STD_IO_OUT(const char\* buffer) -> void

_STD_IO_IN(const int buffer_size) -> rax: const char\*

# STD stream lib :

_STD_STREAM_OPEN(const char\* buffer_path, const int flags, const int octal_permissions) -> rax: const char\* (fd || error)

_STD_STREAM_CREATE(const char\* buffer_path, const int octal_permissions) -> rax: const char\* (fd || error)

_STD_STREAM_WRITE(const char\* fd, const char* buffer) -> void

_STD_STREAM_CLOSE(const char\* fd) -> void
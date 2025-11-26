find_package(PkgConfig REQUIRED)
pkg_check_modules(PC_LIBZIP QUIET libzip)

# Headers
find_path(LIBZIP_INCLUDE_DIR_ZIP
    NAMES zip.h
    HINTS ${PC_LIBZIP_INCLUDE_DIRS}
    PATHS /usr/include
)

find_path(LIBZIP_INCLUDE_DIR_ZIPCONF
    NAMES zipconf.h
    HINTS ${PC_LIBZIP_INCLUDE_DIRS}
    PATHS /usr/include
)

# Library
find_library(LIBZIP_LIBRARY
    NAMES zip
    HINTS ${PC_LIBZIP_LIBRARY_DIRS}
    PATHS /usr/lib/aarch64-linux-gnu /usr/lib /usr/local/lib
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    LIBZIP DEFAULT_MSG
    LIBZIP_LIBRARY LIBZIP_INCLUDE_DIR_ZIP LIBZIP_INCLUDE_DIR_ZIPCONF
)

mark_as_advanced(LIBZIP_LIBRARY LIBZIP_INCLUDE_DIR_ZIP LIBZIP_INCLUDE_DIR_ZIPCONF)

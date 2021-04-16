#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "batch" for configuration "Release"
set_property(TARGET batch APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(batch PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/usr/lib/x86_64-linux-gnu/libpthread.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libbatch.so"
  IMPORTED_SONAME_RELEASE "libbatch.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS batch )
list(APPEND _IMPORT_CHECK_FILES_FOR_batch "${_IMPORT_PREFIX}/lib/libbatch.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

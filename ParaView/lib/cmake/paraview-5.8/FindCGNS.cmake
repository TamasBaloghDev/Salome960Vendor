#
# Find the native CGNS includes and library
#
# CGNS_INCLUDE_DIR - where to find cgns.h, etc.
# CGNS_LIBRARIES   - List of fully qualified libraries to link against when using CGNS.
# CGNS_FOUND       - Do not attempt to use CGNS if "no" or undefined.

SET(CGNS_ROOT_DIR $ENV{CGNS_ROOT_DIR} CACHE PATH "Path to the CGNS.")
IF(CGNS_ROOT_DIR)
  LIST(APPEND CMAKE_PREFIX_PATH "${CGNS_ROOT_DIR}")
ENDIF(CGNS_ROOT_DIR)

find_path(CGNS_INCLUDE_DIR
  NAMES
    cgnslib.h
  PATHS
    /usr/local/include
    /usr/include
  DOC "CGNS include directory")
mark_as_advanced(CGNS_INCLUDE_DIR)

find_library(CGNS_LIBRARY
  NAMES
    cgns
  DOC "CGNS library")
mark_as_advanced(CGNS_LIBRARY)

if (CGNS_INCLUDE_DIR)
  file(STRINGS "${CGNS_INCLUDE_DIR}/cgnslib.h" version
    REGEX "CGNS_DOTVERS")
  string(REGEX REPLACE ".*CGNS_DOTVERS *\([0-9.]*\).*" "\\1" CGNS_VERSION "${version}")
  unset(version)
else ()
  set(CGNS_VERSION CGNS_VERSION-NOTFOUND)
endif ()

# handle the QUIETLY and REQUIRED arguments and set CGNS_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CGNS
  REQUIRED_VARS CGNS_INCLUDE_DIR CGNS_LIBRARY
  VERSION_VAR CGNS_VERSION)

if (CGNS_FOUND)
  set(CGNS_LIBRARIES "${CGNS_LIBRARY}")
  set(CGNS_INCLUDE_DIRS "${CGNS_INCLUDE_DIR}")
  if (NOT TARGET CGNS::CGNS)
    add_library(CGNS::CGNS UNKNOWN IMPORTED)
    set_target_properties(CGNS::CGNS PROPERTIES
      IMPORTED_LOCATION "${CGNS_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${CGNS_INCLUDE_DIR}")
  endif ()
endif ()

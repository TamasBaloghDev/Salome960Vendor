## ======================================================================== ##
## Copyright 2009-2019 Intel Corporation                                    ##
##                                                                          ##
## Licensed under the Apache License, Version 2.0 (the "License");          ##
## you may not use this file except in compliance with the License.         ##
## You may obtain a copy of the License at                                  ##
##                                                                          ##
##     http://www.apache.org/licenses/LICENSE-2.0                           ##
##                                                                          ##
## Unless required by applicable law or agreed to in writing, software      ##
## distributed under the License is distributed on an "AS IS" BASIS,        ##
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. ##
## See the License for the specific language governing permissions and      ##
## limitations under the License.                                           ##
## ======================================================================== ##

# Called if we failed to find OSPRay or any of it's required dependencies,
# unsets all public (designed to be used externally) variables and reports
# error message at priority depending upon [REQUIRED/QUIET/<NONE>] argument.
macro(ospray_report_not_found REASON_MSG)
  unset(OSPRAY_FOUND)
  unset(OSPRAY_INCLUDE_DIRS)
  unset(OSPRAY_LIBRARIES)

  # Reset the CMake module path to its state when this script was called.
  set(CMAKE_MODULE_PATH ${CALLERS_CMAKE_MODULE_PATH})

  # Note <package>_FIND_[REQUIRED/QUIETLY] variables defined by FindPackage()
  # use the camelcase library name, not uppercase.
  if (OSPRAY_FIND_QUIETLY)
    set(MSG_TYPE STATUS)
  elseif(OSPRAY_FIND_REQUIRED)
    set(MSG_TYPE FATAL_ERROR)
  else()
    # Neither QUIETLY nor REQUIRED, use SEND_ERROR which emits an error
    # that prevents generation, but continues configuration.
   set(MSG_TYPE SEND_ERROR)
  endif()
  message(${MSG_TYPE} "Failed to find OSPRay - " ${REASON_MSG} ${ARGN})
  return()
endmacro()

###############################################################################
# Attempt to find OSPRay

# Get the (current, i.e. installed) directory containing this file.
set(CURRENT_CONFIG_INSTALL_DIR ${CMAKE_CURRENT_LIST_DIR})

# Record the state of the CMake module path when this script was called so
# that we can ensure that we leave it in the same state on exit as it was
# on entry, but modify it locally.
set(OSPRAY_CALLERS_CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})

# Reset CMake module path to the installation directory of this script,
# thus we will use the FindPackage() scripts shipped with OSPRay to find
# OSPRay's dependencies, even if the user has equivalently named FindPackage()
# scripts in their project.
set(CMAKE_MODULE_PATH ${CURRENT_CONFIG_INSTALL_DIR})

# Build the absolute root install directory as a relative path (determined when
# OSPRay was configured & built) from the current install directory for this
# this file. This allows for the install tree to be relocated, after OSPRay
# was built, outside of CMake.
get_filename_component(CURRENT_ROOT_INSTALL_DIR
  ${CURRENT_CONFIG_INSTALL_DIR}/../../../ ABSOLUTE
)

if (NOT EXISTS ${CURRENT_ROOT_INSTALL_DIR})
  ospray_report_not_found(
    "OSPRay install root: ${CURRENT_ROOT_INSTALL_DIR}, "
    "determined from relative path from osprayConfig.cmake install location:  "
    "${CURRENT_CONFIG_INSTALL_DIR}, does not exist.  Either the install "
    "directory was deleted, or the install tree was only partially relocated "
    "outside of CMake after OSPRay was built.")
endif()

set(OSPRAY_ROOT ${CURRENT_ROOT_INSTALL_DIR})

# Set the include directories for OSPRay (itself).
set(OSPRAY_INCLUDE_DIR "${OSPRAY_ROOT}/include")
if (NOT EXISTS ${OSPRAY_INCLUDE_DIR}/ospray/version.h)
  OSPRAY_REPORT_NOT_FOUND(
    "OSPRay install root:  ${OSPRAY_ROOT}, "
    "determined from relative path from osprayConfg.cmake install location:  "
    "${CURRENT_CONFIG_INSTALL_DIR}, does not contain OSPRay headers. "
    "Either the install directory was deleted, or the install tree was only "
    "partially relocated outside of CMake after OSPRay was built.")
endif()

# Append the include directories for all (potentially optional) dependencies
# with which OSPRay was compiled, the libraries themselves come in via
# osprayTargets-<release/debug>.cmake as link libraries for ospray target.
set(OSPRAY_INCLUDE_DIRS
  ${OSPRAY_INCLUDE_DIR}
  ${OSPRAY_INCLUDE_DIR}/ospray
  ${OSPRAY_INCLUDE_DIR}/ospray/SDK
)

###############################################################################
# OSPRay build configuration

set(OSPRAY_VERSION   1.8.4)
set(OSPRAY_SOVERSION 0)

set(OSPRAY_INSTALL_DEPENDENCIES OFF)

set(OSPRAY_BUILD_DEBUG          FALSE)
set(OSPRAY_BUILD_RELWITHDEBINFO FALSE)
set(OSPRAY_BUILD_RELEASE        TRUE)

set(OSPRAY_COMPILER_ICC   FALSE)
set(OSPRAY_COMPILER_GCC   FALSE)
set(OSPRAY_COMPILER_CLANG TRUE)
set(OSPRAY_COMPILER_MSVC  FALSE)

set(OSPRAY_TASKING_SYSTEM      TBB)

set(OSPRAY_TASKING_TBB         TRUE)
set(OSPRAY_TASKING_CILK        FALSE)
set(OSPRAY_TASKING_OPENMP      FALSE)
set(OSPRAY_TASKING_INTERNAL    FALSE)
set(OSPRAY_TASKING_LIBDISPATCH FALSE)
set(OSPRAY_TASKING_DEBUG       FALSE)

set(OSPRAY_TASKING_DEFINITIONS -DOSPRAY_TASKING_TBB)
set(OSPRAY_TASKING_OPTIONS     )

set(OSPRAY_ISPC_TARGET_LIST    sse4;avx;avx2;avx512skx-i32x16)
set(OSPRAY_ISPC_ADDRESSING     32)
set(OSPRAY_MPI_ENABLED         )

set(OSPRAY_TILE_SIZE      64)
set(OSPRAY_PIXELS_PER_JOB 64)

set(EMBREE_VERSION_REQUIRED 3.2.0)

###############################################################################
# OSPRay dependencies

# Save state
set(OSPRAY_CMAKE_CURRENT_LIST_DIR     ${CMAKE_CURRENT_LIST_DIR})
set(OSPRAY_CURRENT_CONFIG_INSTALL_DIR ${CURRENT_CONFIG_INSTALL_DIR})
set(OSPRAY_CURRENT_ROOT_INSTALL_DIR   ${CURRENT_ROOT_INSTALL_DIR})

# Setup library path vars
if (WIN32)
  set(LIBRARY_PATH_PREFIX ${OSPRAY_ROOT}/lib/${CMAKE_IMPORT_LIBRARY_PREFIX})
  set(LIBRARY_SUFFIX ${CMAKE_IMPORT_LIBRARY_SUFFIX})
else()
  set(LIBRARY_PATH_PREFIX ${OSPRAY_ROOT}/lib/${CMAKE_SHARED_LIBRARY_PREFIX})
  set(LIBRARY_SUFFIX ${CMAKE_SHARED_LIBRARY_SUFFIX})
endif()

# Include macros for finding embree
include(ospray_macros)

# NOTE(jda) - Here is where find_package(...) is automatically called for
#             any OSPRay dependencies. A list of libs should be constructed
#             and added to the OSPRAY_LIBRARIES variable below.

# Re-create tasking library target

if (OSPRAY_TASKING_TBB)
  if (OSPRAY_INSTALL_DEPENDENCIES)
    # TBB installed with OSPRay
    file(GLOB_RECURSE TBB_LIBRARIES ${LIBRARY_PATH_PREFIX}tbb*)
  else()
    # Find tbb
    find_package(TBB)
    if (":${TBB_LIBRARY}" STREQUAL ":")
      message(FATAL_ERROR "Missing required OSPRay dependency "
        "TBB, please set TBB_ROOT to the root of your TBB install.")
    else()
      message(STATUS
              "Found required OSPRay dependency: TBB in ${TBB_INCLUDE_DIRS}")
    endif()
  endif()
  set (OSPRAY_TASKING_LIBS ${TBB_LIBRARIES})
endif()

ospray_create_tasking_target()

# Embree
if (OSPRAY_INSTALL_DEPENDENCIES)
  # Embree installed with OSPRay
  file(GLOB_RECURSE EMBREE_LIBRARY ${LIBRARY_PATH_PREFIX}embree*)
else()
  # Find existing Embree on the machine
  ospray_find_embree(${EMBREE_VERSION_REQUIRED})
  ospray_verify_embree_features()
endif()

ospray_create_embree_target()

list(APPEND OSPRAY_INCLUDE_DIRS ${EMBREE_INCLUDE_DIRS})

# Restore state
set(CMAKE_CURRENT_LIST_DIR     ${OSPRAY_CMAKE_CURRENT_LIST_DIR})
set(CURRENT_CONFIG_INSTALL_DIR ${OSPRAY_CURRENT_CONFIG_INSTALL_DIR})
set(CURRENT_ROOT_INSTALL_DIR   ${OSPRAY_CURRENT_ROOT_INSTALL_DIR})


###############################################################################
# Finish OSPRay

# Remove duplicate entries from OSPRAY_INCLUDE_DIRS
list(REMOVE_DUPLICATES OSPRAY_INCLUDE_DIRS)

set(OSPRAY_LIBRARY ${LIBRARY_PATH_PREFIX}ospray${LIBRARY_SUFFIX})
set(OSPRAY_ISPC_DEVICE_LIBRARY ${LIBRARY_PATH_PREFIX}ospray_module_ispc${LIBRARY_SUFFIX})
set(OSPRAY_COMMON_LIBRARY ${LIBRARY_PATH_PREFIX}ospray_common${LIBRARY_SUFFIX})
set(OSPRAY_TESTING_LIBRARY ${LIBRARY_PATH_PREFIX}ospray_testing${LIBRARY_SUFFIX})

# Include target exports
include(${CMAKE_CURRENT_LIST_DIR}/ospray_Exports.cmake)

# Add missing targets to libraries
set_target_properties(ospray::ospray_common PROPERTIES
  INTERFACE_LINK_LIBRARIES ospray_tasking)
set_target_properties(ospray::ospray_module_ispc PROPERTIES
  INTERFACE_LINK_LIBRARIES embree)

# Set expected OSPRAY_LIBRARIES variable for FindPackage().
set(OSPRAY_LIBRARIES ospray::ospray)

if(OSPRAY_MPI_ENABLED)
  set(OSPRAY_MPI_LIBRARIES ospray::ospray_mpi_common ospray::ospray_mpi_maml)
endif()

set(OSPRAY_SG_LIBRARIES ospray::ospray_sg)

# Reset CMake module path to its state when this script was called.
set(CMAKE_MODULE_PATH ${OSPRAY_CALLERS_CMAKE_MODULE_PATH})

set(OSPRAY_CMAKE_ROOT ${OSPRAY_ROOT}/lib/cmake/ospray-1.8.4)

# Include definitions for clients to use ospray header files
set(OSPRAY_USE_FILE ${OSPRAY_CMAKE_ROOT}/osprayUse.cmake)

# OSPRAY_REPORT_NOT_FOUND() aborts, so if we made it this far,
# we have found ospray and all required dependencies.
include(FindPackageMessage)
find_package_MESSAGE(ospray "Found OSPRay: ${OSPRAY_LIBRARY}"
  "[${OSPRAY_INCLUDE_DIRS}]")

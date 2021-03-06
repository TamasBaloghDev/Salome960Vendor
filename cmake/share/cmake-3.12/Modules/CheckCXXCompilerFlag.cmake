# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#[=======================================================================[.rst:
CheckCXXCompilerFlag
------------------------

Check whether the CXX compiler supports a given flag.

.. command:: check_cxx_compiler_flag

  ::

    check_cxx_compiler_flag(<flag> <var>)

  Check that the ``<flag>`` is accepted by the compiler without
  a diagnostic.  Stores the result in an internal cache entry
  named ``<var>``.

This command temporarily sets the ``CMAKE_REQUIRED_DEFINITIONS`` variable
and calls the ``check_cxx_source_compiles`` macro from the
:module:`CheckCXXSourceCompiles` module.  See documentation of that
module for a listing of variables that can otherwise modify the build.

A positive result from this check indicates only that the compiler did not
issue a diagnostic message when given the flag.  Whether the flag has any
effect or even a specific one is beyond the scope of this module.

.. note::
  Since the :command:`try_compile` command forwards flags from variables
  like :variable:`CMAKE_CXX_FLAGS <CMAKE_<LANG>_FLAGS>`, unknown flags
  in such variables may cause a false negative for this check.
#]=======================================================================]

include_guard(GLOBAL)
include(CheckCXXSourceCompiles)
include(CMakeCheckCompilerFlagCommonPatterns)

macro (CHECK_CXX_COMPILER_FLAG _FLAG _RESULT)
   set(SAFE_CMAKE_REQUIRED_DEFINITIONS "${CMAKE_REQUIRED_DEFINITIONS}")
   set(CMAKE_REQUIRED_DEFINITIONS "${_FLAG}")

   # Normalize locale during test compilation.
   set(_CheckCXXCompilerFlag_LOCALE_VARS LC_ALL LC_MESSAGES LANG)
   foreach(v ${_CheckCXXCompilerFlag_LOCALE_VARS})
     if("$ENV{${v}}")
       set(_CheckCXXCompilerFlag_SAVED_${v} "$ENV{${v}}")
       set(ENV{${v}} C)
     endif()
   endforeach()
   CHECK_COMPILER_FLAG_COMMON_PATTERNS(_CheckCXXCompilerFlag_COMMON_PATTERNS)
   CHECK_CXX_SOURCE_COMPILES("int main() { return 0; }" ${_RESULT}
     # Some compilers do not fail with a bad flag
     FAIL_REGEX "command line option .* is valid for .* but not for C\\\\+\\\\+" # GNU
     ${_CheckCXXCompilerFlag_COMMON_PATTERNS}
     )
   foreach(v ${_CheckCXXCompilerFlag_LOCALE_VARS})
     if("${_CheckCXXCompilerFlag_SAVED_${v}}")
       set(ENV{${v}} ${_CheckCXXCompilerFlag_SAVED_${v}})
       unset(_CheckCXXCompilerFlag_SAVED_${v})
     endif()
   endforeach()
   unset(_CheckCXXCompilerFlag_LOCALE_VARS)
   unset(_CheckCXXCompilerFlag_COMMON_PATTERNS)

   set (CMAKE_REQUIRED_DEFINITIONS "${SAFE_CMAKE_REQUIRED_DEFINITIONS}")
endmacro ()


set(_vtk_module_find_package_quiet)
if (${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
  set(_vtk_module_find_package_quiet QUIET)
endif ()

set(_vtk_module_find_package_components_checked)
set(_vtk_module_find_package_components_to_check
  ${${CMAKE_FIND_PACKAGE_NAME}_FIND_COMPONENTS})
set(_vtk_module_find_package_components)
set(_vtk_module_find_package_components_required)
while (_vtk_module_find_package_components_to_check)
  list(GET _vtk_module_find_package_components_to_check 0 _vtk_module_component)
  list(REMOVE_AT _vtk_module_find_package_components_to_check 0)
  if (_vtk_module_component IN_LIST _vtk_module_find_package_components_checked)
    continue ()
  endif ()
  list(APPEND _vtk_module_find_package_components_checked
    "${_vtk_module_component}")

  list(APPEND _vtk_module_find_package_components
    "${_vtk_module_component}")
  if (${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED_${_vtk_module_component})
    list(APPEND _vtk_module_find_package_components_required
      "${_vtk_module_component}")
  endif ()

  if (TARGET "${CMAKE_FIND_PACKAGE_NAME}::${_vtk_module_component}")
    set(_vtk_module_find_package_component_target "${CMAKE_FIND_PACKAGE_NAME}::${_vtk_module_component}")
  elseif (TARGET "${_vtk_module_component}")
    set(_vtk_module_find_package_component_target "${_vtk_module_component}")
  else ()
    # No such target for the component; skip.
    continue ()
  endif ()
  get_property(_vtk_module_find_package_depends
    TARGET    "${_vtk_module_find_package_component_target}"
    PROPERTY  "INTERFACE_vtk_module_depends")
  string(REPLACE "${CMAKE_FIND_PACKAGE_NAME}::" "" _vtk_module_find_package_depends "${_vtk_module_find_package_depends}")
  list(APPEND _vtk_module_find_package_components_to_check
    ${_vtk_module_find_package_depends})
  get_property(_vtk_module_find_package_depends
    TARGET    "${_vtk_module_find_package_component_target}"
    PROPERTY  "INTERFACE_vtk_module_private_depends")
  string(REPLACE "${CMAKE_FIND_PACKAGE_NAME}::" "" _vtk_module_find_package_depends "${_vtk_module_find_package_depends}")
  list(APPEND _vtk_module_find_package_components_to_check
    ${_vtk_module_find_package_depends})
  get_property(_vtk_module_find_package_depends
    TARGET    "${_vtk_module_find_package_component_target}"
    PROPERTY  "INTERFACE_vtk_module_optional_depends")
  foreach (_vtk_module_find_package_depend IN LISTS _vtk_module_find_package_depends)
    if (TARGET "${_vtk_module_find_package_depend}")
      string(REPLACE "${CMAKE_FIND_PACKAGE_NAME}::" "" _vtk_module_find_package_depend "${_vtk_module_find_package_depend}")
      list(APPEND _vtk_module_find_package_components_to_check
        "${_vtk_module_find_package_depend}")
    endif ()
  endforeach ()

  get_property(_vtk_module_find_package_kit
    TARGET    "${_vtk_module_find_package_component_target}"
    PROPERTY  "INTERFACE_vtk_module_kit")
  if (_vtk_module_find_package_kit)
    get_property(_vtk_module_find_package_kit_modules
      TARGET    "${_vtk_module_find_package_kit}"
      PROPERTY  "INTERFACE_vtk_kit_kit_modules")
    string(REPLACE "${CMAKE_FIND_PACKAGE_NAME}::" "" _vtk_module_find_package_kit_modules "${_vtk_module_find_package_kit_modules}")
    list(APPEND _vtk_module_find_package_components_to_check
      ${_vtk_module_find_package_kit_modules})
  endif ()
endwhile ()
unset(_vtk_module_find_package_component_target)
unset(_vtk_module_find_package_components_to_check)
unset(_vtk_module_find_package_components_checked)
unset(_vtk_module_component)
unset(_vtk_module_find_package_depend)
unset(_vtk_module_find_package_depends)
unset(_vtk_module_find_package_kit)
unset(_vtk_module_find_package_kit_modules)

if (_vtk_module_find_package_components)
  list(REMOVE_DUPLICATES _vtk_module_find_package_components)
endif ()
if (_vtk_module_find_package_components_required)
  list(REMOVE_DUPLICATES _vtk_module_find_package_components_required)
endif ()

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("loguru" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("loguru" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(Threads
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          
    OPTIONAL_COMPONENTS )
  if (NOT Threads_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Threads")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_loguru_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_loguru_NOT_FOUND_MESSAGE"
      "Failed to find the Threads package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("RenderingRayTracing" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("RenderingRayTracing" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(ospray
    1.8
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          
    OPTIONAL_COMPONENTS )
  if (NOT ospray_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: ospray")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_RenderingRayTracing_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_RenderingRayTracing_NOT_FOUND_MESSAGE"
      "Failed to find the ospray package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("libxml2" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("libxml2" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(LibXml2
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          
    OPTIONAL_COMPONENTS )
  if (NOT LibXml2_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: LibXml2")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_libxml2_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_libxml2_NOT_FOUND_MESSAGE"
      "Failed to find the LibXml2 package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("hdf5" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("hdf5" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(HDF5
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          C;HL
    OPTIONAL_COMPONENTS )
  if (NOT HDF5_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: HDF5")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_hdf5_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_hdf5_NOT_FOUND_MESSAGE"
      "Failed to find the HDF5 package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("GUISupportQt" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("GUISupportQt" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(Qt5
    5.9
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          Widgets;X11Extras
    OPTIONAL_COMPONENTS )
  if (NOT Qt5_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Qt5")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_GUISupportQt_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_GUISupportQt_NOT_FOUND_MESSAGE"
      "Failed to find the Qt5 package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("Python" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("Python" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(Python3
    3.6
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          Development
    OPTIONAL_COMPONENTS )
  if (NOT Python3_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Python3")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_Python_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_Python_NOT_FOUND_MESSAGE"
      "Failed to find the Python3 package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("RenderingOpenGL2" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("RenderingOpenGL2" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(X11
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          Xt
    OPTIONAL_COMPONENTS )
  if (NOT X11_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: X11")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_RenderingOpenGL2_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_RenderingOpenGL2_NOT_FOUND_MESSAGE"
      "Failed to find the X11 package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("opengl" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("opengl" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(OpenGL
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          OpenGL
    OPTIONAL_COMPONENTS GLX)
  if (NOT OpenGL_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: OpenGL")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_opengl_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_opengl_NOT_FOUND_MESSAGE"
      "Failed to find the OpenGL package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("freetype" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("freetype" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(Freetype
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          
    OPTIONAL_COMPONENTS )
  if (NOT Freetype_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Freetype")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_freetype_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_freetype_NOT_FOUND_MESSAGE"
      "Failed to find the Freetype package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("CommonSystem" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("CommonSystem" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(Threads
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          
    OPTIONAL_COMPONENTS )
  if (NOT Threads_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Threads")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_CommonSystem_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_CommonSystem_NOT_FOUND_MESSAGE"
      "Failed to find the Threads package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("CommonCore" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("CommonCore" IN_LIST _vtk_module_find_package_components_required)
      set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
      set(_vtk_module_find_package_fail_if_not_found ON)
    endif ()
  endif ()
else ()
  set(_vtk_module_find_package_enabled ON)
  set(_vtk_module_find_package_is_required "${${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED}")
  set(_vtk_module_find_package_fail_if_not_found ON)
endif ()

if (_vtk_module_find_package_enabled)
  set(_vtk_module_find_package_required)
  if (_vtk_module_find_package_is_required)
    set(_vtk_module_find_package_required REQUIRED)
  endif ()

  find_package(Threads
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          
    OPTIONAL_COMPONENTS )
  if (NOT Threads_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Threads")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_CommonCore_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_CommonCore_NOT_FOUND_MESSAGE"
      "Failed to find the Threads package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

unset(_vtk_module_find_package_components)
unset(_vtk_module_find_package_components_required)
unset(_vtk_module_find_package_quiet)

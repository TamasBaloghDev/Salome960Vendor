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
  if ("cgns" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("cgns" IN_LIST _vtk_module_find_package_components_required)
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

  find_package(CGNS
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          
    OPTIONAL_COMPONENTS )
  if (NOT CGNS_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: CGNS")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_cgns_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_cgns_NOT_FOUND_MESSAGE"
      "Failed to find the CGNS package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

set(_vtk_module_find_package_enabled OFF)
set(_vtk_module_find_package_is_required OFF)
set(_vtk_module_find_package_fail_if_not_found OFF)
if (_vtk_module_find_package_components)
  if ("pqPython" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("pqPython" IN_LIST _vtk_module_find_package_components_required)
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
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          Widgets
    OPTIONAL_COMPONENTS )
  if (NOT Qt5_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Qt5")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_pqPython_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_pqPython_NOT_FOUND_MESSAGE"
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
  if ("pqApplicationComponents" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("pqApplicationComponents" IN_LIST _vtk_module_find_package_components_required)
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
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          Widgets;Svg;Help
    OPTIONAL_COMPONENTS )
  if (NOT Qt5_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Qt5")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_pqApplicationComponents_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_pqApplicationComponents_NOT_FOUND_MESSAGE"
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
  if ("pqComponents" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("pqComponents" IN_LIST _vtk_module_find_package_components_required)
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
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          Network;Widgets
    OPTIONAL_COMPONENTS )
  if (NOT Qt5_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Qt5")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_pqComponents_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_pqComponents_NOT_FOUND_MESSAGE"
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
  if ("pqCore" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("pqCore" IN_LIST _vtk_module_find_package_components_required)
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
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          Widgets;Help
    OPTIONAL_COMPONENTS )
  if (NOT Qt5_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Qt5")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_pqCore_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_pqCore_NOT_FOUND_MESSAGE"
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
  if ("pqWidgets" IN_LIST _vtk_module_find_package_components)
    set(_vtk_module_find_package_enabled ON)
    if ("pqWidgets" IN_LIST _vtk_module_find_package_components_required)
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
    
    
    
    ${_vtk_module_find_package_quiet}
    ${_vtk_module_find_package_required}
    COMPONENTS          Core;Gui;Network;Widgets;Help
    OPTIONAL_COMPONENTS )
  if (NOT Qt5_FOUND AND _vtk_module_find_package_fail_if_not_found)
    if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
      message(STATUS
        "Could not find the ${CMAKE_FIND_PACKAGE_NAME} package due to a "
        "missing dependency: Qt5")
    endif ()
    set("${CMAKE_FIND_PACKAGE_NAME}_pqWidgets_FOUND" 0)
    list(APPEND "${CMAKE_FIND_PACKAGE_NAME}_pqWidgets_NOT_FOUND_MESSAGE"
      "Failed to find the Qt5 package.")
  endif ()
endif ()

unset(_vtk_module_find_package_fail_if_not_found)
unset(_vtk_module_find_package_enabled)
unset(_vtk_module_find_package_required)

unset(_vtk_module_find_package_components)
unset(_vtk_module_find_package_components_required)
unset(_vtk_module_find_package_quiet)

#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "vtkm_cont" for configuration "Release"
set_property(TARGET vtkm_cont APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(vtkm_cont PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libvtkm_cont-pv5.8.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS vtkm_cont )
list(APPEND _IMPORT_CHECK_FILES_FOR_vtkm_cont "${_IMPORT_PREFIX}/lib/libvtkm_cont-pv5.8.a" )

# Import target "vtkm_worklet" for configuration "Release"
set_property(TARGET vtkm_worklet APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(vtkm_worklet PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libvtkm_worklet-pv5.8.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS vtkm_worklet )
list(APPEND _IMPORT_CHECK_FILES_FOR_vtkm_worklet "${_IMPORT_PREFIX}/lib/libvtkm_worklet-pv5.8.a" )

# Import target "vtkm_filter" for configuration "Release"
set_property(TARGET vtkm_filter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(vtkm_filter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libvtkm_filter-pv5.8.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS vtkm_filter )
list(APPEND _IMPORT_CHECK_FILES_FOR_vtkm_filter "${_IMPORT_PREFIX}/lib/libvtkm_filter-pv5.8.a" )

# Import target "vtkm_source" for configuration "Release"
set_property(TARGET vtkm_source APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(vtkm_source PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libvtkm_source-pv5.8.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS vtkm_source )
list(APPEND _IMPORT_CHECK_FILES_FOR_vtkm_source "${_IMPORT_PREFIX}/lib/libvtkm_source-pv5.8.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

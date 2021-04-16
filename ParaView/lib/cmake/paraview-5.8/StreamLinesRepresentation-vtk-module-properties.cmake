set(_vtk_module_import_prefix "${CMAKE_CURRENT_LIST_DIR}")
get_filename_component(_vtk_module_import_prefix "${_vtk_module_import_prefix}" DIRECTORY)
get_filename_component(_vtk_module_import_prefix "${_vtk_module_import_prefix}" DIRECTORY)
get_filename_component(_vtk_module_import_prefix "${_vtk_module_import_prefix}" DIRECTORY)
set_property(TARGET "StreamLinesRepresentation::vtkStreamLines" PROPERTY "INTERFACE_vtk_module_exclude_wrap" "FALSE")
set_property(TARGET "StreamLinesRepresentation::vtkStreamLines" PROPERTY "INTERFACE_vtk_module_depends" "ParaView::RemotingViews;ParaView::VTKExtensionsMisc;VTK::CommonCore;VTK::RenderingCore")
set_property(TARGET "StreamLinesRepresentation::vtkStreamLines" PROPERTY "INTERFACE_vtk_module_private_depends" "ParaView::VTKExtensionsFiltersRendering;VTK::CommonCore;VTK::CommonDataModel;VTK::CommonExecutionModel;VTK::CommonMath;VTK::CommonTransforms;VTK::RenderingCore;VTK::RenderingOpenGL2;VTK::glew;VTK::opengl")
set_property(TARGET "StreamLinesRepresentation::vtkStreamLines" PROPERTY "INTERFACE_vtk_module_optional_depends" "")
set_property(TARGET "StreamLinesRepresentation::vtkStreamLines" PROPERTY "INTERFACE_vtk_module_implements" "")
set_property(TARGET "StreamLinesRepresentation::vtkStreamLines" PROPERTY "INTERFACE_vtk_module_implementable" "FALSE")
set_property(TARGET "StreamLinesRepresentation::vtkStreamLines" PROPERTY "INTERFACE_vtk_module_library_name" "vtkStreamLines")
set_property(TARGET "StreamLinesRepresentation::vtkStreamLines" PROPERTY "INTERFACE_vtk_module_headers" "${_vtk_module_import_prefix}/include/paraview-5.8/ParaView_paraview_plugins/vtkStreamLinesMapper.h;${_vtk_module_import_prefix}/include/paraview-5.8/ParaView_paraview_plugins/vtkStreamLinesRepresentation.h;${_vtk_module_import_prefix}/include/paraview-5.8/ParaView_paraview_plugins/vtkStreamLinesModule.h")
set_property(TARGET "StreamLinesRepresentation::vtkStreamLines" PROPERTY "INTERFACE_vtk_module_hierarchy" "${_vtk_module_import_prefix}/lib/paraview-5.8/plugins/StreamLinesRepresentation/vtk/hierarchy/StreamLinesRepresentation/vtkStreamLines-hierarchy.txt")
unset(_vtk_module_import_prefix)

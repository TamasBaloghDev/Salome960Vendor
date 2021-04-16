set(_vtk_module_import_prefix "${CMAKE_CURRENT_LIST_DIR}")
get_filename_component(_vtk_module_import_prefix "${_vtk_module_import_prefix}" DIRECTORY)
get_filename_component(_vtk_module_import_prefix "${_vtk_module_import_prefix}" DIRECTORY)
get_filename_component(_vtk_module_import_prefix "${_vtk_module_import_prefix}" DIRECTORY)
set_property(TARGET "ExplicitStructuredGrid::vtkExplicitStructuredGrid" PROPERTY "INTERFACE_vtk_module_exclude_wrap" "FALSE")
set_property(TARGET "ExplicitStructuredGrid::vtkExplicitStructuredGrid" PROPERTY "INTERFACE_vtk_module_depends" "VTK::CommonExecutionModel;VTK::FiltersCore")
set_property(TARGET "ExplicitStructuredGrid::vtkExplicitStructuredGrid" PROPERTY "INTERFACE_vtk_module_private_depends" "VTK::CommonDataModel;VTK::CommonCore;VTK::ParallelCore")
set_property(TARGET "ExplicitStructuredGrid::vtkExplicitStructuredGrid" PROPERTY "INTERFACE_vtk_module_optional_depends" "VTK::Python;VTK::WrappingPythonCore;VTK::PythonInterpreter")
set_property(TARGET "ExplicitStructuredGrid::vtkExplicitStructuredGrid" PROPERTY "INTERFACE_vtk_module_implements" "")
set_property(TARGET "ExplicitStructuredGrid::vtkExplicitStructuredGrid" PROPERTY "INTERFACE_vtk_module_implementable" "FALSE")
set_property(TARGET "ExplicitStructuredGrid::vtkExplicitStructuredGrid" PROPERTY "INTERFACE_vtk_module_library_name" "vtkExplicitStructuredGrid")
set_property(TARGET "ExplicitStructuredGrid::vtkExplicitStructuredGrid" PROPERTY "INTERFACE_vtk_module_headers" "${_vtk_module_import_prefix}/include/paraview-5.8/ParaView_paraview_plugins/vtkExplicitStructuredGridGeneratorSource.h;${_vtk_module_import_prefix}/include/paraview-5.8/ParaView_paraview_plugins/vtkExplicitStructuredGridPythonExtractor.h;${_vtk_module_import_prefix}/include/paraview-5.8/ParaView_paraview_plugins/vtkExplicitStructuredGridModule.h")
set_property(TARGET "ExplicitStructuredGrid::vtkExplicitStructuredGrid" PROPERTY "INTERFACE_vtk_module_hierarchy" "${_vtk_module_import_prefix}/lib/paraview-5.8/plugins/ExplicitStructuredGrid/vtk/hierarchy/ExplicitStructuredGrid/vtkExplicitStructuredGrid-hierarchy.txt")
unset(_vtk_module_import_prefix)

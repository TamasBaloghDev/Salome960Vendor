set(_vtk_module_import_prefix "${CMAKE_CURRENT_LIST_DIR}")
get_filename_component(_vtk_module_import_prefix "${_vtk_module_import_prefix}" DIRECTORY)
get_filename_component(_vtk_module_import_prefix "${_vtk_module_import_prefix}" DIRECTORY)
get_filename_component(_vtk_module_import_prefix "${_vtk_module_import_prefix}" DIRECTORY)
set_property(TARGET "NonOrthogonalSource::vtkNonOrthogonalSources" PROPERTY "INTERFACE_vtk_module_exclude_wrap" "FALSE")
set_property(TARGET "NonOrthogonalSource::vtkNonOrthogonalSources" PROPERTY "INTERFACE_vtk_module_depends" "VTK::CommonExecutionModel")
set_property(TARGET "NonOrthogonalSource::vtkNonOrthogonalSources" PROPERTY "INTERFACE_vtk_module_private_depends" "ParaView::VTKExtensionsMisc;VTK::CommonCore;VTK::CommonDataModel;VTK::CommonMath;VTK::CommonTransforms;VTK::FiltersGeneral;VTK::ImagingCore")
set_property(TARGET "NonOrthogonalSource::vtkNonOrthogonalSources" PROPERTY "INTERFACE_vtk_module_optional_depends" "")
set_property(TARGET "NonOrthogonalSource::vtkNonOrthogonalSources" PROPERTY "INTERFACE_vtk_module_implements" "")
set_property(TARGET "NonOrthogonalSource::vtkNonOrthogonalSources" PROPERTY "INTERFACE_vtk_module_implementable" "FALSE")
set_property(TARGET "NonOrthogonalSource::vtkNonOrthogonalSources" PROPERTY "INTERFACE_vtk_module_library_name" "vtkNonOrthogonalSources")
set_property(TARGET "NonOrthogonalSource::vtkNonOrthogonalSources" PROPERTY "INTERFACE_vtk_module_headers" "${_vtk_module_import_prefix}/include/paraview-5.8/ParaView_paraview_plugins/vtkShearedWaveletSource.h;${_vtk_module_import_prefix}/include/paraview-5.8/ParaView_paraview_plugins/vtkNonOrthogonalSourcesModule.h")
set_property(TARGET "NonOrthogonalSource::vtkNonOrthogonalSources" PROPERTY "INTERFACE_vtk_module_hierarchy" "${_vtk_module_import_prefix}/lib/paraview-5.8/plugins/NonOrthogonalSource/vtk/hierarchy/NonOrthogonalSource/vtkNonOrthogonalSources-hierarchy.txt")
unset(_vtk_module_import_prefix)

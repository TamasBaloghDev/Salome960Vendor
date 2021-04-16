
#ifndef VTKPVVTKEXTENSIONSCGNSREADER_EXPORT_H
#define VTKPVVTKEXTENSIONSCGNSREADER_EXPORT_H

#ifdef VTKPVVTKEXTENSIONSCGNSREADER_STATIC_DEFINE
#  define VTKPVVTKEXTENSIONSCGNSREADER_EXPORT
#  define VTKPVVTKEXTENSIONSCGNSREADER_NO_EXPORT
#else
#  ifndef VTKPVVTKEXTENSIONSCGNSREADER_EXPORT
#    ifdef VTKExtensionsCGNSReader_EXPORTS
        /* We are building this library */
#      define VTKPVVTKEXTENSIONSCGNSREADER_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKPVVTKEXTENSIONSCGNSREADER_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKPVVTKEXTENSIONSCGNSREADER_NO_EXPORT
#    define VTKPVVTKEXTENSIONSCGNSREADER_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKPVVTKEXTENSIONSCGNSREADER_DEPRECATED
#  define VTKPVVTKEXTENSIONSCGNSREADER_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKPVVTKEXTENSIONSCGNSREADER_DEPRECATED_EXPORT
#  define VTKPVVTKEXTENSIONSCGNSREADER_DEPRECATED_EXPORT VTKPVVTKEXTENSIONSCGNSREADER_EXPORT VTKPVVTKEXTENSIONSCGNSREADER_DEPRECATED
#endif

#ifndef VTKPVVTKEXTENSIONSCGNSREADER_DEPRECATED_NO_EXPORT
#  define VTKPVVTKEXTENSIONSCGNSREADER_DEPRECATED_NO_EXPORT VTKPVVTKEXTENSIONSCGNSREADER_NO_EXPORT VTKPVVTKEXTENSIONSCGNSREADER_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKPVVTKEXTENSIONSCGNSREADER_NO_DEPRECATED
#    define VTKPVVTKEXTENSIONSCGNSREADER_NO_DEPRECATED
#  endif
#endif

#endif /* VTKPVVTKEXTENSIONSCGNSREADER_EXPORT_H */

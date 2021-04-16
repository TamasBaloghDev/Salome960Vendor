
#ifndef VTKPVVTKEXTENSIONSIOSPCTH_EXPORT_H
#define VTKPVVTKEXTENSIONSIOSPCTH_EXPORT_H

#ifdef VTKPVVTKEXTENSIONSIOSPCTH_STATIC_DEFINE
#  define VTKPVVTKEXTENSIONSIOSPCTH_EXPORT
#  define VTKPVVTKEXTENSIONSIOSPCTH_NO_EXPORT
#else
#  ifndef VTKPVVTKEXTENSIONSIOSPCTH_EXPORT
#    ifdef VTKExtensionsIOSPCTH_EXPORTS
        /* We are building this library */
#      define VTKPVVTKEXTENSIONSIOSPCTH_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKPVVTKEXTENSIONSIOSPCTH_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKPVVTKEXTENSIONSIOSPCTH_NO_EXPORT
#    define VTKPVVTKEXTENSIONSIOSPCTH_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKPVVTKEXTENSIONSIOSPCTH_DEPRECATED
#  define VTKPVVTKEXTENSIONSIOSPCTH_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKPVVTKEXTENSIONSIOSPCTH_DEPRECATED_EXPORT
#  define VTKPVVTKEXTENSIONSIOSPCTH_DEPRECATED_EXPORT VTKPVVTKEXTENSIONSIOSPCTH_EXPORT VTKPVVTKEXTENSIONSIOSPCTH_DEPRECATED
#endif

#ifndef VTKPVVTKEXTENSIONSIOSPCTH_DEPRECATED_NO_EXPORT
#  define VTKPVVTKEXTENSIONSIOSPCTH_DEPRECATED_NO_EXPORT VTKPVVTKEXTENSIONSIOSPCTH_NO_EXPORT VTKPVVTKEXTENSIONSIOSPCTH_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKPVVTKEXTENSIONSIOSPCTH_NO_DEPRECATED
#    define VTKPVVTKEXTENSIONSIOSPCTH_NO_DEPRECATED
#  endif
#endif

#endif /* VTKPVVTKEXTENSIONSIOSPCTH_EXPORT_H */

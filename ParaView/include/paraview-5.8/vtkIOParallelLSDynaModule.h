
#ifndef VTKIOPARALLELLSDYNA_EXPORT_H
#define VTKIOPARALLELLSDYNA_EXPORT_H

#ifdef VTKIOPARALLELLSDYNA_STATIC_DEFINE
#  define VTKIOPARALLELLSDYNA_EXPORT
#  define VTKIOPARALLELLSDYNA_NO_EXPORT
#else
#  ifndef VTKIOPARALLELLSDYNA_EXPORT
#    ifdef IOParallelLSDyna_EXPORTS
        /* We are building this library */
#      define VTKIOPARALLELLSDYNA_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOPARALLELLSDYNA_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOPARALLELLSDYNA_NO_EXPORT
#    define VTKIOPARALLELLSDYNA_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOPARALLELLSDYNA_DEPRECATED
#  define VTKIOPARALLELLSDYNA_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOPARALLELLSDYNA_DEPRECATED_EXPORT
#  define VTKIOPARALLELLSDYNA_DEPRECATED_EXPORT VTKIOPARALLELLSDYNA_EXPORT VTKIOPARALLELLSDYNA_DEPRECATED
#endif

#ifndef VTKIOPARALLELLSDYNA_DEPRECATED_NO_EXPORT
#  define VTKIOPARALLELLSDYNA_DEPRECATED_NO_EXPORT VTKIOPARALLELLSDYNA_NO_EXPORT VTKIOPARALLELLSDYNA_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOPARALLELLSDYNA_NO_DEPRECATED
#    define VTKIOPARALLELLSDYNA_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOPARALLELLSDYNA_EXPORT_H */

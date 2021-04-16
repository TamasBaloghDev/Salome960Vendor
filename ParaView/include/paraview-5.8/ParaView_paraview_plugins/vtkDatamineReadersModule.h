
#ifndef VTKDATAMINEREADERS_EXPORT_H
#define VTKDATAMINEREADERS_EXPORT_H

#ifdef VTKDATAMINEREADERS_STATIC_DEFINE
#  define VTKDATAMINEREADERS_EXPORT
#  define VTKDATAMINEREADERS_NO_EXPORT
#else
#  ifndef VTKDATAMINEREADERS_EXPORT
#    ifdef DatamineReaders_EXPORTS
        /* We are building this library */
#      define VTKDATAMINEREADERS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKDATAMINEREADERS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKDATAMINEREADERS_NO_EXPORT
#    define VTKDATAMINEREADERS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKDATAMINEREADERS_DEPRECATED
#  define VTKDATAMINEREADERS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKDATAMINEREADERS_DEPRECATED_EXPORT
#  define VTKDATAMINEREADERS_DEPRECATED_EXPORT VTKDATAMINEREADERS_EXPORT VTKDATAMINEREADERS_DEPRECATED
#endif

#ifndef VTKDATAMINEREADERS_DEPRECATED_NO_EXPORT
#  define VTKDATAMINEREADERS_DEPRECATED_NO_EXPORT VTKDATAMINEREADERS_NO_EXPORT VTKDATAMINEREADERS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKDATAMINEREADERS_NO_DEPRECATED
#    define VTKDATAMINEREADERS_NO_DEPRECATED
#  endif
#endif

#endif /* VTKDATAMINEREADERS_EXPORT_H */

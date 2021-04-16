
#ifndef VTKPVCLIENTWEB_EXPORT_H
#define VTKPVCLIENTWEB_EXPORT_H

#ifdef VTKPVCLIENTWEB_STATIC_DEFINE
#  define VTKPVCLIENTWEB_EXPORT
#  define VTKPVCLIENTWEB_NO_EXPORT
#else
#  ifndef VTKPVCLIENTWEB_EXPORT
#    ifdef ClientsWeb_EXPORTS
        /* We are building this library */
#      define VTKPVCLIENTWEB_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKPVCLIENTWEB_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKPVCLIENTWEB_NO_EXPORT
#    define VTKPVCLIENTWEB_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKPVCLIENTWEB_DEPRECATED
#  define VTKPVCLIENTWEB_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKPVCLIENTWEB_DEPRECATED_EXPORT
#  define VTKPVCLIENTWEB_DEPRECATED_EXPORT VTKPVCLIENTWEB_EXPORT VTKPVCLIENTWEB_DEPRECATED
#endif

#ifndef VTKPVCLIENTWEB_DEPRECATED_NO_EXPORT
#  define VTKPVCLIENTWEB_DEPRECATED_NO_EXPORT VTKPVCLIENTWEB_NO_EXPORT VTKPVCLIENTWEB_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKPVCLIENTWEB_NO_DEPRECATED
#    define VTKPVCLIENTWEB_NO_DEPRECATED
#  endif
#endif

#endif /* VTKPVCLIENTWEB_EXPORT_H */

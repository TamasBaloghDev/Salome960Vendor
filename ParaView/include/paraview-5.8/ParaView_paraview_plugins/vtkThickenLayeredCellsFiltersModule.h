
#ifndef VTKTHICKENLAYEREDCELLSFILTERS_EXPORT_H
#define VTKTHICKENLAYEREDCELLSFILTERS_EXPORT_H

#ifdef VTKTHICKENLAYEREDCELLSFILTERS_STATIC_DEFINE
#  define VTKTHICKENLAYEREDCELLSFILTERS_EXPORT
#  define VTKTHICKENLAYEREDCELLSFILTERS_NO_EXPORT
#else
#  ifndef VTKTHICKENLAYEREDCELLSFILTERS_EXPORT
#    ifdef vtkThickenLayeredCellsFilters_EXPORTS
        /* We are building this library */
#      define VTKTHICKENLAYEREDCELLSFILTERS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKTHICKENLAYEREDCELLSFILTERS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKTHICKENLAYEREDCELLSFILTERS_NO_EXPORT
#    define VTKTHICKENLAYEREDCELLSFILTERS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKTHICKENLAYEREDCELLSFILTERS_DEPRECATED
#  define VTKTHICKENLAYEREDCELLSFILTERS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKTHICKENLAYEREDCELLSFILTERS_DEPRECATED_EXPORT
#  define VTKTHICKENLAYEREDCELLSFILTERS_DEPRECATED_EXPORT VTKTHICKENLAYEREDCELLSFILTERS_EXPORT VTKTHICKENLAYEREDCELLSFILTERS_DEPRECATED
#endif

#ifndef VTKTHICKENLAYEREDCELLSFILTERS_DEPRECATED_NO_EXPORT
#  define VTKTHICKENLAYEREDCELLSFILTERS_DEPRECATED_NO_EXPORT VTKTHICKENLAYEREDCELLSFILTERS_NO_EXPORT VTKTHICKENLAYEREDCELLSFILTERS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKTHICKENLAYEREDCELLSFILTERS_NO_DEPRECATED
#    define VTKTHICKENLAYEREDCELLSFILTERS_NO_DEPRECATED
#  endif
#endif

#endif /* VTKTHICKENLAYEREDCELLSFILTERS_EXPORT_H */
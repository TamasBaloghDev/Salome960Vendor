
#ifndef VTKPANORAMICPROJECTIONVIEWS_EXPORT_H
#define VTKPANORAMICPROJECTIONVIEWS_EXPORT_H

#ifdef VTKPANORAMICPROJECTIONVIEWS_STATIC_DEFINE
#  define VTKPANORAMICPROJECTIONVIEWS_EXPORT
#  define VTKPANORAMICPROJECTIONVIEWS_NO_EXPORT
#else
#  ifndef VTKPANORAMICPROJECTIONVIEWS_EXPORT
#    ifdef vtkPanoramicProjectionViews_EXPORTS
        /* We are building this library */
#      define VTKPANORAMICPROJECTIONVIEWS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKPANORAMICPROJECTIONVIEWS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKPANORAMICPROJECTIONVIEWS_NO_EXPORT
#    define VTKPANORAMICPROJECTIONVIEWS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKPANORAMICPROJECTIONVIEWS_DEPRECATED
#  define VTKPANORAMICPROJECTIONVIEWS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKPANORAMICPROJECTIONVIEWS_DEPRECATED_EXPORT
#  define VTKPANORAMICPROJECTIONVIEWS_DEPRECATED_EXPORT VTKPANORAMICPROJECTIONVIEWS_EXPORT VTKPANORAMICPROJECTIONVIEWS_DEPRECATED
#endif

#ifndef VTKPANORAMICPROJECTIONVIEWS_DEPRECATED_NO_EXPORT
#  define VTKPANORAMICPROJECTIONVIEWS_DEPRECATED_NO_EXPORT VTKPANORAMICPROJECTIONVIEWS_NO_EXPORT VTKPANORAMICPROJECTIONVIEWS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKPANORAMICPROJECTIONVIEWS_NO_DEPRECATED
#    define VTKPANORAMICPROJECTIONVIEWS_NO_DEPRECATED
#  endif
#endif

#endif /* VTKPANORAMICPROJECTIONVIEWS_EXPORT_H */

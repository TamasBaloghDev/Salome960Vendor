
#ifndef VTKACCELERATORSVTKM_EXPORT_H
#define VTKACCELERATORSVTKM_EXPORT_H

#ifdef VTKACCELERATORSVTKM_STATIC_DEFINE
#  define VTKACCELERATORSVTKM_EXPORT
#  define VTKACCELERATORSVTKM_NO_EXPORT
#else
#  ifndef VTKACCELERATORSVTKM_EXPORT
#    ifdef AcceleratorsVTKm_EXPORTS
        /* We are building this library */
#      define VTKACCELERATORSVTKM_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKACCELERATORSVTKM_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKACCELERATORSVTKM_NO_EXPORT
#    define VTKACCELERATORSVTKM_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKACCELERATORSVTKM_DEPRECATED
#  define VTKACCELERATORSVTKM_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKACCELERATORSVTKM_DEPRECATED_EXPORT
#  define VTKACCELERATORSVTKM_DEPRECATED_EXPORT VTKACCELERATORSVTKM_EXPORT VTKACCELERATORSVTKM_DEPRECATED
#endif

#ifndef VTKACCELERATORSVTKM_DEPRECATED_NO_EXPORT
#  define VTKACCELERATORSVTKM_DEPRECATED_NO_EXPORT VTKACCELERATORSVTKM_NO_EXPORT VTKACCELERATORSVTKM_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKACCELERATORSVTKM_NO_DEPRECATED
#    define VTKACCELERATORSVTKM_NO_DEPRECATED
#  endif
#endif

#endif /* VTKACCELERATORSVTKM_EXPORT_H */

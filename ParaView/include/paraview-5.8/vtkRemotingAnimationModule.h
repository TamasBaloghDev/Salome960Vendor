
#ifndef VTKREMOTINGANIMATION_EXPORT_H
#define VTKREMOTINGANIMATION_EXPORT_H

#ifdef VTKREMOTINGANIMATION_STATIC_DEFINE
#  define VTKREMOTINGANIMATION_EXPORT
#  define VTKREMOTINGANIMATION_NO_EXPORT
#else
#  ifndef VTKREMOTINGANIMATION_EXPORT
#    ifdef RemotingAnimation_EXPORTS
        /* We are building this library */
#      define VTKREMOTINGANIMATION_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKREMOTINGANIMATION_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKREMOTINGANIMATION_NO_EXPORT
#    define VTKREMOTINGANIMATION_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKREMOTINGANIMATION_DEPRECATED
#  define VTKREMOTINGANIMATION_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKREMOTINGANIMATION_DEPRECATED_EXPORT
#  define VTKREMOTINGANIMATION_DEPRECATED_EXPORT VTKREMOTINGANIMATION_EXPORT VTKREMOTINGANIMATION_DEPRECATED
#endif

#ifndef VTKREMOTINGANIMATION_DEPRECATED_NO_EXPORT
#  define VTKREMOTINGANIMATION_DEPRECATED_NO_EXPORT VTKREMOTINGANIMATION_NO_EXPORT VTKREMOTINGANIMATION_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKREMOTINGANIMATION_NO_DEPRECATED
#    define VTKREMOTINGANIMATION_NO_DEPRECATED
#  endif
#endif

#endif /* VTKREMOTINGANIMATION_EXPORT_H */

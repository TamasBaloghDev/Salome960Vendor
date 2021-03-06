
#ifndef VTKLAGRANGIANPARTICLETRACKER_EXPORT_H
#define VTKLAGRANGIANPARTICLETRACKER_EXPORT_H

#ifdef VTKLAGRANGIANPARTICLETRACKER_STATIC_DEFINE
#  define VTKLAGRANGIANPARTICLETRACKER_EXPORT
#  define VTKLAGRANGIANPARTICLETRACKER_NO_EXPORT
#else
#  ifndef VTKLAGRANGIANPARTICLETRACKER_EXPORT
#    ifdef vtkLagrangianParticleTracker_EXPORTS
        /* We are building this library */
#      define VTKLAGRANGIANPARTICLETRACKER_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKLAGRANGIANPARTICLETRACKER_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKLAGRANGIANPARTICLETRACKER_NO_EXPORT
#    define VTKLAGRANGIANPARTICLETRACKER_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKLAGRANGIANPARTICLETRACKER_DEPRECATED
#  define VTKLAGRANGIANPARTICLETRACKER_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKLAGRANGIANPARTICLETRACKER_DEPRECATED_EXPORT
#  define VTKLAGRANGIANPARTICLETRACKER_DEPRECATED_EXPORT VTKLAGRANGIANPARTICLETRACKER_EXPORT VTKLAGRANGIANPARTICLETRACKER_DEPRECATED
#endif

#ifndef VTKLAGRANGIANPARTICLETRACKER_DEPRECATED_NO_EXPORT
#  define VTKLAGRANGIANPARTICLETRACKER_DEPRECATED_NO_EXPORT VTKLAGRANGIANPARTICLETRACKER_NO_EXPORT VTKLAGRANGIANPARTICLETRACKER_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKLAGRANGIANPARTICLETRACKER_NO_DEPRECATED
#    define VTKLAGRANGIANPARTICLETRACKER_NO_DEPRECATED
#  endif
#endif

#endif /* VTKLAGRANGIANPARTICLETRACKER_EXPORT_H */

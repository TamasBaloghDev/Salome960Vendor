
#ifndef VTKREMOTINGSERVERMANAGERPYTHON_EXPORT_H
#define VTKREMOTINGSERVERMANAGERPYTHON_EXPORT_H

#ifdef VTKREMOTINGSERVERMANAGERPYTHON_STATIC_DEFINE
#  define VTKREMOTINGSERVERMANAGERPYTHON_EXPORT
#  define VTKREMOTINGSERVERMANAGERPYTHON_NO_EXPORT
#else
#  ifndef VTKREMOTINGSERVERMANAGERPYTHON_EXPORT
#    ifdef RemotingServerManagerPython_EXPORTS
        /* We are building this library */
#      define VTKREMOTINGSERVERMANAGERPYTHON_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKREMOTINGSERVERMANAGERPYTHON_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKREMOTINGSERVERMANAGERPYTHON_NO_EXPORT
#    define VTKREMOTINGSERVERMANAGERPYTHON_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKREMOTINGSERVERMANAGERPYTHON_DEPRECATED
#  define VTKREMOTINGSERVERMANAGERPYTHON_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKREMOTINGSERVERMANAGERPYTHON_DEPRECATED_EXPORT
#  define VTKREMOTINGSERVERMANAGERPYTHON_DEPRECATED_EXPORT VTKREMOTINGSERVERMANAGERPYTHON_EXPORT VTKREMOTINGSERVERMANAGERPYTHON_DEPRECATED
#endif

#ifndef VTKREMOTINGSERVERMANAGERPYTHON_DEPRECATED_NO_EXPORT
#  define VTKREMOTINGSERVERMANAGERPYTHON_DEPRECATED_NO_EXPORT VTKREMOTINGSERVERMANAGERPYTHON_NO_EXPORT VTKREMOTINGSERVERMANAGERPYTHON_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKREMOTINGSERVERMANAGERPYTHON_NO_DEPRECATED
#    define VTKREMOTINGSERVERMANAGERPYTHON_NO_DEPRECATED
#  endif
#endif

#endif /* VTKREMOTINGSERVERMANAGERPYTHON_EXPORT_H */
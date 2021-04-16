
#ifndef VTKREMOTINGCLIENTSERVERSTREAM_EXPORT_H
#define VTKREMOTINGCLIENTSERVERSTREAM_EXPORT_H

#ifdef VTKREMOTINGCLIENTSERVERSTREAM_STATIC_DEFINE
#  define VTKREMOTINGCLIENTSERVERSTREAM_EXPORT
#  define VTKREMOTINGCLIENTSERVERSTREAM_NO_EXPORT
#else
#  ifndef VTKREMOTINGCLIENTSERVERSTREAM_EXPORT
#    ifdef RemotingClientServerStream_EXPORTS
        /* We are building this library */
#      define VTKREMOTINGCLIENTSERVERSTREAM_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKREMOTINGCLIENTSERVERSTREAM_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKREMOTINGCLIENTSERVERSTREAM_NO_EXPORT
#    define VTKREMOTINGCLIENTSERVERSTREAM_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKREMOTINGCLIENTSERVERSTREAM_DEPRECATED
#  define VTKREMOTINGCLIENTSERVERSTREAM_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKREMOTINGCLIENTSERVERSTREAM_DEPRECATED_EXPORT
#  define VTKREMOTINGCLIENTSERVERSTREAM_DEPRECATED_EXPORT VTKREMOTINGCLIENTSERVERSTREAM_EXPORT VTKREMOTINGCLIENTSERVERSTREAM_DEPRECATED
#endif

#ifndef VTKREMOTINGCLIENTSERVERSTREAM_DEPRECATED_NO_EXPORT
#  define VTKREMOTINGCLIENTSERVERSTREAM_DEPRECATED_NO_EXPORT VTKREMOTINGCLIENTSERVERSTREAM_NO_EXPORT VTKREMOTINGCLIENTSERVERSTREAM_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKREMOTINGCLIENTSERVERSTREAM_NO_DEPRECATED
#    define VTKREMOTINGCLIENTSERVERSTREAM_NO_DEPRECATED
#  endif
#endif

#endif /* VTKREMOTINGCLIENTSERVERSTREAM_EXPORT_H */

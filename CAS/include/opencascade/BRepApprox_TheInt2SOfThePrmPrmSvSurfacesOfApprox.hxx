// Created on: 1995-06-06
// Created by: Jean Yves LEBEY
// Copyright (c) 1995-1999 Matra Datavision
// Copyright (c) 1999-2014 OPEN CASCADE SAS
//
// This file is part of Open CASCADE Technology software library.
//
// This library is free software; you can redistribute it and/or modify it under
// the terms of the GNU Lesser General Public License version 2.1 as published
// by the Free Software Foundation, with special exception defined in the file
// OCCT_LGPL_EXCEPTION.txt. Consult the file LICENSE_LGPL_21.txt included in OCCT
// distribution for complete text of the license and disclaimer of any warranty.
//
// Alternatively, this file may be used under the terms of Open CASCADE
// commercial license or contractual agreement.

#ifndef _BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox_HeaderFile
#define _BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox_HeaderFile

#include <Standard.hxx>
#include <Standard_DefineAlloc.hxx>
#include <Standard_Handle.hxx>

#include <Standard_Boolean.hxx>
#include <IntSurf_PntOn2S.hxx>
#include <gp_Dir.hxx>
#include <gp_Dir2d.hxx>
#include <BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox.hxx>
#include <Standard_Real.hxx>
#include <TColStd_Array1OfReal.hxx>
#include <IntImp_ConstIsoparametric.hxx>
class StdFail_NotDone;
class Standard_DomainError;
class Standard_ConstructionError;
class StdFail_UndefinedDerivative;
class BRepAdaptor_Surface;
class BRepApprox_SurfaceTool;
class BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
class math_FunctionSetRoot;
class IntSurf_PntOn2S;
class gp_Dir;
class gp_Dir2d;



class BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox 
{
public:

  DEFINE_STANDARD_ALLOC

  //! compute the solution point with the close point
  Standard_EXPORT BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox(const TColStd_Array1OfReal& Param, const BRepAdaptor_Surface& S1, const BRepAdaptor_Surface& S2, const Standard_Real TolTangency);
  
  //! initialize the parameters to compute the solution point
  //! it 's possible to write to optimize:
  //! IntImp_Int2S inter(S1,S2,Func,TolTangency);
  //! math_FunctionSetRoot rsnld(inter.Function());
  //! while ...{
  //! Param(1)=...
  //! Param(2)=...
  //! param(3)=...
  //! inter.Perform(Param,rsnld);
  //! }
  Standard_EXPORT BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox(const BRepAdaptor_Surface& S1, const BRepAdaptor_Surface& S2, const Standard_Real TolTangency);
  
  //! returns the best constant isoparametric to find
  //! the next intersection's point +stores the solution
  //! point (the solution point is found with the close point
  //! to intersect the isoparametric with the other patch;
  //! the choice of the isoparametic is calculated)
  Standard_EXPORT IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal& Param, math_FunctionSetRoot& Rsnld);
  
  //! returns the best constant isoparametric to find
  //! the next intersection's point +stores the solution
  //! point (the solution point is found with the close point
  //! to intersect the isoparametric with the other patch;
  //! the choice of the isoparametic is given by ChoixIso)
  Standard_EXPORT IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal& Param, math_FunctionSetRoot& Rsnld, const IntImp_ConstIsoparametric ChoixIso);
  
  //! Returns TRUE if the creation completed without failure.
    Standard_Boolean IsDone() const;
  
  //! Returns TRUE when there is no solution to the problem.
    Standard_Boolean IsEmpty() const;
  
  //! Returns the intersection point.
    const IntSurf_PntOn2S& Point() const;
  
  //! Returns True if the surfaces are tangent at the
  //! intersection point.
    Standard_Boolean IsTangent() const;
  
  //! Returns the tangent at the intersection line.
    const gp_Dir& Direction() const;
  
  //! Returns the tangent at the intersection line in the
  //! parametric space of the first surface.
    const gp_Dir2d& DirectionOnS1() const;
  
  //! Returns the tangent at the intersection line in the
  //! parametric space of the second surface.
    const gp_Dir2d& DirectionOnS2() const;
  
  //! return the math function which
  //! is used to compute the intersection
    BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox& Function();
  
  //! return the intersection point which is
  //! enable for changing.
    IntSurf_PntOn2S& ChangePoint();




protected:





private:



  Standard_Boolean done;
  Standard_Boolean empty;
  IntSurf_PntOn2S pint;
  Standard_Boolean tangent;
  gp_Dir d3d;
  gp_Dir2d d2d1;
  gp_Dir2d d2d2;
  BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox myZerParFunc;
  Standard_Real tol;
  Standard_Real ua0;
  Standard_Real va0;
  Standard_Real ua1;
  Standard_Real va1;
  Standard_Real ub0;
  Standard_Real vb0;
  Standard_Real ub1;
  Standard_Real vb1;
  Standard_Real ures1;
  Standard_Real ures2;
  Standard_Real vres1;
  Standard_Real vres2;


};

#define ThePSurface BRepAdaptor_Surface
#define ThePSurface_hxx <BRepAdaptor_Surface.hxx>
#define ThePSurfaceTool BRepApprox_SurfaceTool
#define ThePSurfaceTool_hxx <BRepApprox_SurfaceTool.hxx>
#define IntImp_TheFunction BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox
#define IntImp_TheFunction_hxx <BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox.hxx>
#define IntImp_Int2S BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox
#define IntImp_Int2S_hxx <BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox.hxx>

#include <IntImp_Int2S.lxx>

#undef ThePSurface
#undef ThePSurface_hxx
#undef ThePSurfaceTool
#undef ThePSurfaceTool_hxx
#undef IntImp_TheFunction
#undef IntImp_TheFunction_hxx
#undef IntImp_Int2S
#undef IntImp_Int2S_hxx




#endif // _BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox_HeaderFile

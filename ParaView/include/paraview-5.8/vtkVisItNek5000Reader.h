/*=========================================================================

   Program: ParaView
   Module:  vtkVisItNek5000Reader.h

   Copyright (c) 2005,2006 Sandia Corporation, Kitware Inc.
   All rights reserved.

   ParaView is a free software; you can redistribute it and/or modify it
   under the terms of the ParaView license version 1.2.

   See License_v1.2.txt for the full ParaView license.
   A copy of this license can be obtained by contacting
   Kitware Inc.
   28 Corporate Drive
   Clifton Park, NY 12065
   USA

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHORS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

========================================================================*/

#ifndef vtkVisItNek5000Reader_h
#define vtkVisItNek5000Reader_h

#include "vtkIOVisItBridgeModule.h" //for export macro
#include "vtkAvtMTMDFileFormatAlgorithm.h"
#define _add_visit_reader_uses_interface 0

class VTKIOVISITBRIDGE_EXPORT vtkVisItNek5000Reader : public vtkAvtMTMDFileFormatAlgorithm
{
public:
  static vtkVisItNek5000Reader *New();
  vtkTypeMacro(vtkVisItNek5000Reader,vtkAvtMTMDFileFormatAlgorithm );
  void PrintSelf(ostream& os, vtkIndent indent) override;
  vtkSetStringMacro(FileName);
  vtkGetStringMacro(FileName);
#if _add_visit_reader_uses_interface
  int CanReadFile(const char* fname);
#endif

protected:
  vtkVisItNek5000Reader();
  ~vtkVisItNek5000Reader();

  bool InitializeAVTReader( const int& timestep ) override;
  bool ActivateTimestep( const int& timestep ) override;
  char *FileName;

private:
  vtkVisItNek5000Reader(const vtkVisItNek5000Reader&) = delete;
  void operator = (const vtkVisItNek5000Reader&) = delete;
};
#endif

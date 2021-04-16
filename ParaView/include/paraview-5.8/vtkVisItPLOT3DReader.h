/*=========================================================================

   Program: ParaView
   Module:  vtkVisItPLOT3DReader.h

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

#ifndef vtkVisItPLOT3DReader_h
#define vtkVisItPLOT3DReader_h
#include "vtkIOVisItBridgeModule.h" //for export macro
#include "vtkAvtSTMDFileFormatAlgorithm.h"
#define _add_visit_reader_uses_interface 0

class VTKIOVISITBRIDGE_EXPORT vtkVisItPLOT3DReader : public vtkAvtSTMDFileFormatAlgorithm
{
public:
  static vtkVisItPLOT3DReader *New();
  vtkTypeMacro(vtkVisItPLOT3DReader,vtkAvtSTMDFileFormatAlgorithm );
  void PrintSelf(ostream& os, vtkIndent indent) override;
  vtkSetStringMacro(FileName);
  vtkGetStringMacro(FileName);
#if _add_visit_reader_uses_interface
  int CanReadFile(const char* fname);
#endif

protected:
  vtkVisItPLOT3DReader();
  ~vtkVisItPLOT3DReader();

  bool InitializeAVTReader( const int& timestep ) override;
  char *FileName;

private:
  vtkVisItPLOT3DReader(const vtkVisItPLOT3DReader&) = delete;
  void operator = (const vtkVisItPLOT3DReader&) = delete;
};
#endif

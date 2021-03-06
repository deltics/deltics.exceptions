{
  * MIT LICENSE *

  Copyright � 2020 Jolyon Smith

  Permission is hereby granted, free of charge, to any person obtaining a copy of
   this software and associated documentation files (the "Software"), to deal in
   the Software without restriction, including without limitation the rights to
   use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
   of the Software, and to permit persons to whom the Software is furnished to do
   so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.


  * GPL and Other Licenses *

  The FSF deem this license to be compatible with version 3 of the GPL.
   Compatability with other licenses should be verified by reference to those
   other license terms.


  * Contact Details *

  Original author : Jolyon Direnko-Smith
  e-mail          : jsmith@deltics.co.nz
  github          : deltics/deltics.rtl
}

{$i deltics.exceptions.inc}

  unit Deltics.Exceptions;


interface

  uses
    Classes,
    SysUtils;


  type
    // Simple aliases for exceptions from RTL Units
    Exception         = SysUtils.Exception;
    EInvalidOperation = Classes.EInvalidOperation;

    // Exceptions that alias existing exceptions in some Delphi versions but which
    //  need to be derived as new exception classes in older versions
    EArgumentException  = {$ifdef __DELPHI2009} class(Exception) {$else} SysUtils.EArgumentException {$endif};
    ENotSupported       = {$ifdef __DELPHI2009} class(Exception) {$else} SysUtils.ENotSupportedException {$endif};

    // Add convenience constructors to ENotImplemented (a sub-class of SysUtils.ENotImplemented
    //  where present, a new exception class in older Delphi versions).
    ENotImplemented = class({$ifdef __DELPHI2010} Exception {$else} SysUtils.ENotImplemented {$endif})
    public
      constructor Create; overload;
      constructor Create(const aClass: TClass; const aMethodName: String); overload;
      constructor Create(const aObject: TObject; const aMethodName: String); overload;
    end;




implementation


{ ENotImplemented -------------------------------------------------------------------------------- }

  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  constructor ENotImplemented.Create;
  begin
    inherited Create('This has not been implemented');
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  constructor ENotImplemented.Create(const aClass: TClass;
                                     const aMethodName: String);
  begin
    inherited CreateFmt('%s.%s has not been implemented', [aClass.ClassName, aMethodName]);
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  constructor ENotImplemented.Create(const aObject: TObject;
                                     const aMethodName: String);
  begin
    inherited CreateFmt('%s.%s has not been implemented', [aObject.ClassName, aMethodName]);
  end;





end.

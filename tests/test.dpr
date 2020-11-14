program test;

{$i deltics.inc}

uses
{$ifdef DELPHI2010__}
  SysUtils,
{$endif}
  Deltics.Smoketest,
  Deltics.Exceptions;


  type
    TTests = class(TTest)
      procedure EArgumentExceptionIsRaisedWithSpecifiedMessage;
      procedure EArgumentExceptionDerivesFromExpectedBaseClass;
      procedure ENotSupportedExceptionDerivesFromExpectedBaseClass;
      procedure ENotImplementedDerivesFromExpectedBaseClass;
    end;


{ TTests }

  procedure TTests.EArgumentExceptionIsRaisedWithSpecifiedMessage;
  begin
    try
      raise EArgumentException.Create('An EArgumentException');

      Test.AssertException(EArgumentException, 'An EArgumentException');

    except
      Test.AssertException(EArgumentException, 'An EArgumentException');
    end;
  end;


  procedure TTests.EArgumentExceptionDerivesFromExpectedBaseClass;
  begin
    try
      raise EArgumentException.Create('');

    except
    {$ifdef DELPHI2010__}
      Test.AssertBaseException(SysUtils.EArgumentException);
    {$else}
      Test.AssertBaseException(SysUtils.Exception);
    {$endif}
    end;
  end;


  procedure TTests.ENotSupportedExceptionDerivesFromExpectedBaseClass;
  begin
    try
      raise ENotSupportedException.Create('');

    except
    {$ifdef DELPHI2010__}
      Test.AssertBaseException(SysUtils.ENotSupportedException);
    {$else}
      Test.AssertBaseException(SysUtils.Exception);
    {$endif}
    end;
  end;


  procedure TTests.ENotImplementedDerivesFromExpectedBaseClass;
  begin
    try
      raise ENotImplemented.Create('');

    except
    {$ifdef DELPHI2010__}
      Test.AssertBaseException(SysUtils.ENotImplemented);
    {$else}
      Test.AssertBaseException(SysUtils.Exception);
    {$endif}
    end;
  end;


begin
  TestRun.Test(TTests);
end.

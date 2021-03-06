program test;

{$apptype console}

{$i deltics.inc}

uses
  Classes,
  SysUtils,
  Deltics.Smoketest,
  Deltics.Exceptions in '..\src\Deltics.Exceptions.pas';

  type
    TTests = class(TTest)
      procedure ExceptionIsAliasForSysUtilsException;
      procedure EInvalidOperationIsAliasForClassesEInvalidOperation;
    {$ifdef DELPHI2010__}
      procedure EArgumentExceptionIsAliasForSysUtilsEArgumentException;
      procedure ENotSupportedIsAliasForSysUtilsENotSupported;
    {$else}
      procedure EArgumentExceptionExtendsException;
      procedure ENotSupportedExtendsException;
    {$endif}
    {$ifdef DELPHIXE__}
      procedure ENotImplementedExtendsSysUtilsENotImplemented;
    {$else}
      procedure ENotImplementedExtendsException;
    {$endif}
      procedure EArgumentExceptionIsRaisedWithSpecifiedMessage;
      procedure ENotImplementedIsRaisedWithDefaultMessage;
      procedure ENotImplementedIsRaisedWithMessageConstructedFromClassAndMethodName;
      procedure ENotImplementedIsRaisedWithMessageConstructedFromObjectAndMethodName;
      procedure ENotImplementedIsRaisedWithSpecifiedMessage;
      procedure ENotSupportedIsRaisedWithSpecifiedMessage;
    end;


{ TTests }

  procedure TTests.ExceptionIsAliasForSysUtilsException;
  begin
    Test('Exception.ClassInfo = SysUtils.Exception.ClassInfo').Assert(Exception.ClassInfo).Equals(SysUtils.Exception.ClassInfo);
  end;


  procedure TTests.EInvalidOperationIsAliasForClassesEInvalidOperation;
  begin
    Test('EInvalidOperation.ClassInfo = Classes.EInvalidOperation.ClassInfo').Assert(Deltics.Exceptions.EInvalidOperation.ClassInfo).Equals(Classes.EInvalidOperation.ClassInfo);
  end;


{$ifdef DELPHI2010__}
  procedure TTests.EArgumentExceptionIsAliasForSysUtilsEArgumentException;
  begin
    Test('EArgumentException.ClassInfo').Assert(EArgumentException.ClassInfo).Equals(SysUtils.EArgumentException.ClassInfo);
  end;


  procedure TTests.ENotSupportedIsAliasForSysUtilsENotSupported;
  begin
    Test('ENotSupported.ClassInfo').Assert(ENotSupported.ClassInfo).Equals(SysUtils.ENotSupportedException.ClassInfo);
  end;

{$else}

  procedure TTests.EArgumentExceptionExtendsException;
  begin
    Test('EArgumentException.ClassParent').Assert(EArgumentException.ClassParent = Exception);
  end;


  procedure TTests.ENotSupportedExtendsException;
  begin
    Test('ENotSupported.ClassParent').Assert(ENotSupported.ClassParent = Exception);
  end;
{$endif}


{$ifdef DELPHIXE__}
  procedure TTests.ENotImplementedExtendsSysUtilsENotImplemented;
  begin
    Test('ENotImplemented.ClassParent').Assert(ENotImplemented.ClassParent = SysUtils.ENotImplemented);
  end;

{$else}

  procedure TTests.ENotImplementedExtendsException;
  begin
    Test('ENotImplemented.ClassParent').Assert(ENotImplemented.ClassParent = Exception);
  end;
{$endif}



  procedure TTests.EArgumentExceptionIsRaisedWithSpecifiedMessage;
  const
    MSG = 'An EArgumentException';
  begin
    Test.RaisesException(EArgumentException, MSG);

    raise EArgumentException.Create(MSG);
  end;


  procedure TTests.ENotImplementedIsRaisedWithDefaultMessage;
  begin
    Test.RaisesException(ENotImplemented, 'This has not been implemented');

    raise ENotImplemented.Create;
  end;


  procedure TTests.ENotImplementedIsRaisedWithMessageConstructedFromClassAndMethodName;
  begin
    Test.RaisesException(ENotImplemented, 'TTests.Foo has not been implemented');

    raise ENotImplemented.Create(TTests, 'Foo');
  end;


  procedure TTests.ENotImplementedIsRaisedWithMessageConstructedFromObjectAndMethodName;
  begin
    Test.RaisesException(ENotImplemented, 'TTests.Foo has not been implemented');

    raise ENotImplemented.Create(self, 'Foo');
  end;


  procedure TTests.ENotImplementedIsRaisedWithSpecifiedMessage;
  const
    MSG = 'Some specific message';
  begin
    Test.RaisesException(ENotImplemented, MSG);

    raise ENotImplemented.Create(MSG);
  end;


  procedure TTests.ENotSupportedIsRaisedWithSpecifiedMessage;
  const
    MSG = 'An ENotSupported';
  begin
    Test.RaisesException(ENotSupported, MSG);

    raise ENotSupported.Create(MSG);
  end;






begin
  TestRun.Test(TTests);
end.

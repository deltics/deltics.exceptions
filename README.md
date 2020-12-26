# Deltics.Exceptions

Provides a "one-stop-shop" for the most common exception types across all Delphi versions from
Delphi 7 thru Delphi 10.4.

In addition, convenience constructors are added to some exception types, notably ENotImplemented.

Exception classes that are presented by this package are:

* Exception
* EInvalidOperation (but **not** EInvalidOpException)
* EArgumentException
* ENotSupported
* ENotImplemented


## ENotImplemented Convenience Constructors

* Create(), provides default message `This has not been implemented`
* Create(aClass: TClass, aMethodName: String), constructs an exception with the message `<aClassName>.<aMethodName> has not been implemented`
* Create(aObject: TObject, aMethodName: String), constructs an exception with the message `<aObject.ClassName>.<aMethodName> has not been implemented`


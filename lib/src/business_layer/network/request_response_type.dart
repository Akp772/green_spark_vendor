enum ExceptionType {
  timeOutException,
  socketException,
  apiException,
  parseException,
  cancelException,
  otherException,
  noException
}

class HttpResponseType {
  static const String success = "success";
  static const String alreadyReserved = "already_reserved";
  static const String failed = "failed";
}

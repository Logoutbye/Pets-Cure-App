class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

// Time expired error while communication
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication:');
}

// invlid url or route
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invlid Request:');
}

// invalid token for authorization
class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, 'Un-Authorized Request:');
}

// invalid input data
class InvilidInputException extends AppException {
  InvilidInputException([String? message]) : super(message, 'Invalid Input:');
}

// USer Already Registered 
// class InternalServerErrorException extends AppException {
//   InternalServerErrorException([String? message]) : super(message, 'Invalid Input:');
// }

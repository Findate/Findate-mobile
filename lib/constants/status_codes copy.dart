// ignore_for_file: constant_identifier_names, file_names



// Success
const SUCCESS = 200;

// Errors
const USER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;



class Failure {
  int? code;
  Object? errorResponse;
  Failure({this.code, this.errorResponse});
}

class Success {
  int? code;
  Object? response;
  Success({this.code, this.response});
}
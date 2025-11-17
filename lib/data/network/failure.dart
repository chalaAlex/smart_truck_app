import 'package:easy_logistics/data/network/error_handler.dart';

class Failure {
  Failure(this.code, this.message);

  int code;
  String message;
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}

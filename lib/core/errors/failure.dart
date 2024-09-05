import 'package:dio/dio.dart';

abstract class Failure{
 final String errorMessage;

 const Failure(this.errorMessage);

}

class ServerFailure extends Failure{
  ServerFailure(super.errorMessage);


  factory ServerFailure.fromDioError(DioException dioError){

    switch(dioError.type){
      
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("send Timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive Timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("No internet connection");
      case DioExceptionType.unknown:
        if(dioError.message!.contains("SocketException")){
          return ServerFailure("No internet connection");
        }
        return ServerFailure("Unexpected error with ApiServer");

      default:
            return ServerFailure("Something went wrong, please try again later");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response){

    if(statusCode == 400 || statusCode == 401 || statusCode == 403){
      return ServerFailure(response["error"]["message"]);
    }else if(statusCode == 404){
      return ServerFailure("Your request not found, please try later");
    }else if(statusCode == 500){
      return ServerFailure("Internal server error");
    }else{
      return ServerFailure("Something went wrong, please try again later");
    }
  }
}
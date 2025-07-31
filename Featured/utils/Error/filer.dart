import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

@immutable
abstract class Filer {
  final String errMessage;

  const Filer(this.errMessage);
}

class Filureservise extends Filer {
  const Filureservise(super.errMessage);
  factory Filureservise.fromDioError(DioException dioex) {
    switch (dioex.type) {
      case DioExceptionType.connectionTimeout:
        return Filureservise('conntion timeout with ApiServce');
      case DioExceptionType.sendTimeout:
        return Filureservise('send timeout with ApiServce');
      case DioExceptionType.receiveTimeout:
        return Filureservise('receive timeout with ApiServce');
      case DioExceptionType.badCertificate:
        return Filureservise('certificate timeout with ApiService');
      case DioExceptionType.badResponse:
        return Filureservise.fromResponce(
          dioex.response?.statusCode ?? 0,
          dioex.response?.data,
        );
      case DioExceptionType.cancel:
        return Filureservise('request cancelled');
      case DioExceptionType.connectionError:
        return Filureservise('connection error');
      case DioExceptionType.unknown:
        if (dioex.message != null &&
            dioex.message!.contains('SocketException')) {
          return Filureservise('not net');
        }
        return Filureservise('unexpected error');
      default:
        return Filureservise('oops');
    }
  }
  factory Filureservise.fromResponce(int statuscode, dynamic responce) {
    if (statuscode == 400 ||
        statuscode == 401 ||
        statuscode == 402 ||
        statuscode == 403) {
      return Filureservise(responce['error']['message']);
    } else if (statuscode == 404) {
      return Filureservise('Method not found');
    } else if (statuscode == 500) {
      return Filureservise('intrent serverr');
    } else {
      return Filureservise('please try again');
    }
  }
}

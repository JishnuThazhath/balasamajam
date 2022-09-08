import 'package:balasamajam/network/api_enums.dart';

typedef APICallback<R> = R Function(dynamic);
typedef APIOnFailureCallBackWithMessage<R> = R Function(
    APIResponseErrorType, String);

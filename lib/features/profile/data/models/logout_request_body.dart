import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_request_body.freezed.dart';
part 'logout_request_body.g.dart';

@freezed
abstract class LogoutRequestBody with _$LogoutRequestBody {
  const factory LogoutRequestBody({@Default('all') String flag}) =
      _LogoutRequestBody;

  factory LogoutRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestBodyFromJson(json);
}

import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String cod;
  final String message;

  const ErrorMessageModel({
    required this.cod,
    required this.message,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        cod: json['cod'],
        message: json['message'],
      );

  @override
  List<Object> get props => [
        cod,
        message,
      ];
}

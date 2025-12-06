import 'student.dart';

class QrVerificationResponse {
  final bool valid;
  final Student? aluno;
  final String? error;

  QrVerificationResponse({
    required this.valid,
    this.aluno,
    this.error,
  });

  factory QrVerificationResponse.fromJson(Map<String, dynamic> json) {
    if (json['valid'] == true && json['aluno'] != null) {
      return QrVerificationResponse(
        valid: true,
        aluno: Student.fromJson(json['aluno'] as Map<String, dynamic>),
      );
    } else {
      return QrVerificationResponse(
        valid: false,
        error: json['error'] as String? ?? 'QR Code inválido',
      );
    }
  }
}


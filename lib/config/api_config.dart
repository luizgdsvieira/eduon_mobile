class ApiConfig {
  // URL base da API - ajuste conforme necessário
   static const String baseUrl = 'https://projetoeduon.onrender.com/api';
  // Para desenvolvimento local, use:
  // static const String baseUrl = 'http://localhost:3000/api';
  // ou para emulador Android:
  // static const String baseUrl = 'http://10.0.2.2:3000/api';

  // Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String verifyQrCodeEndpoint = '/alunos/verify-qrcode';
  static const String studentEndpoint = '/alunos';

  // Headers
  static Map<String, String> getHeaders(String? token) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }
}


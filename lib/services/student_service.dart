import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/api_config.dart';
import '../models/student.dart';

class StudentService {
  static Future<Student?> getStudentByToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final authToken = prefs.getString('token');

      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}${ApiConfig.verifyQrCodeEndpoint}'),
        headers: ApiConfig.getHeaders(authToken),
        body: jsonEncode({
          'token': token,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['valid'] == true && data['aluno'] != null) {
          return Student.fromJson(data['aluno'] as Map<String, dynamic>);
        }
      }
      return null;
    } catch (e) {
      print('Erro ao buscar aluno: $e');
      return null;
    }
  }

  static Future<Student?> getCurrentStudent() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final role = prefs.getString('role');

      if (token == null || role != 'student') {
        return null;
      }

      // Buscar todos os alunos e encontrar o que corresponde ao usuário logado
      // Nota: Em produção, seria ideal ter um endpoint específico como /alunos/me
      // que retorna o aluno baseado no token JWT
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}${ApiConfig.studentEndpoint}?limit=100'),
        headers: ApiConfig.getHeaders(token),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Se a resposta for paginada
        final studentsData = data['data'] ?? data;
        
        if (studentsData is List) {
          // Buscar o aluno que tem qrcode_token (o aluno do usuário logado)
          // ou retornar o primeiro se não houver token específico
          Student? studentWithToken;
          for (var studentJson in studentsData) {
            final student = Student.fromJson(studentJson as Map<String, dynamic>);
            if (student.qrcodeToken != null && student.qrcodeToken!.isNotEmpty) {
              studentWithToken = student;
              break;
            }
          }
          
          // Se encontrou aluno com token, retornar ele, senão retornar o primeiro
          return studentWithToken ?? 
                 (studentsData.isNotEmpty 
                   ? Student.fromJson(studentsData[0] as Map<String, dynamic>)
                   : null);
        }
      }
      return null;
    } catch (e) {
      print('Erro ao buscar aluno atual: $e');
      return null;
    }
  }
}


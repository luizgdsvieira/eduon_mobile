import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../config/app_colors.dart';
import '../models/student.dart';

class StudentValidationScreen extends StatefulWidget {
  final Student student;

  const StudentValidationScreen({
    super.key,
    required this.student,
  });

  @override
  State<StudentValidationScreen> createState() => _StudentValidationScreenState();
}

class _StudentValidationScreenState extends State<StudentValidationScreen> {
  bool _isValidated = false;

  void _validateEntry() {
    setState(() {
      _isValidated = true;
    });

    // Mostrar feedback de sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Entrada validada com sucesso!'),
        backgroundColor: AppColors.successGreen,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );

    // Voltar após 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: const Text('Validação de Entrada'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Status de validação
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: _isValidated
                    ? AppColors.successGreen.withOpacity(0.2)
                    : AppColors.primaryBlue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _isValidated
                      ? AppColors.successGreen
                      : AppColors.primaryBlue,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    _isValidated ? Icons.check_circle : Icons.person,
                    size: 64,
                    color: _isValidated
                        ? AppColors.successGreen
                        : AppColors.primaryBlue,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _isValidated ? 'Entrada Validada!' : 'Dados do Aluno',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: _isValidated
                          ? AppColors.successGreen
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Carteirinha do aluno
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Logo EDUON
                  const Text(
                    'EDUON',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Carteirinha Digital',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Foto do aluno (placeholder)
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Nome do aluno
                  Text(
                    widget.student.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Informações
                  _buildInfoRow('Matrícula', widget.student.matricula ?? 'N/A'),
                  if (widget.student.ano != null)
                    _buildInfoRow('Ano', widget.student.ano!),
                  if (widget.student.turma != null)
                    _buildInfoRow('Turma', widget.student.turma!),
                  if (widget.student.turno != null)
                    _buildInfoRow('Turno', widget.student.turno!),
                  if (widget.student.nascimento != null)
                    _buildInfoRow(
                      'Nascimento',
                      DateFormat('dd/MM/yyyy').format(
                        DateTime.parse(widget.student.nascimento!),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Botão de validação
            if (!_isValidated)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: AppColors.buttonGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryBlue.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _validateEntry,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Validar Entrada',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (_isValidated)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.successGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.successGreen,
                    width: 2,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.successGreen,
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Entrada registrada com sucesso!',
                      style: TextStyle(
                        color: AppColors.successGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


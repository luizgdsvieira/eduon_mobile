class Student {
  final String id;
  final String name;
  final String? matricula;
  final String? ano;
  final String? turma;
  final String? turno;
  final String? nascimento;
  final String schoolId;
  final String? qrcodeToken;
  final DateTime? createdAt;

  Student({
    required this.id,
    required this.name,
    this.matricula,
    this.ano,
    this.turma,
    this.turno,
    this.nascimento,
    required this.schoolId,
    this.qrcodeToken,
    this.createdAt,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as String,
      name: json['name'] as String,
      matricula: json['matricula'] as String?,
      ano: json['ano'] as String?,
      turma: json['turma'] as String?,
      turno: json['turno'] as String?,
      nascimento: json['nascimento'] as String?,
      schoolId: json['school_id'] as String,
      qrcodeToken: json['qrcode_token'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'matricula': matricula,
      'ano': ano,
      'turma': turma,
      'turno': turno,
      'nascimento': nascimento,
      'school_id': schoolId,
      'qrcode_token': qrcodeToken,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}


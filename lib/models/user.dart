class User {
  final String id;
  final String username;
  final String role;
  final String schoolId;
  final String? studentId;
  final String? staffId;

  User({
    required this.id,
    required this.username,
    required this.role,
    required this.schoolId,
    this.studentId,
    this.staffId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      username: json['username'] as String,
      role: json['role'] as String,
      schoolId: json['school_id'] as String,
      studentId: json['student_id'] as String?,
      staffId: json['staff_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'role': role,
      'school_id': schoolId,
      'student_id': studentId,
      'staff_id': staffId,
    };
  }
}


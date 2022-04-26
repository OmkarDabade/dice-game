import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  int cummulativeScore;

  @HiveField(3)
  int attemptsRemaining;

  User({
    required this.name,
    required this.email,
    this.cummulativeScore = 0,
    this.attemptsRemaining = 10,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      cummulativeScore: json['cummulative_score'],
      attemptsRemaining: json['attempts_remaining'],
    );
  }

  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'cummulative_score': cummulativeScore,
      'attempts_remaining': attemptsRemaining,
    };
  }
}

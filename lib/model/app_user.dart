import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'app_user.g.dart';

@HiveType(typeId: 0)
class AppUser {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? userId;

  @HiveField(3)
  int cummulativeScore;

  @HiveField(4)
  int attemptsRemaining;

  AppUser({
    this.name,
    this.email,
    this.userId,
    this.cummulativeScore = 0,
    this.attemptsRemaining = 10,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      name: json['name'],
      email: json['email'],
      userId: json['user_id'],
      cummulativeScore: json['cummulative_score'],
      attemptsRemaining: json['attempts_remaining'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'user_id': userId,
      'cummulative_score': cummulativeScore,
      'attempts_remaining': attemptsRemaining,
    };
  }

  @override
  int get hashCode => hashValues(email, userId);

  @override
  bool operator ==(covariant AppUser other) {
    return other.email == email && other.userId == userId;
  }
}

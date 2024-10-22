class UserExerciseModel {
  final String status;
  final List<UserExercise> userExercises;

  UserExerciseModel({required this.status, required this.userExercises});

  factory UserExerciseModel.fromJson(Map<String, dynamic> json) {
    return UserExerciseModel(
      status: json['status'],
      userExercises: (json['userExercises'] as List)
          .map((e) => UserExercise.fromJson(e))
          .toList(),
    );
  }
}

class UserExercise {
  final int id;
  final String userId;
  final String exerciseId;
  final String createdAt;
  final String updatedAt;
  final String reminderTime;
  final String reminderFrequency;
  final Exercis exercise;

  UserExercise({
    required this.id,
    required this.userId,
    required this.exerciseId,
    required this.createdAt,
    required this.updatedAt,
    required this.reminderTime,
    required this.reminderFrequency,
    required this.exercise,
  });

  factory UserExercise.fromJson(Map<String, dynamic> json) {
    return UserExercise(
      id: json['id'],
      userId: json['user_id'],
      exerciseId: json['exercise_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      reminderTime: json['reminder_time'],
      reminderFrequency: json['reminder_frequency'],
      exercise: Exercis.fromJson(json['exercise']),
    );
  }
}

class Exercis {
  final int id;
  final String name;
  final String description;
  final String duration;
  final String createdAt;
  final String updatedAt;

  Exercis({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Exercis.fromJson(Map<String, dynamic> json) {
    return Exercis(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

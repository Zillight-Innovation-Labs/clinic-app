class ExerciseModel {
  final String? status;
  final List<Exercise>? exercises;

  ExerciseModel({this.status, this.exercises});

  // Factory constructor for converting JSON to ExerciseModel
  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      status: json['status'],
      exercises: json['exercises'] != null
          ? (json['exercises'] as List).map((i) => Exercise.fromJson(i)).toList()
          : null,
    );
  }
}

class Exercise {
  final dynamic id;
  final String? name;
  final String? description;
  final dynamic duration;
  final String? createdAt;
  final String? updatedAt;

  Exercise({
    this.id,
    this.name,
    this.description,
    this.duration,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor for converting JSON to Exercise
  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

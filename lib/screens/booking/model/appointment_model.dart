// ignore_for_file: prefer_null_aware_operators

class Appointment {
  final String? id;
  final String? doctorId;
  final String? userId;
  final String? appointmentDate;
  final String? appointmentTime;
  final String? duration;
  final String? location;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? doctorFirstName;
  final String? doctorLastName;

  Appointment({
    this.id,
    this.doctorId,
    this.userId,
    this.appointmentDate,
    this.appointmentTime,
    this.duration,
    this.location,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.doctorFirstName,
    this.doctorLastName,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      doctorId: json['doctor_id'],
      userId: json['user_id'],
      appointmentDate: json['appointment_date'],
      appointmentTime: json['appointment_time'],
      duration: json['duration'],
      location: json['location'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      doctorFirstName: json['doctor_first_name'],
      doctorLastName: json['doctor_last_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'user_id': userId,
      'appointment_date': appointmentDate,
      'appointment_time': appointmentTime,
      'duration': duration,
      'location': location,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'doctor_first_name': doctorFirstName,
      'doctor_last_name': doctorLastName,
    };
  }
}

class AppointmentModel {
  final List<Appointment>? appointments;

  AppointmentModel({this.appointments});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    var appointmentList = json['appointments'] as List?;
    List<Appointment>? appointments = appointmentList != null
        ? appointmentList.map((i) => Appointment.fromJson(i)).toList()
        : null;

    return AppointmentModel(
      appointments: appointments,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointments': appointments?.map((a) => a.toJson()).toList(),
    };
  }
}

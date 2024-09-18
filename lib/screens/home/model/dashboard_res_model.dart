import '../../booking/model/appointments_res_model.dart';
import '../../category/model/category_list_model.dart';
import '../../clinic/model/clinics_res_model.dart';
import '../../service/model/service_list_model.dart';

class DashboardRes {
  bool status;
  DashboardData data;
  String message;

  DashboardRes({
    this.status = false,
    required this.data,
    this.message = "",
  });

  factory DashboardRes.fromJson(Map<String, dynamic> json) {
    return DashboardRes(
      status: json['status'] is bool ? json['status'] : false,
      data: json['data'] is Map ? DashboardData.fromJson(json['data']) : DashboardData(),
      message: json['message'] is String ? json['message'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class DashboardData {
  List<CategoryElement> categories;
  List<Clinic> nearByClinic;
  List<ServiceElement> featuredServices;
  List<AppointmentData> upcomingAppointment;
  List<Slider> slider;

  DashboardData({
    this.categories = const <CategoryElement>[],
    this.nearByClinic = const <Clinic>[],
    this.featuredServices = const <ServiceElement>[],
    this.upcomingAppointment = const <AppointmentData>[],
    this.slider = const <Slider>[],
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      categories: json['category'] is List ? List<CategoryElement>.from(json['category'].map((x) => CategoryElement.fromJson(x))) : [],
      upcomingAppointment: json['upcoming_appointment'] is List ? List<AppointmentData>.from(json['upcoming_appointment'].map((x) => AppointmentData.fromJson(x))) : [],
      nearByClinic: json['clinics'] is List ? List<Clinic>.from(json['clinics'].map((x) => Clinic.fromJson(x))) : [],
      featuredServices: json['featured_services'] is List ? List<ServiceElement>.from(json['featured_services'].map((x) => ServiceElement.fromJson(x))) : [],
      slider: json['slider'] is List ? List<Slider>.from(json['slider'].map((x) => Slider.fromJson(x))) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': categories.map((e) => e.toJson()).toList(),
      'upcoming_appointment': upcomingAppointment.map((e) => e.toJson()).toList(),
      'clinics': nearByClinic.map((e) => e.toJson()).toList(),
      'featured_services': featuredServices.map((e) => e.toJson()).toList(),
      'slider': slider.map((e) => e.toJson()).toList(),
    };
  }
}

class Slider {
  int id;
  String name;
  int status;
  String type;
  String link;
  int linkId;
  String sliderImage;

  Slider({
    this.id = -1,
    this.name = "",
    this.status = -1,
    this.type = "",
    this.link = "",
    this.linkId = -1,
    this.sliderImage = "",
  });

  factory Slider.fromJson(Map<String, dynamic> json) {
    return Slider(
      id: json['id'] is int ? json['id'] : -1,
      name: json['name'] is String ? json['name'] : "",
      status: json['status'] is int ? json['status'] : -1,
      type: json['type'] is String ? json['type'] : "",
      link: json['link'] is String ? json['link'] : "",
      linkId: json['link_id'] is int ? json['link_id'] : -1,
      sliderImage: json['slider_image'] is String ? json['slider_image'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'type': type,
      'link': link,
      'link_id': linkId,
      'slider_image': sliderImage,
    };
  }
}

class TaxPercentage {
  int id;
  String title;
  String type;
  num value;
  num? totalCalculatedValue;

  TaxPercentage({
    this.id = -1,
    this.title = "",
    this.type = "",
    this.value = -1,
    this.totalCalculatedValue,
  });

  factory TaxPercentage.fromJson(Map<String, dynamic> json) {
    return TaxPercentage(
      id: json['id'] is int ? json['id'] : -1,
      title: json['title'] is String ? json['title'] : "",
      type: json['type'] is String ? json['type'] : "",
      value: json['value'] is num ? json['value'] : -1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'value': value,
    };
  }
}

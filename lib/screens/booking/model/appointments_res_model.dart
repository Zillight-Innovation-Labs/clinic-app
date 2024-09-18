import '../../../utils/constants.dart';
import '../../home/model/dashboard_res_model.dart';
import 'appointment_detail_res.dart';
import 'employee_review_data.dart';

class AppointmentListRes {
  bool status;
  List<AppointmentData> data;
  String message;

  AppointmentListRes({
    this.status = false,
    this.data = const <AppointmentData>[],
    this.message = "",
  });

  factory AppointmentListRes.fromJson(Map<String, dynamic> json) {
    return AppointmentListRes(
      status: json['status'] is bool ? json['status'] : false,
      data: json['data'] is List ? List<AppointmentData>.from(json['data'].map((x) => AppointmentData.fromJson(x))) : [],
      message: json['message'] is String ? json['message'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((e) => e.toJson()).toList(),
      'message': message,
    };
  }
}

class AppointmentData {
  int id;
  String status;
  String startDateTime;
  int userId;
  String userName;
  String userImage;
  String userMobile;
  String userPhone;
  int clinicId;
  String clinicName;
  int doctorId;
  String doctorName;
  String doctorImage;
  String doctorMobile;
  String doctorPhone;
  String appointmentDate;
  String appointmentTime;
  String endTime;
  int duration;
  int serviceId;
  String serviceName;
  String serviceType;
  String serviceImage;
  String appointmentExtraInfo;
  num totalAmount;
  num servicePrice;
  String discountType;
  num discountValue;
  num discountAmount;
  num subtotal;
  num totalTax;
  String paymentStatus;
  String googleLink;
  String zoomLink;
  List<MedicalReport> medicalReport;
  int encounterId;
  String encounterDescription;
  bool encounterStatus;
  List<TaxPercentage> tax;
  DoctorReviewData? reviews;
  int createdBy;
  int updatedBy;
  int deletedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;

  /// Option key from api
  num serviceAmount;

  AppointmentData({
    this.id = -1,
    this.status = "",
    this.startDateTime = "",
    this.userId = -1,
    this.userName = "",
    this.userImage = "",
    this.userMobile = "",
    this.userPhone = "",
    this.clinicId = -1,
    this.clinicName = "",
    this.doctorId = -1,
    this.doctorName = "",
    this.doctorImage = "",
    this.doctorMobile = "",
    this.doctorPhone = "",
    this.appointmentDate = "",
    this.appointmentTime = "",
    this.endTime = "",
    this.duration = -1,
    this.serviceId = -1,
    this.serviceName = "",
    this.serviceType = "",
    this.serviceImage = "",
    this.appointmentExtraInfo = "",
    this.totalAmount = 0,
    this.servicePrice = 0,
    this.discountType = "",
    this.discountValue = 0.0,
    this.discountAmount = 0,
    this.subtotal = 0,
    this.totalTax = 0,
    this.paymentStatus = PaymentStatus.pending,
    this.googleLink = "",
    this.zoomLink = "",
    this.medicalReport = const <MedicalReport>[],
    this.encounterId = -1,
    this.encounterDescription = "",
    this.encounterStatus = false,
    this.tax = const <TaxPercentage>[],
    this.reviews,
    this.createdBy = -1,
    this.updatedBy = -1,
    this.deletedBy = -1,
    this.createdAt = "",
    this.updatedAt = "",
    this.deletedAt = "",
    this.serviceAmount = 0,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
      id: json['id'] is int ? json['id'] : -1,
      status: json['status'] is String ? json['status'] : "",
      startDateTime: json['start_date_time'] is String ? json['start_date_time'] : "",
      userId: json['user_id'] is int ? json['user_id'] : -1,
      userName: json['user_name'] is String ? json['user_name'] : "",
      userImage: json['user_image'] is String ? json['user_image'] : "",
      userMobile: json['user_mobile'] is String ? json['user_mobile'] : "",
      userPhone: json['user_phone'] is String ? json['user_phone'] : "",
      clinicId: json['clinic_id'] is int ? json['clinic_id'] : -1,
      clinicName: json['clinic_name'] is String ? json['clinic_name'] : "",
      doctorId: json['doctor_id'] is int ? json['doctor_id'] : -1,
      doctorName: json['doctor_name'] is String ? json['doctor_name'] : "",
      doctorImage: json['doctor_image'] is String ? json['doctor_image'] : "",
      doctorMobile: json['doctor_mobile'] is String ? json['doctor_mobile'] : "",
      doctorPhone: json['doctor_phone'] is String ? json['doctor_phone'] : "",
      appointmentDate: json['appointment_date'] is String ? json['appointment_date'] : "",
      appointmentTime: json['appointment_time'] is String ? json['appointment_time'] : "",
      endTime: json['end_time'] is String ? json['end_time'] : "",
      duration: json['duration'] is int ? json['duration'] : -1,
      serviceId: json['service_id'] is int ? json['service_id'] : -1,
      serviceName: json['service_name'] is String ? json['service_name'] : "",
      serviceType: json['service_type'] is String ? json['service_type'] : "",
      serviceImage: json['service_image'] is String ? json['service_image'] : "",
      appointmentExtraInfo: json['appointment_extra_info'] is String ? json['appointment_extra_info'] : "",
      totalAmount: json['total_amount'] is num ? json['total_amount'] : 0,
      servicePrice: json['service_price'] is num ? json['service_price'] : 0,
      discountType: json['discount_type'] is String ? json['discount_type'] : "",
      discountValue: json['discount_value'] is num ? json['discount_value'] : 0.0,
      discountAmount: json['discount_amount'] is num ? json['discount_amount'] : 0,
      subtotal: json['subtotal'] is num ? json['subtotal'] : 0,
      totalTax: json['total_tax'] is num ? json['total_tax'] : 0,
      paymentStatus: json['payment_status'] is int
          ? json['payment_status'] == 1
              ? PaymentStatus.PAID
              : json['payment_status'] == 0
                  ? PaymentStatus.pending
                  : PaymentStatus.failed
          : PaymentStatus.failed,
      googleLink: json['google_link'] is String ? json['google_link'] : "",
      zoomLink: json['zoom_link'] is String ? json['zoom_link'] : "",
      medicalReport: json['medical_report'] is List ? List<MedicalReport>.from(json['medical_report'].map((x) => MedicalReport.fromJson(x))) : [],
      encounterId: json['encounter_id'] is int ? json['encounter_id'] : -1,
      encounterDescription: json['encounter_description'] is String ? json['encounter_description'] : "",
      encounterStatus: json['encounter_status'] is int
          ? json['encounter_status'] == 1
              ? true
              : false
          : false,
      tax: json['tax'] is List ? List<TaxPercentage>.from(json['tax'].map((x) => TaxPercentage.fromJson(x))) : [],
      reviews: json['reviews'] is Map ? DoctorReviewData.fromJson(json['reviews']) : null,
      createdBy: json['created_by'] is int ? json['created_by'] : -1,
      updatedBy: json['updated_by'] is int ? json['updated_by'] : -1,
      deletedBy: json['deleted_by'] is int ? json['deleted_by'] : -1,
      createdAt: json['created_at'] is String ? json['created_at'] : "",
      updatedAt: json['updated_at'] is String ? json['updated_at'] : "",
      deletedAt: json['deleted_at'] is String ? json['deleted_at'] : "",
      serviceAmount: json['service_amount'] is num ? json['service_amount'] : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'start_date_time': startDateTime,
      'user_id': userId,
      'user_name': userName,
      'user_image': userImage,
      'user_mobile': userMobile,
      'user_phone': userPhone,
      'clinic_id': clinicId,
      'clinic_name': clinicName,
      'doctor_id': doctorId,
      'doctor_name': doctorName,
      'doctor_image': doctorImage,
      'doctor_mobile': doctorMobile,
      'doctor_phone': doctorPhone,
      'appointment_date': appointmentDate,
      'appointment_time': appointmentTime,
      'end_time': endTime,
      'duration': duration,
      'service_id': serviceId,
      'service_name': serviceName,
      'service_type': serviceType,
      'service_image': serviceImage,
      'appointment_extra_info': appointmentExtraInfo,
      'total_amount': totalAmount,
      'service_price': servicePrice,
      'discount_type': discountType,
      'discount_value': discountValue,
      'discount_amount': discountAmount,
      'subtotal': subtotal,
      'totalTax': totalTax,
      'payment_status': paymentStatus,
      'google_link': googleLink,
      'zoom_link': zoomLink,
      'medical_report': medicalReport.map((e) => e.toJson()).toList(),
      'encounter_id': encounterId,
      'encounter_description': encounterDescription,
      'encounter_status': encounterStatus,
      'tax': tax.map((e) => e.toJson()).toList(),
      if (reviews != null) 'customer_review': reviews!.toJson(),
      'created_by': createdBy,
      'updated_by': updatedBy,
      'deleted_by': deletedBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'service_amount': serviceAmount,
    };
  }
}

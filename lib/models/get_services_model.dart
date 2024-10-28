// ignore_for_file: prefer_null_aware_operators

class Package {
  final dynamic id;
  final dynamic serviceId;
  final String? name;
  final String? amount;
  final String? features;
  final String? createdAt;
  final String? updatedAt;

  Package({
    this.id,
    this.serviceId,
    this.name,
    this.amount,
    this.features,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      serviceId: json['service_id'],
      name: json['name'],
      amount: json['amount'],
      features: json['features'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'service_id': serviceId,
      'name': name,
      'amount': amount,
      'features': features,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Service {
  final dynamic id;
  final String? name;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  final List<Package>? packages;

  Service({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.packages,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    var packageList = json['packages'] as List?;
    List<Package>? packages =
        packageList != null ? packageList.map((i) => Package.fromJson(i)).toList() : null;

    return Service(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      packages: packages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'packages': packages?.map((i) => i.toJson()).toList(),
    };
  }
}

class GetServicesModel {
  final bool? success;
  final List<Service>? data;

  GetServicesModel({this.success, this.data});

  factory GetServicesModel.fromJson(Map<String, dynamic> json) {
    var serviceList = json['data'] as List?;
    List<Service>? services =
        serviceList != null ? serviceList.map((i) => Service.fromJson(i)).toList() : null;

    return GetServicesModel(
      success: json['success'],
      data: services,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.map((i) => i.toJson()).toList(),
    };
  }
}

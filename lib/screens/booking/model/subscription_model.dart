class SubscriptionModel {
  final dynamic id;
  final dynamic  memberId;
  final dynamic  packId;
  final String subscriptionType;
  final String amount;
  final String? paystackReference;
  final String paystackSubscriptionCode;
  final String paystackSubscriptionUrl;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Package package;

  SubscriptionModel({
    required this.id,
    required this.memberId,
    required this.packId,
    required this.subscriptionType,
    required this.amount,
    this.paystackReference,
    required this.paystackSubscriptionCode,
    required this.paystackSubscriptionUrl,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.package,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'],
      memberId: json['member_id'],
      packId: json['pack_id'],
      subscriptionType: json['subscription_type'],
      amount: json['amount'],
      paystackReference: json['paystack_reference'],
      paystackSubscriptionCode: json['paystack_subscription_code'],
      paystackSubscriptionUrl: json['paystack_subscription_url'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      package: Package.fromJson(json['package']),
    );
  }
}

class Package {
  final dynamic id;
  final dynamic serviceId;
  final String name;
  final String amount;
  final String features;
  final Service service;

  Package({
    required this.id,
    required this.serviceId,
    required this.name,
    required this.amount,
    required this.features,
    required this.service,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      serviceId: json['service_id'],
      name: json['name'],
      amount: json['amount'],
      features: json['features'],
      service: Service.fromJson(json['service']),
    );
  }
}

class Service {
  final dynamic id;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

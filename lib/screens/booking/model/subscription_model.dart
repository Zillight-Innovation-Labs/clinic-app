class SubscriptionModel {
  final int id;
  final String memberId;
  final String packId;
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'member_id': memberId,
      'pack_id': packId,
      'subscription_type': subscriptionType,
      'amount': amount,
      'paystack_reference': paystackReference,
      'paystack_subscription_code': paystackSubscriptionCode,
      'paystack_subscription_url': paystackSubscriptionUrl,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'package': package.toJson(),
    };
  }
}

class Package {
  final int id;
  final String serviceId;
  final String name;
  final String amount;
  final String features;

  Package({
    required this.id,
    required this.serviceId,
    required this.name,
    required this.amount,
    required this.features,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      serviceId: json['service_id'],
      name: json['name'],
      amount: json['amount'],
      features: json['features'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'service_id': serviceId,
      'name': name,
      'amount': amount,
      'features': features,
    };
  }
}

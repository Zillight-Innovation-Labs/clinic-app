class PaymentModel {
  String title;
  String desc;
  String serviceType;
  String price;
  String packageId;
  DateTime createdAt;

  PaymentModel({
    this.title = '',
    this.desc = '',
    this.serviceType = '',
    this.price = '',
    this.packageId = '',
   required this.createdAt,
  });
}

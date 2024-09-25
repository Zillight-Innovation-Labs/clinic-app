class PaymentModel {
  String title;
  String desc;
  String serviceType;
  String price;
  DateTime createdAt;

  PaymentModel({
    this.title = '',
    this.desc = '',
    this.serviceType = '',
    this.price = '',
   required this.createdAt,
  });
}

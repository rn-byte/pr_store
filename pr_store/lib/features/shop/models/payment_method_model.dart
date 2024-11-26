class PaymentMethodModel {
  String image;
  String name;

  PaymentMethodModel({required this.image, required this.name});

  static PaymentMethodModel empty() => PaymentMethodModel(image: '', name: '');
}

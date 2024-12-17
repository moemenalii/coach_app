class PaymentModel {
 final String paymentUrl;
 

  PaymentModel({
    required this.paymentUrl,
 
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      paymentUrl: json['session'],
   
    );
  }
  
}
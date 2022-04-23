class DebitCard {
  DebitCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardHolderName,
    this.bankName = 'My Bank',
    this.cardFront = true,
  });
  String cardNumber, expiryDate, cvv, cardHolderName, bankName;
  late final String id;
  bool cardFront;
}

class CardModel {
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String cardHolderName;
  final String bankName;
  final bool cardFront;

  CardModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardHolderName,
    this.bankName = 'My Bank',
    this.cardFront = true,
  });

  static fromJson(Map<String, dynamic> json) {
    return CardModel(
      cardNumber: json['cardNumber'],
      expiryDate: json['expiryDate'],
      cvv: json['cvv'],
      cardHolderName: json['cardHolderName'],
      bankName: json['bankName'],
      cardFront: json['cardFront'],
    );
  }

  toJson() {
    return {
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cvv': cvv,
      'cardHolderName': cardHolderName,
      'bankName': bankName,
      'cardFront': cardFront,
    };
  }
}

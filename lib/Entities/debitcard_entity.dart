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

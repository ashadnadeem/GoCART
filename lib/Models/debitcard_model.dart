class DebitCard {
  DebitCard(
      {required this.cardNumber,
      required this.expiryDate,
      required this.cvv,
      required this.cardHolderName,
      this.bankName = 'My Bank',
      this.cardFront = true});
  String cardNumber, expiryDate, cvv, cardHolderName, bankName;
  bool cardFront;
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'debitcard_model.dart';

class CardProvider extends ChangeNotifier {
  List<DebitCard> list = [];
  CollectionReference firebaseCard =
      FirebaseFirestore.instance.collection('cards');

  List<DebitCard> get Cards => list;

  void loadCard() async {
    list = [];
    await firebaseCard.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        CardModel cardModel =
            CardModel.fromJson(doc.data() as Map<String, dynamic>);
        DebitCard card = DebitCard(
          cardNumber: cardModel.cardNumber,
          expiryDate: cardModel.expiryDate,
          cvv: cardModel.cvv,
          cardHolderName: cardModel.cardHolderName,
          bankName: cardModel.bankName,
          cardFront: cardModel.cardFront,
        );
        card.id = doc.id;
        list.add(card);
        print(card.cardHolderName);
      });
    });
    notifyListeners();
  }

  void addCard(DebitCard card) async {
    // Convert Card to Card Model
    var newRef = await firebaseCard.add(
      CardModel(
        cardNumber: card.cardNumber,
        expiryDate: card.expiryDate,
        cvv: card.cvv,
        cardHolderName: card.cardHolderName,
        bankName: card.bankName,
        cardFront: card.cardFront,
      ).toJson(),
    );
    card.id = newRef.id;
    // Add to provider
    list.add(card);
    notifyListeners();
  }

  void deleteCard(DebitCard Card) {
    list.remove(Card);
    firebaseCard.doc(Card.id).delete();
    notifyListeners();
  }

  void updateCard(DebitCard card) async {
    await firebaseCard.doc(card.id).update(
          CardModel(
            cardNumber: card.cardNumber,
            expiryDate: card.expiryDate,
            cvv: card.cvv,
            cardHolderName: card.cardHolderName,
            bankName: card.bankName,
            cardFront: card.cardFront,
          ).toJson(),
        );
    notifyListeners();
  }
}

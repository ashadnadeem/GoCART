import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gocart/Models/debitcard_model.dart';

import '../Entities/debitcard_entity.dart';

class CardProvider extends ChangeNotifier {
  List<DebitCard> list = [];
  CollectionReference firebaseCard =
      FirebaseFirestore.instance.collection('cards');

  List<DebitCard> get Cards => list;

  void loadCard(cardIDs) async {
    list = [];
    // Get List of Cards from User Profile
    for (var id in cardIDs) {
      if (id == "") continue;
      var doc = await firebaseCard.doc(id).get();
      CardModel cardModel =
          CardModel.fromJson(doc.data() as Map<String, dynamic>);
      DebitCard card = DebitCard(
        cardNumber: cardModel.cardNumber,
        expiryDate: cardModel.expiryDate,
        cvv: cardModel.cvv,
        cardHolderName: cardModel.cardHolderName,
        bankName: cardModel.bankName,
        cardFront: true,
      );
      card.id = id;
      list.add(card);
    }
    notifyListeners();
  }

  Future<String> addCard(DebitCard card) async {
    // Convert Card to Card Model
    var newRef = await firebaseCard.add(
      CardModel(
        cardNumber: card.cardNumber,
        expiryDate: card.expiryDate,
        cvv: card.cvv,
        cardHolderName: card.cardHolderName,
        bankName: card.bankName,
        cardFront: true,
      ).toJson(),
    );
    card.id = newRef.id;
    // Add to provider
    list.add(card);
    notifyListeners();
    return newRef.id;
  }

  void deleteCard(DebitCard card) async {
    list.remove(card);
    await firebaseCard.doc(card.id).delete();
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
            cardFront: true,
          ).toJson(),
        );
    notifyListeners();
  }
}

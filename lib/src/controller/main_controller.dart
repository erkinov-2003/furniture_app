import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:furniture_app/src/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/card_model.dart';

class MainController extends ChangeNotifier {
  final service = FurnitureAuthService();

  List<CardModel> cardList = CardModel.cardList;

  List<CardModel> favoriteList = [];
  List<CardModel> get getCartList => favoriteList;

  List<CardModel> basketList = [];
  List<CardModel> get getBasketList => basketList;

  List<CardModel> get  searchCardList => List.from(cardList);


  Future basketSaveData(CardModel basketModel) async {
    basketList.add(basketModel);
    await basketSaveDb();
    notifyListeners();
  }

  Future indexBasketSaveData(CardModel model) async {
    basketList.add(model);
    notifyListeners();
  }

  Future deleteBasketList(CardModel model) async {
    basketList.remove(model);
    notifyListeners();
  }

  Future getAllSaveBasketList(CardModel models, int index) async {
    for (int i = 0; i < index; i++) {
      basketList.add(models);
      await basketSaveDb();
      notifyListeners();
    }
  }

  void searchCard(String query) {
    if (query.isNotEmpty) {
      cardList = cardList
          .where((card) => card.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      cardList = List.from(cardList);
    }
    notifyListeners();
  }


  Future deleteFavoriteList(CardModel model) async {
    favoriteList.remove(model);
    notifyListeners();
  }

  Future basketSaveDb() async {
    final share = await SharedPreferences.getInstance();
    List<String> basket =
        basketList.map((e) => jsonEncode(e.toJson())).toList();
    share.setStringList("basketList", basket);
  }

  Future favoriteSaveData(CardModel cartList) async {
    favoriteList.add(cartList);
    await saveFavoriteDb();
    notifyListeners();
  }

  Future saveFavoriteDb() async {
    final shared = await SharedPreferences.getInstance();
    List<String> saveData =
        favoriteList.map((e) => jsonEncode(e.toJson())).toList();
    shared.setStringList("favoriteList", saveData);
  }


  Future<void> saveCardList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> usersJson =
        cardList.map((card) => jsonEncode(card.toJson())).toList();
    prefs.setStringList('cardList', usersJson);
  }

  bool switchPage = true;

  void switchButton() {
    switchPage = !switchPage;
    notifyListeners();
  }

  void navigatorPage(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  int counterPrice = 1;

  void incrementCounter() {
    counterPrice ++;
    notifyListeners();
  }

  void decrementCounter() {
    counterPrice--;
    if(counterPrice < 0){
      counterPrice = 0;
    }
    notifyListeners();
  }
}

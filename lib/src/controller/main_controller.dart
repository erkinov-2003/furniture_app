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


  Future basketSaveData(CardModel basketModel) async {
    basketList.add(basketModel);
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
    notifyListeners();
  }

  Future saveFavoriteDb() async {
    final shared = await SharedPreferences.getInstance();
    List<String> saveData =
        favoriteList.map((e) => jsonEncode(e.toJson())).toList();
    shared.setStringList("favoriteList", saveData);
  }

  // Future<void> readCardList() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey('cardList')) {
  //     List<String> usersJson = prefs.getStringList('users')!;
  //     cardList = usersJson
  //         .map((userJson) => CardModel.fromJson(jsonDecode(userJson)))
  //         .toList();
  //     notifyListeners();
  //   }
  // }

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
}

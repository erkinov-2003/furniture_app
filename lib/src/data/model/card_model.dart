import 'package:furniture_app/src/core/constants/app_images.dart';

class CardModel {
  final String title;
  final String image;
  final String price;

  CardModel({
    required this.title,
    required this.image,
    required this.price,
  });

  static List<CardModel> cardList = [
    CardModel(
      title: "Black Simple Lamp",
      image: AppImages.mebel4,
      price: "\$ 12.00",
    ),
    CardModel(
      title: "Minimal Stand",
      image: AppImages.mebel1,
      price: "\$ 25.00",
    ),
    CardModel(
      title: "Coffee Chair",
      image: AppImages.mebel3,
      price: "\$ 20.00",
    ),
    CardModel(
      title: "Simple Desk",
      image: AppImages.mebel2,
      price: "\$ 50.00",
    ),
  ];
}

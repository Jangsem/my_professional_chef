import 'package:flutter/cupertino.dart';

class Gericht {

  String name;
  String zutaten;
  String beschreibung;
  bool isFavorite;
  String imageURL;

  Gericht({
    required this.name,
    required this.zutaten,
    required this.beschreibung,
    required this.isFavorite,
    required this.imageURL});

  String getName(){
    return name;
  }
  String getZutaten(){
    return zutaten;
  }
  String getBeschreibung(){
    return beschreibung;
  }
  String getImageURL(){
    return imageURL;
  }
}


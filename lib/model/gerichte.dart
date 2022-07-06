import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_professional_chef/model/gericht.dart';

class Gerichte extends ChangeNotifier {
  late List<Gericht> _gerichte;

  Gerichte(){
    _gerichte = [
      Gericht(name: "Carbonara", zutaten: "zutaten", beschreibung: "Beste Spaghetti", isFavorite: true, imageURL: 'assets/images/carbonara.jpg',),
      Gericht(name: "Margherita", zutaten: "zutaten", beschreibung: "Beste Pizza", isFavorite: true, imageURL: 'assets/images/margherita.jpg',),
      Gericht(name: "Cheeseburger ", zutaten: "zutaten", beschreibung: "Beste Burger", isFavorite: true, imageURL: 'assets/images/cheeseburger.png',),
      Gericht(name: "Momo", zutaten: "zutaten", beschreibung: "Beste baba tschok", isFavorite: true, imageURL: 'assets/images/momo.png',)

    ];
  }

  List<Gericht> get getgericht => List.unmodifiable(_gerichte);

  Gericht get gericht =>
      _gerichte[Random().nextInt(_gerichte.length)];

  add(Gericht gericht){
    _gerichte.add(gericht);
    notifyListeners();
  }
}
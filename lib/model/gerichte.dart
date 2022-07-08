import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_professional_chef/model/gericht.dart';

class Gerichte extends ChangeNotifier {
  late List<Gericht> _gerichte;

  Gerichte(){
    _gerichte = [
      Gericht(name: "Carbonara", zutaten: "Spaghetti, Sauce, Fleisch", beschreibung: "Beste Spaghetti", isFavorite: false, imageURL: 'assets/images/carbonara.jpg',),
      Gericht(name: "Margherita", zutaten: "Teig, Wasser, Tomatensauce", beschreibung: "Beste Pizza", isFavorite: false, imageURL: 'assets/images/margherita.jpg',),
      Gericht(name: "Cheeseburger ", zutaten: "Käsescheibe, Burgerbrot, Patty", beschreibung: "Beste Burger", isFavorite: true, imageURL: 'assets/images/cheeseburger.png',),
      Gericht(name: "Momo", zutaten: "Fleisch/Vegi, Teig, Wasser", beschreibung: "Beste baba tschok", isFavorite: true, imageURL: 'assets/images/momo.png',)

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
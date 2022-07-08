import 'package:flutter/material.dart';
import 'package:my_professional_chef/model/gericht.dart';

class ZutatenPage extends StatelessWidget {
  const ZutatenPage({super.key, required this.gericht});

  final Gericht gericht;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zutaten für " + gericht.name),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(16.0)),
            Container(
                child: Image.asset(gericht.getImageURL()),
              height: 350,
              width: 350,
            ),
            Text("Berschreibung: "+gericht.getBeschreibung()),
            Text("Zutaten: "+gericht.getZutaten()),
          ],
        ),
      ),
    );
  }
}

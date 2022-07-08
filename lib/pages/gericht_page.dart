import 'package:flutter/material.dart';
import 'package:my_professional_chef/pages/zutaten_page.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';

import '../model/gericht.dart';
import '../model/gerichte.dart';

class GerichtPage extends StatefulWidget {
  @override
  _GerichtPageState createState() => _GerichtPageState();
}

class _GerichtPageState extends State<GerichtPage> {
  bool click = true;

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(onPhoneShake: forceRedraw);
  }

  forceRedraw() {
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    Gerichte gerichte = Provider.of<Gerichte>(context);
    Gericht gericht = gerichte.gericht;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 5.0,
        centerTitle: true,
        title: Text("Gerichte"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                height: 350,
                width: 350,
                child: Image.asset(gericht.getImageURL())),
            SizedBox(
              child: Text(gericht.getName() + "\n" + gericht.getBeschreibung()),
            ),
            Expanded(child: buildButtons(context, gericht)),
          ],
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context, Gericht gericht) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ZutatenPage(gericht: gericht),
                ),
              );
            },
            color: Colors.lightBlue,
            child: Text("Zutaten"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            overlayColor: getColor(Colors.white, Colors.red),
          ),
          onPressed: () {
            if (gericht.isFavorite) {
              gericht.isFavorite = false;
            } else {
              gericht.isFavorite = true;
            }
          },
          child: Icon(
            Icons.favorite,
            size: 30,
          ),
        ),
      ],
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }
}

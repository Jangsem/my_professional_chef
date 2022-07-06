import 'package:flutter/material.dart';
import 'package:my_professional_chef/pages/home_page.dart';
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
    var gerichte = Provider.of<Gerichte>(context);
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
              child: Text(gericht.getName()+"\n"+gericht.getBeschreibung()),
            ),
          ],
        ),

      ),
    );
  }

  Widget buildRezept(BuildContext context) {
    return Row(
      children: [
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ZutatenPage();
              }),
            );
          },
          color: Colors.lightBlue,
          child: Text("Rezept"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ZutatenPage();
              }),
            );
          },
          color: Colors.lightBlue,
          child: Icon(Icons.favorite),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        )
      ],
    );
  }


}

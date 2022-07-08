import 'package:flutter/material.dart';
import 'package:my_professional_chef/pages/einfuegung_page.dart';
import 'package:my_professional_chef/pages/favoriten_page.dart';
import 'package:my_professional_chef/pages/gericht_page.dart';
import 'package:shake/shake.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ShakeDetector.autoStart(onPhoneShake: forceRedraw);

    super.initState();
  }

  forceRedraw() {
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("My professional Chef"),
        ),
      ),
      body: Center(
        child: Column(children: [
          Container(
              height: 400,
              width: 400,
              child: Image.asset('assets/images/chefkoch.png')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 120,
              height: 40,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return EinfuegungPage();
                    }),
                  );
                },
                child: Text("Einfügen"),
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 120,
              height: 40,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return GerichtPage();
                    }),
                  );
                },
                child: Text("Gerichte"),
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 120,
              height: 40,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FavoritenPage();
                    }),
                  );
                },
                child: Text("Favoritenliste"),
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

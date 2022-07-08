import 'package:flutter/material.dart';
import 'package:my_professional_chef/pages/zutaten_page.dart';
import 'package:provider/provider.dart';

import '../model/gericht.dart';
import '../model/gerichte.dart';

class FavoritenPage extends StatefulWidget {
  @override
  _FavoritenPageState createState() => _FavoritenPageState();
}

class _FavoritenPageState extends State<FavoritenPage> {
  late List<Gericht> favoriten = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Favoritenliste"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: favoritenList(context)),
          ],
        ),
      ),
    );
  }

  Widget favoritenList(BuildContext context) {
    var gerichte = Provider.of<Gerichte>(context);
    for (var i = 0; i < gerichte.getgericht.length; i++) {
      if (gerichte.getgericht[i].isFavorite) {
        favoriten.add(gerichte.getgericht[i]);
      }
    }
    return ListView.builder(
        itemCount: favoriten.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                  (index + 1).toString() + ". " + favoriten[index].getName()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ZutatenPage(gericht: favoriten[index]),
                  ),
                );
              },
            ),
          );
        });
  }

//
}

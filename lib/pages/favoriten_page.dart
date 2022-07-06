import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/gerichte.dart';

class FavoritenPage extends StatefulWidget{
  @override
  _FavoritenPageState createState() => _FavoritenPageState();

}

class _FavoritenPageState extends State<FavoritenPage>{
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
            Expanded(child: gerichtList(context)),
          ],
        ),
      ),
    );
  }
  Widget gerichtList(BuildContext context){
    var gerichte = Provider.of<Gerichte>(context);
    return ListView.builder(
      itemCount: gerichte.getgericht.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text((index+1).toString() + ". " +gerichte.getgericht[index].name),
          ),
        );
      }
    );
  }

  //
}
import 'package:flutter/material.dart';
import 'package:my_professional_chef/model/gerichte.dart';
import 'package:my_professional_chef/pages/gericht_page.dart';
import 'package:my_professional_chef/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  Gerichte data = Gerichte();
  runApp(MyApp(data));
}

class MyApp extends StatelessWidget {
  final Gerichte data;
  MyApp(this.data, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Gerichte>(
      create: (_) => data,
      child: MaterialApp(
      title: 'My professional Chef',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    )
    );
  }
}




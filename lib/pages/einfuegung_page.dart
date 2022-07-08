import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:my_professional_chef/model/gericht.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/gerichte.dart';

class EinfuegungPage extends StatefulWidget {
  const EinfuegungPage({super.key});

  @override
  _EinfuegungPageState createState() => _EinfuegungPageState();
}

class _EinfuegungPageState extends State<EinfuegungPage> {
  final ctrlName = TextEditingController();
  final ctrlBeschreibung = TextEditingController();
  final ctrlZutaten = TextEditingController();

  final String imagefolder = "assets/bilder";
  late File _image;
  late String _imagepath;

  Future pickImage() async {
    var image =
        (await ImagePicker().pickImage(source: ImageSource.gallery)) as File;
    if (image == null) return;
    final File newImage = await image.copy(imagefolder+"/kebab.jpg");
    _imagepath = imagefolder+"/kebab.jpg";
    setState(() {
      _image = newImage;
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Gerichte gerichte = Provider.of<Gerichte>(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Einfügen"),
          ),
        ),
        body: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: ctrlName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please, please";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Name des Gerichts",
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.2),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: ctrlBeschreibung,
                    decoration: InputDecoration(
                        hintText: "Beschreibung",
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.2),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: ctrlZutaten,
                    decoration: InputDecoration(
                        hintText: "Zutaten",
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.2),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  SizedBox(
                      child: ElevatedButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: Text("Bild auswählen"),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (ctrlName.text.isEmpty) return;
                        if (ctrlBeschreibung.text.isEmpty) return;
                        if (ctrlZutaten.text.isEmpty) return;
                        final sound = AudioPlayer();
                        sound.play(
                            DeviceFileSource("assets/sounds/confirmation.mp3"));
                        Gericht gericht = Gericht(
                            name: ctrlName.text,
                            zutaten: ctrlZutaten.text,
                            beschreibung: ctrlBeschreibung.text,
                            isFavorite: true,
                            imageURL: "_imagepath");
                        gerichte.add(gericht);
                        ctrlZutaten.clear();
                        ctrlBeschreibung.clear();
                        ctrlName.clear();
                      },
                      child: Text("Submit"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

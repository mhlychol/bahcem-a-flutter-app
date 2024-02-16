import 'package:bahcem/models/sebzeler.dart';
import 'package:flutter/material.dart';
import 'package:bahcem/components/Sebze_tile.dart';
import 'package:bahcem/services/sebzeservice.dart';

class SebzelistSayfa extends StatefulWidget {
  const SebzelistSayfa({super.key});

  @override
  State<SebzelistSayfa> createState() => _SebzelistSayfaState();
}

class _SebzelistSayfaState extends State<SebzelistSayfa> {
  final TextEditingController _textController = TextEditingController();
  List<Sebze> displayedSebzeler = [];

  @override
  void initState() {
    super.initState();
    displayedSebzeler = JsonService.sebzeMenu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 66, 66, 66),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Icon(
              Icons.grass,
              color: Color.fromARGB(255, 0, 205, 24),
              size: 30,
            ),
            const SizedBox(width: 8),
            const Text(
              "Bahçem'in Sebzeleri",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textController,
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    displayedSebzeler = JsonService.sebzeMenu;
                  } else {
                    String lowercaseValue = value.toLowerCase();
                    displayedSebzeler = JsonService.sebzeMenu
                        .where((sebze) =>
                            sebze.ad.toLowerCase().contains(lowercaseValue))
                        .toList();
                  }
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal:
                        18), // Yüksekliği değiştirmek için bu satırı ekledik

                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          /*const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Sebzeler",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color.fromARGB(223, 0, 234, 255)),
            ),
          ),*/
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: displayedSebzeler.length,
              itemBuilder: (context, index) {
                return SebzeTile(sebze: displayedSebzeler[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:bahcem/components/bottomnavigationbar.dart';
import 'package:bahcem/screens/favorisayfa.dart';
import 'package:bahcem/services/auth_service.dart';
import 'package:bahcem/screens/uyganasayfa.dart';
import 'package:flutter/material.dart';

import 'package:bahcem/services/sebzeservice.dart';
import 'package:bahcem/components/zararliliste.dart';
import 'package:bahcem/models/zararlilar.dart';


class ZararlilistSayfa extends StatefulWidget {
  const ZararlilistSayfa({Key? key});

  @override
  State<ZararlilistSayfa> createState() => _ZararlilistSayfaState();
}

class _ZararlilistSayfaState extends State<ZararlilistSayfa> {
  final TextEditingController _textController = TextEditingController();
  List<Zararli> displayedZararlilar = [];
  int _currentIndex = 0;
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Handle tab selections as needed
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UygulamaAnasayfa()),
      );
    } else if (index == 1) {
 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FavoriSayfa()),
    );    } else if (index == 2) {
      AuthService().signOut(context);
    }
  }

  @override
  void initState() {
    super.initState();
    displayedZararlilar = JsonService.zararliMenu;
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
              "Bahçe Zararlıları",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
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
                    displayedZararlilar = JsonService.zararliMenu;
                  } else {
                    String lowercaseValue = value.toLowerCase();
                    displayedZararlilar = JsonService.zararliMenu
                        .where((zararli) =>
                            zararli.zararliadi.toLowerCase().contains(lowercaseValue) ||
                            zararli.zararbitki.any((bitki) => bitki.toLowerCase().contains(lowercaseValue)))
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
              itemCount: displayedZararlilar.length,
              itemBuilder: (context, index) {
                return Zararliliste(zararli: displayedZararlilar[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

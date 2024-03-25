import 'package:bahcem/screens/bitkihastaliklistsayfa.dart';
import 'package:bahcem/screens/zararlilistsayfa.dart';
import 'package:flutter/material.dart';
import 'package:bahcem/screens/sebzelistsayfa.dart';

class UygMenu extends StatelessWidget {
  const UygMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SebzelistSayfa()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(25),
                elevation: 5,
              ),
              child: const Text(
                'Sebzeler',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)), // Buton metninin rengi
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ZararlilistSayfa()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(25),
                elevation: 5,
              ),
              child: const Text(
                'Bahçe Zararlıları',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)), // Buton metninin rengi
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HastaliklistSayfa()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(25),
                elevation: 5,
              ),
              child: const Text(
                'Bitki Hastalıkları',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)), // Buton metninin rengi
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                // Butona tıklama işlemi burada yapabilirsiniz.
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(25),
                elevation: 5,
              ),
              child: const Text(
                'Kış Bahçesi',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)), // Buton metninin rengi
              ),
            ),
          ),
        ],
      ),
    );
  }
}

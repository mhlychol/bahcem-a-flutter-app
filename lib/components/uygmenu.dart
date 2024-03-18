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
          ElevatedButton(
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
            ),
            child: const Text('Sebzeler'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Butona tıklama işlemi burada yapabilirsiniz.
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(25),
            ),
            child: const Text('Toprak Bakımı'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Butona tıklama işlemi burada yapabilirsiniz.
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(25),
            ),
            child: const Text('Doğal Bitki Koruma'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Butona tıklama işlemi burada yapabilirsiniz.
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(25),
            ),
            child: const Text('Kış Bahçesi'),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

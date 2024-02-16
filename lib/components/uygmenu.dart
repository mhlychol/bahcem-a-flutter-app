import 'package:flutter/material.dart';
import 'package:bahcem/screens/sebzelistsayfa.dart';

class UygMenu extends StatelessWidget {
  const UygMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            GridView.count(
              padding: EdgeInsets.all(8),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  child: const Text('Sebzeler'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Butona tıklama işlemi burada yapabilirsiniz.
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  child: const Text('Toprak Bakımı'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Butona tıklama işlemi burada yapabilirsiniz.
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  child: const Text('Doğal Bitki Koruma'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Butona tıklama işlemi burada yapabilirsiniz.
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  child: const Text('Kış Bahçesi'),
                ),
              ],
            ),
            SizedBox(height: 3),
          ],
        );
      },
    );
  }
}

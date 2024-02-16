import 'package:bahcem/models/sebzeler.dart';
import 'package:bahcem/screens/sebzedetay.dart';
import 'package:flutter/material.dart';

class SebzeTile extends StatelessWidget {
  final Sebze sebze;
  const SebzeTile({super.key, required this.sebze});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SebzedetaySayfa(selectedSebze: sebze),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(  
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 100,
              child: ClipOval(
                child: Image.asset(
                  sebze.imagePath,
                  height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sebze.ad,
                          style: TextStyle(
                            color: Colors.green[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          sebze.dikimAyi.join(', '),
                          style: TextStyle(
                            color: Colors.green[150],
                            fontSize: 10,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      sebze.aciklama,
                      style: const TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

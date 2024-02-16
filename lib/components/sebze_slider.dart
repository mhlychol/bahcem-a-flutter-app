import 'package:bahcem/models/sebzeler.dart';
import 'package:flutter/material.dart';

class KareSebzeTile extends StatelessWidget {
  final Sebze sebze;
  const KareSebzeTile({super.key, required this.sebze});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5), 
      decoration: BoxDecoration(  
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      width: 100, 
      height: 100, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              sebze.imagePath,
              height: 100, 
              width: 100,
              fit: BoxFit.cover,
            ),
          ),

          Text(
            sebze.ad,
            style: const TextStyle(
              color: Color.fromARGB(255, 6, 75, 9),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

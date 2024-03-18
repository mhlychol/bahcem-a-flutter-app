import 'package:bahcem/components/sebzedetay_component.dart';
import 'package:flutter/material.dart';
import 'package:bahcem/models/sebzeler.dart';
import 'package:bahcem/components/bottomnavigationbar.dart';
import 'package:bahcem/services/auth_service.dart';

class SebzedetaySayfa extends StatelessWidget {
  final Sebze selectedSebze;
  const SebzedetaySayfa({super.key, required this.selectedSebze});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              "Bahçem'den ${selectedSebze.ad}",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 66, 66, 66),

      // ... Diğer widget özellikleri ...
      body: Column(
        children: [
          // ... Diğer widget özellikleri ...
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Sebzedetaycomp(
                  sebze: selectedSebze,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

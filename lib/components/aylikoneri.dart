import 'package:flutter/material.dart';
import 'package:bahcem/components/sebze_slider.dart';
import 'package:intl/intl.dart';
import 'package:bahcem/services/sebzeservice.dart';
import 'package:bahcem/screens/sebzedetay.dart';

class Aylikoneri extends StatelessWidget {
  const Aylikoneri({super.key});

  @override
  Widget build(BuildContext context) {
    //mevcut ay
    final currentMonth = DateFormat('MMMM', 'tr_TR').format(DateTime.now());

    // mevcut ayın sebzeleri
    final matchingSebzeler = JsonService.sebzeMenu.where((sebze) {
      return sebze.dikimAyi.contains(currentMonth);
    }).toList();

    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10, right: 10),
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(173, 213, 213, 213),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${DateFormat.MMMM('tr_TR').format(DateTime.now())} ayı için öneriler",
                textAlign: TextAlign.center, // Metni ortala
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: matchingSebzeler.length,
                  itemBuilder: (context, index) {
                    final sebze = matchingSebzeler[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SebzedetaySayfa(selectedSebze: sebze),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 120, 
                        child: KareSebzeTile(
                          sebze: sebze,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

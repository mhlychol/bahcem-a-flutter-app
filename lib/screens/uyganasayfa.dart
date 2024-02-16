import 'package:flutter/material.dart';
import 'package:bahcem/components/bottomnavigationbar.dart';
import 'package:bahcem/services/auth_service.dart';
import 'package:bahcem/components/anasayfa_component.dart';
//import 'package:bahcem/components/aylikoneri.dart';
//import 'package:bahcem/components/uygmenu.dart';
//import 'package:bahcem/screens/giris.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:bahcem/components/uygmenu.dart';

class UygulamaAnasayfa extends StatefulWidget {
  const UygulamaAnasayfa({super.key});

  @override
  _UygulamaAnasayfaState createState() => _UygulamaAnasayfaState();
}

class _UygulamaAnasayfaState extends State<UygulamaAnasayfa> {
  int _currentIndex = 0; // Move _currentIndex inside the state class

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Handle tab selections as needed
    if (index == 0) {
      // Handle "Anasayfa" tab
    } else if (index == 1) {
      // Handle "Profil" tab
    } else if (index == 2) {
      AuthService().signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 66, 66, 66),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
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
              "Bahçem'den",
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
      body: const Center(child: AnasayfaComponent()
          // Ana içeriği buraya ekleyebilirsiniz.
          ),
          
      // Ekstra Scaffold özelliklerini burada ekleyebilirsiniz.
    );
  }
}

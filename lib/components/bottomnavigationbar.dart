import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Color.fromARGB(255, 230, 13, 13), 
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Anasayfa",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favoriler",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app),
          label: "Çıkış",
        ),
        
      ],
    );
  }
}

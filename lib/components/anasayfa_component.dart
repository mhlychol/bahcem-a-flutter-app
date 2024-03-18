import 'package:flutter/material.dart';
import 'package:bahcem/components/aylikoneri.dart';
import 'package:bahcem/components/uygmenu.dart';
import 'package:bahcem/components/havadurumu_component.dart';

//import 'package:bahcem/screens/uyganasayfa.dart';
//import 'package:bahcem/components/sebze_slider.dart';

class AnasayfaComponent extends StatelessWidget {
  const AnasayfaComponent({super.key});
@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              WeatherComponent(),
              SizedBox(height: 5),
              Aylikoneri(), // AylikOneri widgetini ekliyoruz
              SizedBox(height: 5),
              UygMenu(),
            ],
          ),
         
        ],
      ),
    );
  }
}

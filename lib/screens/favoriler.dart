import 'package:bahcem/components/favoriler_component.dart';
import 'package:flutter/material.dart';


class BitkiTakipListesiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitki Takip Listesi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Geri butonuna basıldığında _onTabTapped fonksiyonunu çağırarak _currentIndex'i 0 olarak ayarla
            _onTabTapped(context, 0);
            // veya Navigator.of(context).pop();
          },
        ),
      ),
      body: BitkiTakipListesiComponent(),
    );
  }

  void _onTabTapped(BuildContext context, int index) {
    final _currentIndex = index;
    Navigator.pop(context);
  }
}

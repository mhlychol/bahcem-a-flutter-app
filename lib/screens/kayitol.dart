import 'package:bahcem/services/auth_service.dart';
import 'package:bahcem/utils/locator.dart';
import 'package:flutter/material.dart';

class KayitEkrani extends StatefulWidget {
  const KayitEkrani({super.key});

  @override
  _KayitEkraniState createState() => _KayitEkraniState();
}


final _tName = TextEditingController();
final _tEmail = TextEditingController();
final _tPassword = TextEditingController();

class _KayitEkraniState extends State<KayitEkrani> {
  TextEditingController kullaniciAdiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();
/*
  void _kayitOl() {
    if (kullaniciAdiController.text.isEmpty ||
        emailController.text.isEmpty ||
        sifreController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Kayıt Başarısız'),
            content:
                Text('Kayıt işlemi başarısız oldu. Lütfen tekrar deneyin.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    } else {
      locator.get<AuthService>().signUp(
          name: kullaniciAdiController.text,
          email: emailController.text,
          password: sifreController.text);
      kayitDurumu = true; // Set kayitDurumu to true when all fields are filled.
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => UygulamaAnasayfa()));
    }
  }
*/
void _kayitOl() async {
  try {
      await locator.get<AuthService>().signUp(context,
        name: kullaniciAdiController.text,
        email: emailController.text,
        password: sifreController.text,
      );
      //Navigator.push(context,MaterialPageRoute(builder: (context) => UygulamaAnasayfa()));
      
    } catch (e) {
      print('Error during registration: $e');
    }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıt Ekranı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: kullaniciAdiController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: sifreController,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.blue,
              ),
              child: TextButton(
                onPressed: _kayitOl,
                child: const Text(
                  'Kayıt Ol',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

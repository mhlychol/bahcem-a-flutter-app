import 'package:bahcem/screens/uyganasayfa.dart';
import 'package:flutter/material.dart';
import 'package:bahcem/screens/kayitol.dart';
import 'package:bahcem/screens/sifresifirla.dart';
import 'package:bahcem/utils/locator.dart';
import 'package:bahcem/services/auth_service.dart';


class GirisEkrani extends StatefulWidget {
  const GirisEkrani({super.key});

  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

bool giriskontrol = false;

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController emailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();
  void _girisYap() async {
    try {
      await locator.get<AuthService>().signIn(
            context,
            email: emailController.text,
            password: sifreController.text,
          );
      //Navigator.push(context,MaterialPageRoute(builder: (context) => UygulamaAnasayfa()));
    } catch (e) {
      print('Kayıt olurken hata olustu: $e');
    }
  }

  /* void _girisYap() {if (
      emailController.text.isEmpty ||
      sifreController.text.isEmpty) {
    giriskontrol = false; // Set kayitDurumu to false when any field is empty.
  } else {
    locator.get<AuthService>().signIn(context,email: emailController.text, password: sifreController.text);
    giriskontrol = true; // Set kayitDurumu to true when all fields are filled.
  }

  if (giriskontrol == true) {
    // Rest of your code for successful registration
    //Navigator.push(context, MaterialPageRoute(builder: (context) => UygulamaAnasayfa()));
  } else {
    // Kayıt başarısız ise hata mesajını göster
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Giris Başarısız'),
          content: Text('Giris işlemi başarısız oldu. Lütfen tekrar deneyin.'),
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
  }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Ekranı'),
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.green,
                  ),
                  child: TextButton(
                    onPressed: _girisYap,
                    child: const Text(
                      'Giriş Yap',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 6, 123, 241),
                    borderRadius: BorderRadius.circular(12.0),
                    ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UygulamaAnasayfa()));
                    },
                    child: const Text(
                      'Anonim olarak giriş yap',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.red,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KayitEkrani()));
                    },
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
            const SizedBox(height: 16.0),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SifreSifirlaEkrani()));
                },
                child: const Text(
                  'Şifremi Unuttum',
                  style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.underline,
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

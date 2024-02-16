import 'package:bahcem/services/auth_service.dart';
import 'package:bahcem/utils/locator.dart';
import 'package:flutter/material.dart';

class SifreSifirlaEkrani extends StatefulWidget {
  const SifreSifirlaEkrani({super.key});

  @override
  _SifreSifirlaEkraniState createState() => _SifreSifirlaEkraniState();
}

class _SifreSifirlaEkraniState extends State<SifreSifirlaEkrani> {
  TextEditingController emailController = TextEditingController();

  void _sifreSifirla() {
    // Burada şifre sıfırlama işlemleri yapılabilir.
    // Örneğin, yeni şifreyi alarak şifre sıfırlama işlemini gerçekleştirebilirsiniz.
    // İşlem başarılı ise kullanıcıyı giriş ekranına yönlendirebilirsiniz.
    locator.get<AuthService>().resetPassword(context, email: emailController.text);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şifre Sıfırla'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.blue,
              ),
              child: TextButton(
                onPressed: _sifreSifirla,
                child: const Text(
                  'Şifre Sıfırla',
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

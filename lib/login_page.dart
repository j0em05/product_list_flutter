import 'package:flutter/material.dart';
import 'keranjang_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String enteredUsername = 'jumhadi';
                String enteredPassword = '123';

                String username = getUsername();
                String password = getPassword();

                if (checkCredentials(
                    username, password, enteredUsername, enteredPassword)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KeranjangPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Incorrect credentials. Please try again.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context); // Go back to the main page
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  bool checkCredentials(String username, String password,
      String enteredUsername, String enteredPassword) {
    return username == enteredUsername && password == enteredPassword;
  }

  String getUsername() {
    return 'jumhadi';
  }

  String getPassword() {
    return '123';
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                //TODO: Handle login
              },
            ),
          ],
        ),
      ),
    );
  }
}

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  List<Produk> produk = [
    Produk(nama: 'Buku', harga: 50000),
    Produk(nama: 'Pensil', harga: 2000),
    Produk(nama: 'Penghapus', harga: 1000),
  ];

  // Controller untuk TextFormField
  TextEditingController _namaBarangController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
      ),
      body: ListView.builder(
        itemCount: produk.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              (index + 1).toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text(produk[index].nama),
            subtitle: Text('harga: ${produk[index].harga}'),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  produk.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Tampilkan dialog untuk meminta data barang dan harga
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Tambah Produk'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _namaBarangController,
                      decoration: InputDecoration(
                        labelText: 'Nama Barang',
                      ),
                    ),
                    TextFormField(
                      controller: _hargaController,
                      decoration: InputDecoration(
                        labelText: 'Harga',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    child: Text('Tambah'),
                    onPressed: () {
                      // Tambah produk baru ke daftar produk
                      setState(() {
                        produk.add(Produk(
                          nama: _namaBarangController.text,
                          harga: int.parse(_hargaController.text),
                        ));
                      });

                      // Tutup dialog
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class Produk {
  String nama;
  int harga;

  Produk({required this.nama, required this.harga});
}

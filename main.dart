import 'package:flutter/material.dart';

void main() {
  runApp(const TarczeKodyApp());
}

class TarczeKodyApp extends StatelessWidget {
  const TarczeKodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarcze Kody',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _kodController = TextEditingController();
  String _informacje = "";

  final Map<String, String> _bazaProduktow = {
    "BSSP1234": "Ilość: 50 szt.\nMiejsce: Magazyn A",
    "BSSP5678": "Ilość: 20 szt.\nMiejsce: Linia 3",
    "BSSP9999": "Ilość: 100 szt.\nMiejsce: Magazyn B",
  };

  void _szukajProduktu(String kod) {
    setState(() {
      _informacje = _bazaProduktow[kod.trim().toUpperCase()] ??
          "Brak informacji o tym kodzie.";
    });
  }

  void _resetuj() {
    setState(() {
      _kodController.clear();
      _informacje = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color kolorTla = Color(0xFF42A5F5); // niebieski

    return Scaffold(
      backgroundColor: kolorTla,
      appBar: AppBar(
        backgroundColor: kolorTla,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: _resetuj,
        ),
        title: const Text(
          "Borg Warner",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: TextField(
                controller: _kodController,
                decoration: const InputDecoration(
                  hintText: "Wpisz kod tarczy",
                  border: InputBorder.none,
                ),
                onSubmitted: _szukajProduktu,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                child: Text(
                  _informacje,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sum App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Sum App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController txt1 = TextEditingController();
  final TextEditingController txt2 = TextEditingController();
  String msg = "";

  void doSum() {
    try {
      int no1 = int.parse(txt1.text);
      int no2 = int.parse(txt2.text);
      int sum = no1 + no2;

      setState(() {
        msg = "The sum is $sum";
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("✅ The sum is $sum")));
    } catch (e) {
      setState(() {
        msg = "❌ Please enter valid numbers!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 2, 116, 66),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Welcome to Sum App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset("assets/images/calculator.png", height: 120),
            const SizedBox(height: 20),

            // First number input
            TextField(
              controller: txt1,
              decoration: const InputDecoration(
                labelText: "Enter first number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),

            // Second number input
            TextField(
              controller: txt2,
              decoration: const InputDecoration(
                labelText: "Enter second number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: doSum,
              icon: const Icon(Icons.calculate),
              label: const Text("Calculate"),
            ),
            const SizedBox(height: 10),

            Text(
              msg,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text("➡ Go to Second Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (index) => "Item ${index + 1}");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset("assets/images/smiley.jpg", height: 40),
            title: Text(items[index]),
            subtitle: const Text("I am subtitle"),
            trailing: const Icon(Icons.arrow_right_alt_outlined),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("You tapped ${items[index]}")),
              );
            },
          );
        },
      ),
    );
  }
}

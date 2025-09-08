import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Size Selector',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SizeSelectorPage(),
    );
  }
}

class SizeSelectorPage extends StatefulWidget {
  const SizeSelectorPage({super.key});

  @override
  State<SizeSelectorPage> createState() => _SizeSelectorPageState();
}

class _SizeSelectorPageState extends State<SizeSelectorPage> {
  final List<String> sizes = ["S", "M", "L", "XL", "XXL"];
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clothing Size Selector"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Select Your Size",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: sizes.map((size) {
                final isSelected = selectedSize == size;
                return ChoiceChip(
                  label: Text(
                    size,
                    style: TextStyle(
                      fontSize: 18,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                  selectedColor: Theme.of(context).colorScheme.primary,
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: selectedSize == null
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("You selected size: $selectedSize"),
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Confirm Selection",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
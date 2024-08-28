import 'package:flutter/material.dart';

class TransactionEdit extends StatelessWidget {
  final String initialValue;

  const TransactionEdit({super.key, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: initialValue);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Düzenle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Metin'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'settings_page.dart';

class IndexPage extends StatelessWidget {
  
  final List<String> selectedHobbies;

  const IndexPage(this.selectedHobbies, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(selectedHobbies),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Ana Sayfa İçeriği'),
      ),
    );
  }
}
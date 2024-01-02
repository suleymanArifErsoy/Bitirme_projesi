import 'package:bitirme_projesi/ana_menu/text_toSpeech/tts.dart';
import 'package:flutter/material.dart';
import 'settings_page.dart';

class IndexPage extends StatefulWidget {
  
  final List<String> selectedHobbies;

  const IndexPage(this.selectedHobbies, {super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  

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
                  builder: (context) => SettingsPage(widget.selectedHobbies),
                ),
              );
            },
          ),
        ],
      ),
      body: Text_to_Speech()

      );
    
  }
}
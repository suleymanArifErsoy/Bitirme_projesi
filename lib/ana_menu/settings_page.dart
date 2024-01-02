import 'package:flutter/material.dart';
import 'package:bitirme_projesi/form/form_page.dart';
import 'package:bitirme_projesi/form/muze_page.dart';

class SettingsPage extends StatefulWidget {
  final List<String> selectedHobbies;

  const SettingsPage(this.selectedHobbies, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text('Hobileri Görüntüle'),
            onTap: () {
              Navigator.pop(context); // Ayarlar sayfasını kapat
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(widget.selectedHobbies),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Hobilerimi Değiştir'),
            onTap: () {
              Navigator.pop(context); // Ayarlar sayfasını kapat
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormPage(),
                ),
              );
            },
          ),
          // Diğer ayarlar eklenebilir
        ],
      ),
    );
  }
}
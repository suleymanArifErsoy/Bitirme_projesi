import 'package:bitirme_projesi/form/muze_page.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  List<String> selectedHobbies = [];

  void _openResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(selectedHobbies),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Hobi Formu')) 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hobilerinizi Seçin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('Savaş'),
              value: selectedHobbies.contains('Savaş'),
              onChanged: (value) {
                setState(() {
                  if (value!) {
                    selectedHobbies.add('Savaş');
                  } else {
                    selectedHobbies.remove('Savaş');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Spor'),
              value: selectedHobbies.contains('Spor'),
              onChanged: (value) {
                setState(() {
                  if (value!) {
                    selectedHobbies.add('Spor');
                  } else {
                    selectedHobbies.remove('Spor');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Sanat'),
              value: selectedHobbies.contains('Sanat'),
              onChanged: (value) {
                setState(() {
                  if (value!) {
                    selectedHobbies.add('Sanat');
                  } else {
                    selectedHobbies.remove('Sanat');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Tarih'),
              value: selectedHobbies.contains('Tarih'),
              onChanged: (value) {
                setState(() {
                  if (value!) {
                    selectedHobbies.add('Tarih');
                  } else {
                    selectedHobbies.remove('Tarih');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Resim'),
              value: selectedHobbies.contains('Resim'),
              onChanged: (value) {
                setState(() {
                  if (value!) {
                    selectedHobbies.add('Resim');
                  } else {
                    selectedHobbies.remove('Resim');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Müzik'),
              value: selectedHobbies.contains('Müzik'),
              onChanged: (value) {
                setState(() {
                  if (value!) {
                    selectedHobbies.add('Müzik');
                  } else {
                    selectedHobbies.remove('Müzik');
                  }
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _openResultPage,
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

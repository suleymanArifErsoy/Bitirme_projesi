import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final List<String> selectedHobbies;

  const ResultPage(this.selectedHobbies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sonuç Sayfası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seçtiğiniz Hobiler:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            for (var hobby in selectedHobbies)
              Row(
                children: [
                  const Icon(Icons.ac_unit_sharp),
                  const SizedBox(width:8),
                  Text(hobby, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900,color: Colors.teal[900]),),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
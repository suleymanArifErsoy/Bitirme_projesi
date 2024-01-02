import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

// ignore: must_be_immutable, camel_case_types
class Text_to_Speech extends StatelessWidget{
  
  Text_to_Speech({super.key});

  FlutterTts flutterTts = FlutterTts();
  TextEditingController textController = TextEditingController();
 
  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(2.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
   return Container(
    alignment: Alignment.center,
    child: 
     Padding(padding: const EdgeInsets.all(32),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: textController,
        ),
        ElevatedButton(
          child: const Text("Söyle"),
          onPressed: () => speak(textController.text),
          )
      ],
    ),
    )
   );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Text_to_speech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FlutterTts flutterTts;
  late TextEditingController textController;
  String audioUrl = "";

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    textController = TextEditingController();
  }

  Future<void> speakText() async {
    String text = textController.text;
    TextToSpeech textToSpeech = TextToSpeech();
    await textToSpeech.speak(text);
  }

  Future<void> generateAzureSpeech() async {
    String text = textController.text;
    AzureTextToSpeech azureTextToSpeech = AzureTextToSpeech();
    final audioUrl = await azureTextToSpeech.generateSpeech(text);
    setState(() {
      this.audioUrl = audioUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Azure Text-to-Speech Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Text to Speak',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: speakText,
              child: Text('Speak Text'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: generateAzureSpeech,
              child: Text('Generate Azure Speech'),
            ),
            SizedBox(height: 16.0),
            if (audioUrl.isNotEmpty)
              Text(
                'Generated Audio URL: $audioUrl',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

class TextToSpeech {
  late FlutterTts flutterTts;

  TextToSpeech() {
    // Diğer başlatma işlemleri
  }

  Future<void> speak(String text) async {
    flutterTts = FlutterTts();
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    return flutterTts.speak(text);
  }
}

/*class TextToSpeech {
  FlutterTts flutterTts;

  TextToSpeech() {
    flutterTts = FlutterTts();
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text); //return flutterTts.speak(text);
  }
}*/

class AzureTextToSpeech {
  static const String apiKey = "144d5438e8124599af131cba20a52271";  //"YourAzureApiKey";
  static const String endpoint = "https://germanywestcentral.api.cognitive.microsoft.com/" ;//"YourAzureEndpoint";

  Future<String> generateSpeech(String text) async {
    final response = await http.post(
      Uri.parse('$endpoint/v1/ssml'),
      headers: {
        'Content-Type': 'application/ssml+xml',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'text':
            '<speak version="1.0" xmlns="http://www.w3.org/2001/10/synthesis" xmlns:mstts="https://www.w3.org/2001/mstts" xml:lang="tr-TR">$text</speak>',
      }),
    );

    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      final String audioUrl = data['audioContent'];
      return audioUrl;
    } else {
      throw Exception('Failed to generate speech');
    }
  }
}






// ignore: must_be_immutable, camel_case_types
/*class Text_to_Speech extends StatelessWidget{
  
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
}*/

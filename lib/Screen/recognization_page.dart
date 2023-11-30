import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:ocr/Screen/translator.dart'; // Import the translator.dart file

class RecognizePage extends StatefulWidget {
  final String? path;

  // Use the 'extractedText' parameter for the initial value of the controller
  final String extractedText;

  const RecognizePage({Key? key, this.path, required this.extractedText})
      : super(key: key);

  @override
  State<RecognizePage> createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  bool _isBusy = false;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final InputImage inputImage = InputImage.fromFilePath(widget.path!);

    processImage(inputImage);

    // Set the initial value of the controller
    controller.text = widget.extractedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recognized Page")),
      body: _isBusy == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                maxLines: MediaQuery.of(context).size.height.toInt(),
                controller: controller,
                decoration:
                    const InputDecoration(hintText: "Text goes here..."),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the translation page (translator.dart)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TranslatorApp(
                originalText: controller.text,
              ),
            ),
          );
        },
        child: const Icon(Icons.translate),
      ),
    );
  }

  void processImage(InputImage image) async {
    final textRecognizer =
        TextRecognizer(script: TextRecognitionScript.devanagiri);

    setState(() {
      _isBusy = true;
    });

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    controller.text = recognizedText.text;

    // End busy state
    setState(() {
      _isBusy = false;
    });
  }
}

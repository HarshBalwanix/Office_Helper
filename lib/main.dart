import 'dart:developer';
import 'package:ocr/Screen/speecht2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr/Screen/recognization_page.dart';
import 'package:ocr/Utils/image_cropper_page.dart';
import 'package:ocr/Utils/image_picker_class.dart';
import 'package:ocr/Widgets/modal_dialog.dart';
import 'package:ocr/Screen/translator.dart';
import 'package:ocr/Screen/translator2.dart';
import 'package:ocr/Screen/speecht.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Remove debug tag
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Office Helper'),
        '/translator': (context) => const TranslatorApp(
              originalText: '',
            ),
        '/translator2': (context) => const Translator2App(),
        '/speecht': (context) => const HomePage(),
        '/speecht2': (context) => const HomePage2(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _scanPhoto() {
    imagePickerModal(context, onCameraTap: () {
      log("Camera");
      pickImage(source: ImageSource.camera).then((value) {
        if (value != '') {
          imageCropperView(value, context).then((value) {
            if (value != '') {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => RecognizePage(
                    path: value,
                    extractedText: '',
                  ),
                ),
              );
            }
          });
        }
      });
    }, onGalleryTap: () {
      log("Gallery");
      pickImage(source: ImageSource.gallery).then((value) {
        if (value != '') {
          imageCropperView(value, context).then((value) {
            if (value != '') {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => RecognizePage(
                    path: value,
                    extractedText: '',
                  ),
                ),
              );
            }
          });
        }
      });
    });
  }

  void _navigateToTranslator() {
    Navigator.pushNamed(context, '/translator');
  }

  void _navigateToUnicodeConverter() {
    Navigator.pushNamed(context, '/translator2');
  }

  void _navigateToSpeechToText() {
    Navigator.pushNamed(context, '/speecht');
  }

  void _navigateToSpeechToText2() {
    Navigator.pushNamed(context, '/speecht2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _scanPhoto,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                "Scan Photo",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToTranslator,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                "Translator",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToUnicodeConverter,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                "Unicode Converter",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToSpeechToText,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                "Speech to Text Hindi ",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToSpeechToText2,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                "Speech to Text English ",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

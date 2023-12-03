import 'package:flutter/material.dart';

void main() {
  runApp(const Translator2App());
}

class Translator2App extends StatelessWidget {
  const Translator2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _inputController = TextEditingController();
  String _outputText = '';

  Map<String, String> devanagariToUnicodeMap = {
    '`': 'ृ',
    '~': '्',
    '@': '/',
    '#': 'रु',
    '%': 'ः',
    '^': '‘',
    '&': '-',
    '*': '’',
    '(': ';',
    ')': 'द्ध',
    '-': '.',
    '_': 'ऋ',
    '=': 'त्र',
    '+': '़+',
    'Q': 'फ',
    'W': 'ॅ',
    'E': 'म्',
    'R': 'त्',
    'T': 'ज्',
    'Y': 'ल्',
    'U': 'न्',
    'I': 'प्',
    'O': 'व्',
    'P': 'च्',
    '{': 'क्ष्',
    '}': 'द्व',
    '|': 'द्य',
    'q': 'ु',
    'w': 'ू',
    'e': 'म',
    'r': 'त',
    't': 'ज',
    'y': 'ल',
    'u': 'न',
    'i': 'प',
    'o': 'व',
    'p': 'च',
    '[': 'ख्',
    ']': ',',
    '\\': '?',
    'A': '।',
    'S': 'ै',
    'D': 'क्',
    'F': 'थ्',
    'G': 'ळ',
    'H': 'भ्',
    'J': 'श्र',
    'K': 'ज्ञ',
    'L': 'स्',
    ':': 'रू',
    '"': 'ष्',
    'a': 'ं',
    's': 'े',
    'd': 'क',
    'f': 'ि',
    'g': 'ह',
    'h': 'ी',
    'j': 'र',
    'k': 'ा',
    'l': 'स',
    ';': 'य',
    "’": 'श्',
    'Z': 'र्',
    'X': 'ग्',
    'C': 'ब्',
    'V': 'ट',
    'B': 'ठ',
    'N': 'छ',
    'M': 'ड',
    '<': 'ढ',
    '>': 'झ',
    '?': 'घ्',
    'z': '्र',
    'x': 'ग',
    'c': 'ब',
    'v': 'अ',
    'b': 'इ',
    'n': 'द',
    'm': 'उ',
    ',': 'ए',
    '.': 'ण्',
    '/': 'ध्',
    'ƒ': '१',
    '„': '२',
    '…': '३',
    '†': '४',
    '‡': '५',
    'ˆ': '६',
    '‰': '७',
    'Š': '८',
    '‹': '९',
    '˜': '˜',
    '™': 'न्न्',
    'Œ': '॰',
    '¡': 'ँ',
    '¥': 'ञ',
    '³': 'ङ',
    '¾': '=',
    '¿': '{',
    'À': '}',
    'Á': 'प्र',
    'Å': 'ऊ',
    'ä': 'क्त',
    'ô': 'क्क',
    '÷': 'झ्',
    'ð': 'ð',
    'ï': 'ड्ढ',
    'å': '०',
    'í': 'द्द',
    'Ø': 'क्र'
  };

  Map<String, String> unicodeToDevlysMap = {
    'ृ': '`',
    '्': '~',
    '/': '@',
    'रु': '#',
    'ः': '%',
    '‘': '^',
    '-': '&',
    '’': '*',
    ';': '(',
    'द्ध': ')',
    '.': '-',
    'ऋ': '_',
    'त्र': '=',
    '़+': '+',
    'फ': 'Q',
    'ॅ': 'W',
    'म्': 'E',
    'त्': 'R',
    'ज्': 'T',
    'ल्': 'Y',
    'न्': 'U',
    'प्': 'I',
    'व्': 'O',
    'च्': 'P',
    'क्ष्': '{',
    'द्व': '}',
    'द्य': '|',
    'ु': 'q',
    'ू': 'w',
    'म': 'e',
    'त': 'r',
    'ज': 't',
    'ल': 'y',
    'न': 'u',
    'प': 'i',
    'व': 'o',
    'च': 'p',
    'ख्': '[',
    ',': ']',
    '?': '\\',
    '।': 'A',
    'ै': 'S',
    'क्': 'D',
    'थ्': 'F',
    'ळ': 'G',
    'भ्': 'H',
    'श्र': 'J',
    'ज्ञ': 'K',
    'स्': 'L',
    'रू': ':',
    'ष्': '"',
    'ं': 'a',
    'े': 's',
    'क': 'd',
    'ि': 'f',
    'ह': 'g',
    'ी': 'h',
    'र': 'j',
    'ा': 'k',
    'स': 'l',
    'य': ';',
    'श्': "'",
    'र्': 'Z',
    'ग्': 'X',
    'ब्': 'C',
    'ट': 'V',
    'ठ': 'B',
    'छ': 'N',
    'ड': 'M',
    'ढ': '<',
    'झ': '>',
    'घ्': '?',
    '्र': 'z',
    'ग': 'x',
    'ब': 'c',
    'अ': 'v',
    'इ': 'b',
    'द': 'n',
    'उ': 'm',
    'ए': ',',
    'ण्': '.',
    'ध्': '/',
    '१': 'ƒ',
    '२': '„',
    '३': '…',
    '४': '†',
    '५': '‡',
    '६': 'ˆ',
    '७': '‰',
    '८': 'Š',
    '९': '‹',
    '˜': '˜',
    'न्न्': '™',
    '॰': 'Œ',
    'ँ': '¡',
    'ञ': '¥',
    'ङ': '³',
    '=': '¾',
    '{': '¿',
    '}': 'À',
    'प्र': 'Á',
    'ऊ': 'Å',
    'क्त': 'ä',
    'क्क': 'ô',
    'झ्': '÷',
    'ð': 'ð',
    'ड्ढ': 'ï',
    '०': 'å',
    'द्द': 'í',
    'क्र': 'Ø',
  };

  String swapIfFAndZPresent(String inputStr) {
    List<String> charList = inputStr.split('');

    int i = 0;
    while (i < charList.length - 1) {
      if (charList[i] == 'f' && charList[i + 1] != ' ') {
        charList[i] = charList[i + 1];
        charList[i + 1] = 'f';
        i += 2;
      } else if (charList[i] == 'Z' && i > 0 && charList[i - 1] != ' ') {
        charList[i] = charList[i - 1];
        charList[i - 1] = 'Z';
        i += 2;
      } else {
        i += 1;
      }
    }

    return charList.join();
  }

  String mapToUnicode(String inputStr, Map<String, String> mapping) {
    String resultStr = "";

    for (String char in inputStr.split('')) {
      // Check if the character is in the mapping
      if (mapping.containsKey(char)) {
        resultStr += mapping[char]!;
      } else {
        // If the character is not in the mapping, keep it unchanged
        resultStr += char;
      }
    }

    return resultStr;
  }

  String mapToDevlys(String inputStr, Map<String, String> mapping) {
    String resultStr = "";

    for (String char in inputStr.split('')) {
      if (mapping.containsKey(char)) {
        resultStr += mapping[char]!;
      } else {
        resultStr += char;
      }
    }

    return resultStr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Devanagari Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String inputText = _inputController.text;
                      String resultBothSwapped = swapIfFAndZPresent(inputText);
                      _outputText = mapToUnicode(
                          resultBothSwapped, devanagariToUnicodeMap);
                    });
                  },
                  child: const Text('Devanagari to Unicode'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String inputText = _inputController.text;
                      _outputText = mapToDevlys(inputText, unicodeToDevlysMap);
                    });
                  },
                  child: const Text('Unicode to Devlys'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const SelectableText(
              'Output:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SelectableText(_outputText),
          ],
        ),
      ),
    );
  }
}

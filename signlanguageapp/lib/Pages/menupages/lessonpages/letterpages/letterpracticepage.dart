import 'package:flutter/material.dart';

class LetterPractice extends StatefulWidget {
  const LetterPractice({Key? key}) : super(key: key);

  @override
  State<LetterPractice> createState() => _InputExampleState();
}

class _InputExampleState extends State<LetterPractice> {
 final TextEditingController _controller = TextEditingController();
  String _userInput = '';
  String _submittedText = ''; // New variable to store submitted text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 172, 42),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type answer here',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _userInput = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                setState(() {
                  _submittedText = _controller.text;
                });
                _controller.clear();
              },
            ),
            const SizedBox(height: 10),
            Text('Submitted text: $_submittedText', 
              style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
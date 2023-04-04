import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _textEditingController = TextEditingController();
  double? _enteredValue;
  bool _isValidInput = true;

  void _convertValue() {
    setState(() {
      if (double.tryParse(_textEditingController.text) == null) {
        _isValidInput = false;
        _enteredValue = null;
      } else {
        _isValidInput = true;
        _enteredValue = double.parse(_textEditingController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Conversie Valutara'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Image.asset(
              'assets/art.jpg', 
              height: 200.0,
              width: 200.0,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter the ammount in EUR',
                errorText: _isValidInput ? null : 'Please enter a valid number',
                errorBorder: _isValidInput
                    ? OutlineInputBorder()
                    : OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _convertValue,
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            _isValidInput
  ? Center(
      child: Text(
        'Result: ${_enteredValue != null ? _enteredValue! * 5 : ""}',
        style: TextStyle(fontSize: 24.0),
      ),
    )
  : Center(
      child: Text(
        'Please enter a valid number',
        style: TextStyle(fontSize: 24.0, color: Colors.red),
      ),
    ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class TextEditor extends StatefulWidget {
  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  TextEditingController _textController = TextEditingController();
  final UndoHistoryController _undoController = UndoHistoryController();
   TextStyle? get enabledStyle => Theme.of(context).textTheme.bodyMedium;
  TextStyle? get disabledStyle =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey);


  double _fontSize = 16.0;
  Color _textColor = Colors.black;
  List<String> _textList = [];
  List<double> _fontSizes = [12.0, 16.0, 20.0, 24.0, 28.0];
  double _selectedFontSize = 16.0;
  String _selectedFontStyle = 'Regular'; // Default font style

  final List<String> _fontStyles = ['Regular', 'Bold', 'Italic'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Editor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textController,
              undoController: _undoController,

              decoration: InputDecoration(labelText: 'Enter text'),
            ),
            ValueListenableBuilder<UndoHistoryValue>(
              valueListenable: _undoController,
              builder: (BuildContext context, UndoHistoryValue value,
                  Widget? child) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      child: Text('Undo',
                          style: value.canUndo ? enabledStyle : disabledStyle),
                      onPressed: () {
                        _undoController.undo();
                      },
                    ),
                    TextButton(
                      child: Text('Redo',
                          style: value.canRedo ? enabledStyle : disabledStyle),
                      onPressed: () {
                        _undoController.redo();
                      },
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Font Size: $_selectedFontSize'),
                    DropdownButton<double>(
                      value: _selectedFontSize,
                      items: _fontSizes.map((fontSize) {
                        return DropdownMenuItem<double>(
                          value: fontSize,
                          child: Text('$fontSize'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedFontSize = value!;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Font Style: $_selectedFontStyle'),
                    DropdownButton<String>(
                      value: _selectedFontStyle,
                      items: _fontStyles.map((style) {
                        return DropdownMenuItem<String>(
                          value: style,
                          child: Text(style),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedFontStyle = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _pickTextColor();
                  },
                  child: Text('Change Text Color'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addText();
                  },
                  child: Text('Add Text'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _textList.length,
                itemBuilder: (context, index) {
                  return Text(
                    _textList[index],
                    style: TextStyle(
                      fontSize: _selectedFontSize,
                      color: _textColor,
                      fontWeight: _selectedFontStyle == 'Bold'
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontStyle: _selectedFontStyle == 'Italic'
                          ? FontStyle.italic
                          : FontStyle.normal,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addText() {
    String newText = _textController.text.trim();
    if (newText.isNotEmpty) {
      setState(() {
        _textList.add(newText);
        _textController.clear();
      });
    }
  }

  Future<void> _pickTextColor() async {
    Color selectedColor = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick a Text Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _textColor,
              onColorChanged: (Color color) {
                _textColor = color;
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_textColor);
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );

    if (selectedColor != null) {
      setState(() {
        _textColor = selectedColor;
      });
    }
  }
}
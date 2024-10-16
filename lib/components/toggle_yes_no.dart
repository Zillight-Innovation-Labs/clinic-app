import 'package:flutter/material.dart';

class ToogleYesNo extends StatefulWidget {
  final Function(dynamic) onchanged;
  const ToogleYesNo({
    super.key,
    required this.onchanged,
  });

  @override
  ToogleYesNoState createState() => ToogleYesNoState();
}

class ToogleYesNoState extends State<ToogleYesNo> {
  String? _selectedVal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedVal = 'Male';
                  });
                  widget.onchanged(_selectedVal);
                },
                child: const Text('Male')),
            Radio<String>(
              value: 'Male',
              groupValue: _selectedVal,
              onChanged: (String? value) {
                setState(() {
                  _selectedVal = value;
                });
                widget.onchanged(value);
              },
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedVal = 'Female';
                  });
                  widget.onchanged(_selectedVal);
                },
                child: const Text('Female')),
            Radio<String>(
              value: 'Female',
              groupValue: _selectedVal,
              onChanged: (String? value) {
                setState(() {
                  _selectedVal = value;
                });
                widget.onchanged(value);
              },
            ),
          ],
        )
      ],
    );
  }
}

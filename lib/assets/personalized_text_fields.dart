import 'package:flutter/material.dart';

class PersonalizedTextField extends StatefulWidget {
  final String labelText;
  final ValueChanged<String>? onChanged;

  const PersonalizedTextField({
    super.key,
    required this.labelText,
    this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PersonalizedTextFieldState createState() => _PersonalizedTextFieldState();
}

class _PersonalizedTextFieldState extends State<PersonalizedTextField> {
  bool isLabelVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
        setState(() {});
      },
      decoration: InputDecoration(
        labelText: isLabelVisible ? widget.labelText : null,
        contentPadding: const EdgeInsets.all(8.0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54, width: 0.5),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.blue, width: 1.0), // Change color when focused
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      onTap: () {
        setState(() {
          isLabelVisible = false; // Hide label text on tap
        });
      },
      onSubmitted: (_) {
        setState(() {});
      },
      onEditingComplete: () {
        setState(() {});
      },
    );
  }
}

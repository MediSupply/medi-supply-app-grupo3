import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatefulWidget {
  final void Function(String)? onChanged;
  final bool obscureText;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? initialValue;
  const Input({
    required this.onChanged,
    this.obscureText = false,
    required this.label,
    required this.hint,
    this.validator,
    this.readOnly = false,
    this.inputFormatters,
    this.maxLength,
    this.initialValue,
    super.key,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        hint: Text(widget.hint),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        contentPadding: const EdgeInsets.all(8),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

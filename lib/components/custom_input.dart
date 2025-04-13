import 'dart:async';

import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String? label;
  final TextInputType keyboardType;

  final String? Function(String value) valudator;

  const CustomInput({
    super.key,
    required this.controller,
    required this.valudator,
    this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  String? _errorText;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (_debounce?.isActive ?? false) _debounce?.cancel();

      _debounce = Timer(const Duration(seconds: 1), () {
        final value = widget.controller.text;
        final validationResult = widget.valudator(value);

        setState(() {
          _errorText = validationResult;
        });
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextField(
          controller: widget.controller,
          obscureText: widget.isPassword,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.label ?? "",
            errorText: _errorText,
            filled: true,
            fillColor: const Color(0x1A36B3A6),
            hintStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0x2A36B3A6)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0x4A36B3A6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0x6A36B3A6)),
            ),
          ),
        ));
  }
}

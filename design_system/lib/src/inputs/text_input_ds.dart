import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TextInputDs extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function(String)? validator;
  final double height;
  final double width;
  final bool isFilled;
  final bool isPassword;
  final TextInputType textInputType;

  const TextInputDs({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.height = 50,
    this.width = 303,
    this.isFilled = true,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
  });

  @override
  State<TextInputDs> createState() => _TextInputDsState();
}

class _TextInputDsState extends State<TextInputDs> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 3,
        child: TextFormField(
          keyboardType: widget.textInputType,
          obscureText: _isObscure,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off))
                : null,
            hintText: widget.label,
            filled: widget.isFilled,
            fillColor: AppColors.whiteColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}

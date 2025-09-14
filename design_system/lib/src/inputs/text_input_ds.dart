import 'package:flutter/material.dart';

import '../../design_system.dart';

class TextInputDs extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double height;
  final double width;
  final bool isFilled;
  final bool isPassword;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;

  const TextInputDs({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.height = 50,
    this.width = 303,
    this.isFilled = true,
    this.isPassword = false,
    this.onChanged,
    this.autovalidateMode,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.labelStyle,
    this.suffixIcon,
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
    final theme = Theme.of(context);
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 3,
        child: TextFormField(
          autovalidateMode: widget.autovalidateMode,
          keyboardType: widget.textInputType,
          obscureText: _isObscure,
          controller: widget.controller,
          validator: widget.validator,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : widget.suffixIcon,
            hintText: widget.label,
            hintStyle: widget.labelStyle ?? theme.textTheme.bodyLarge,
            filled: widget.isFilled,
            fillColor: AppColors.whiteColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: widget.prefixIcon,
          ),
        ),
      ),
    );
  }
}

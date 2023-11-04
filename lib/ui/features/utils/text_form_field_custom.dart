import 'package:flutter/material.dart';

const borderStyle = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.white,
    width: 1,
  ),
);

class TextForm extends StatelessWidget {
  final int? minLengthCheck;
  final int? maxLengthCheck;
  final TextEditingController? controller;
  final bool charCheck;
  final Widget? icon;
  final ValueChanged<String>? onFieldSubmitted;
  final String? hintText;
  final FocusNode? focus;
  const TextForm({
    super.key,
    this.icon,
    this.hintText,
    this.onFieldSubmitted,
    this.minLengthCheck,
    this.charCheck = false,
    this.maxLengthCheck,
     this.focus, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focus,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          disabledBorder: borderStyle,
          focusedErrorBorder: borderStyle,
          errorBorder: borderStyle,
          focusedBorder: borderStyle,
          enabledBorder: borderStyle,
        ),
        validator: (value) {
          final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');

          if (value == null || value.isEmpty) {
            return 'Esse campo é obrigatorio.';
          } else if (minLengthCheck != null && value.length < 2) {
            return 'Campo deve pelomenos 2 letras.';
          } else if (maxLengthCheck != null && value.length > maxLengthCheck!) {
            return 'Campo deve no maximo $maxLengthCheck letras.';
          } else if (charCheck && !validCharacters.hasMatch(value)) {
            return 'Campo Contem caracteres especiais.';
          }

          return null;
        },
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}

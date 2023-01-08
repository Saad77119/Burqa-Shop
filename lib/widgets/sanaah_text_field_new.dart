import 'package:flutter/material.dart';
import 'validations.dart';

class SanaahTextFieldNew extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final Function? onTap;
  final Function? onChange;
  final Function? onFieldSubmitted;
  final bool readOnly = false;
  final double bottomPadding;
  final bool obscure;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool isForm;
  final bool autoFocus;
  final int? validator;
  final Widget prefix;

  const SanaahTextFieldNew({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.labelText,
    this.onTap,
    this.onChange,
    this.onFieldSubmitted,
    this.validator,
    this.textInputType = TextInputType.text,
    this.autoFocus = false,
    this.obscure = false,
    this.bottomPadding = 20,
    this.textInputAction = TextInputAction.done,
    this.isForm = false,
    this.prefix = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Validations validations = Validations();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(isForm)...[
          TextFormField(
            controller: controller,
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: prefix,
              contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
              labelText: labelText,
              labelStyle: TextStyle(
                fontSize: 18,
                color: const Color(0xFF393737),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            obscureText: obscure,
            onFieldSubmitted: (val) {
              if (onFieldSubmitted != null) onFieldSubmitted!(val);
            },
            autofocus: autoFocus,
            validator: (value) => validations.validate(validator!, value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: textInputAction,
          ),
        ],
        if(!isForm)...[
          TextField(
            controller: controller,
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: prefix,
              contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
              labelText: labelText,
              labelStyle: TextStyle(
                fontSize: 18,
                color: const Color(0xFF393737),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            obscureText: obscure,
            autofocus: autoFocus,
            textInputAction: textInputAction,
          ),
        ],
        SizedBox(height: bottomPadding),
      ],
    );
  }
}
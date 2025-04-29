import 'package:filme_flix/utils/app_colors.dart';
import 'package:filme_flix/utils/string_validator.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  final String inputName;
  final Icon icon;

  const CustomTextForm({
    super.key,
    required this.inputName,
    required this.icon
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIconColor: AppColors.primary,
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder()
        ),
      style: TextStyle(
        color: AppColors.primary
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value.validateNotEmpty('email')
    );
  }
}
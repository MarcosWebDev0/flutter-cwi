import 'package:filme_flix/components/buttons/primary_button.dart';
import 'package:filme_flix/components/constants/app_colors.dart';
import 'package:filme_flix/utils/string_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      context.go("/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIconColor: AppColors.primary,
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder()
                    ),
                  style: TextStyle(
                    color: AppColors.primary
                  ),
                  validator: (value) => value.validateNotEmpty('email')
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIconColor: AppColors.primary,
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder()
                    ),
                  obscureText: true,
                  validator: (value) => value.validateNotEmpty('password')
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          PrimaryButton(onPressed: _login, text: "Login")
        ],
      ),
    );
  }
}
import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/screens/registration/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  PasswordTextFieldWidget(
      {super.key, required this.passwordController, required this.isHidden});
  TextEditingController passwordController;
  bool isHidden;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      obscureText: isHidden,
      style: const TextStyle(color: darkGreen, fontSize: 18),
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: darkGreen, width: 3, style: BorderStyle.solid),
        ),
        suffixIcon: InkWell(
            onTap: () {
              context.read<RegistrationBloc>().add(ShowHidePasswordEvent());
            },
            child: isHidden
                ? const Icon(Icons.visibility_off_outlined)
                : const Icon(
                    Icons.visibility_outlined)), //remove_red_eye_outlined)),
        hintText: "Enter Your password",
        hintStyle: const TextStyle(color: grey, fontSize: 16),
        fillColor: lightGrey,
        filled: true,
        prefixIcon: const Icon(Icons.lock_outline),
        prefixIconColor: grey,
      ),
    );
  }
}

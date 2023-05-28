import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled({
    this.sufixI,
    this.icon,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.controller,
  });

  final String? hintText;
  final bool? obscureText;
  final SvgPicture? icon, sufixI;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  // FocusNode fieldNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // focusNode: fieldNode,
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Filed is required';
        }
      },
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: ScandryColor.withOpacity(.05),
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: const TextStyle(color: ScandryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: ScandryColor.withOpacity(0.05)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PrimaryColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}

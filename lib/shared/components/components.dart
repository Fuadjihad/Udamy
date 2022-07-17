import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  Color color = const Color.fromARGB(234, 76, 5, 117),
  double width = double.infinity,
  required VoidCallback function,
  required String text,
  bool isUpperCase = true,
  double radius = 0.0,
}) =>
    Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          '${isUpperCase ? text.toUpperCase() : text}',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChang,
  required FormFieldValidator<String> validator,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData ?suffix,
  required TextInputType type,
  VoidCallback ?suffixPres
}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmit,
      onChanged: onChang,
      validator: validator,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null ? IconButton(onPressed: suffixPres, icon: Icon(suffix)) : null,
        border: const OutlineInputBorder(),
      ),
    );

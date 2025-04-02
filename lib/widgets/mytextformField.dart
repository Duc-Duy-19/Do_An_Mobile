import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {

  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final String name;
  
  const MyTextFormField({
    super.key,  
    required this.validator, 
    required this.name,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField( 
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: name,
      ),
    );
  }
}
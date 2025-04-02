import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText ;
  final FormFieldValidator<String>? validator;
  final String name;
  final VoidCallback onTap;
  final void Function(String)? onChanged;
     
  const PasswordTextFormField({
    required this.onChanged,
    super.key, 
    required this.obserText, 
    required this.validator, 
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField( 
      obscureText: obserText,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: name,
        hintStyle: TextStyle(color: Colors.black),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obserText==true?  
            Icons.visibility: Icons.visibility_off,
            color: Colors.black,
            ),
        ),
      ),
    );
  }
}

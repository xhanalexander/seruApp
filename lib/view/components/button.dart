import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final Widget childs;
  final VoidCallback onPressed;
  
  const FormButton({
    super.key,
    required this.childs,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: childs,
      ),
    );

  }
}
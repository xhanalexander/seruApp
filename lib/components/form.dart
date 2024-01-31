import 'package:flutter/material.dart';

class FormName extends StatelessWidget {
  final String hintTextName;
  final TextEditingController controllerNames;
  final Function(String) onChanged;

  const FormName({
    super.key,
    required this.hintTextName,
    required this.controllerNames,  
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerNames,
      // validator: (value) => FormValidator.validateUsername(username: value),
      keyboardType: TextInputType.name,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        hintText: hintTextName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
      ),
    );
  }
}

class FormLabel extends StatelessWidget {
  final String labels;
  const FormLabel({
    super.key,
    required this.labels
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          labels,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class FormDropDown extends StatelessWidget {
  final String hintText;
  final List<String> options;
  final String selectedValue;
  final Function(String?) onChanged;

  const FormDropDown({
    super.key,
    required this.hintText,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: onChanged,
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option, style: const TextStyle(fontSize: 16)),
        );
      }).toList(),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:seruapp/components/form.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormLabel(
              labels: 'First Name',
            ),
            FormName(
              hintTextName: 'John',
              controllerNames: firstNameController,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            const FormLabel(
              labels: 'Last Name',
            ),
            FormName(
              hintTextName: 'Smith',
              controllerNames: lastNameController,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            const FormLabel(labels: "Provinces"),
            FormDropDown(
              hintText: "Kota",
              options: ["Jakarta", "Bandung", "Surabaya"],
              selectedValue: "Jakarta",
              onChanged: (value) {},
            ),
            
          ],
        ),
      ),
    );
  }
}
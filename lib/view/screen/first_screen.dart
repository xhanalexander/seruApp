import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:seruapp/components/form.dart';
import 'package:seruapp/viewModels/provinsi_view_models.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final bioDataController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    bioDataController.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProvinsiViewModel>(context, listen: false).getProvinsi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Name
            const FormLabel(
              labels: 'First Name',
            ),
            FormName(
              hintTextName: 'John',
              controllerNames: firstNameController,
              onChanged: (value) {},
            ),

            // Last Name
            const SizedBox(height: 20),
            const FormLabel(
              labels: 'Last Name',
            ),
            FormName(
              hintTextName: 'Smith',
              controllerNames: lastNameController,
              onChanged: (value) {},
            ),

            // Provinces
            const SizedBox(height: 20),
            const FormLabel(labels: "Provinces"),
            FormDropDown(
              hintText: "Kota",
              options: ["Jakarta", "Bandung", "Surabaya"],
              selectedValue: "Jakarta",
              onChanged: (value) {},
            ),

            // City
            const SizedBox(height: 20),
            const FormLabel(labels: "City"),
            FormDropDown(
              hintText: "Kota",
              options: ["Jakarta", "Bandung", "Surabaya"],
              selectedValue: "Jakarta",
              onChanged: (value) {},
            ),

            // Address
            const SizedBox(height: 20),
            const FormLabel(labels: "Address"),
            //

            // Biodata
            const SizedBox(height: 20),
            const FormLabel(labels: "Biodata"),
            TextAreaForm(textController: bioDataController),

            
          ],
        ),
      ),
    );
  }
}
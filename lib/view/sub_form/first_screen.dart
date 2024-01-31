import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seruapp/constant/const.dart';
import 'package:seruapp/view/components/form.dart';
import 'package:seruapp/view/components/button.dart'; 
import 'package:dropdown_search/dropdown_search.dart';
import 'package:seruapp/view_models/wilayah_view_models.dart';

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
      Provider.of<WilayahViewModels>(context, listen: false).getProvinsis();
      Provider.of<WilayahViewModels>(context, listen: false).getKotas("31");
      Provider.of<WilayahViewModels>(context, listen: false).getKecamatans("3173");
    });
  }

  @override
  Widget build(BuildContext context) {
    final props = Provider.of<WilayahViewModels>(context);

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
              validator: (value) => FormValidation().validateFirstName(value!),
              onChanged: (value) {},
            ),

            const SizedBox(height: 20),
            const FormLabel(
              labels: 'Last Name',
            ),
            FormName(
              hintTextName: 'Smith',
              controllerNames: lastNameController,
              validator: (value) => FormValidation().validateLastName(value!),
              onChanged: (value) {},
            ),

            // Provinces
            const SizedBox(height: 20),
            const FormLabel(labels: "Provinces"),
            DropdownSearch(
              popupProps: const PopupProps.menu(
                showSearchBox: true,
              ),
              onChanged: (value) => debugPrint(value),
              selectedItem: "ACEH",
              asyncItems: (String value) => Future.delayed(
                const Duration(milliseconds: 500),
                () => props.provinsi.map((e) => e.name!).toList(),
              ),
            ),

            // City
            const SizedBox(height: 20),
            const FormLabel(labels: "City"),
            DropdownSearch(
              popupProps: const PopupProps.menu(
                showSearchBox: true,
              ),
              onChanged: (value) => debugPrint(value),
              selectedItem: "KOTA JAKARTA PUSAT",
              asyncItems: (String value) => Future.delayed(
                const Duration(milliseconds: 500),
                () => props.kota.map((e) => e.name!).toList(),
              ),
            ),

            // Address
            const SizedBox(height: 20),
            const FormLabel(labels: "Address"),
            DropdownSearch(
              popupProps: const PopupProps.menu(
                showSearchBox: true,
              ),
              onChanged: (value) => debugPrint(value),
              selectedItem: "TANAH ABANG",
              asyncItems: (String value) => Future.delayed(
                const Duration(milliseconds: 500),
                () => props.kecamatan.map((e) => e.name!).toList(),
              ),
            ),

            // Biodata
            const SizedBox(height: 20),
            const FormLabel(labels: "Biodata"),
            TextAreaForm(
              textController: bioDataController,
              validator: (value) => FormValidation().validateEmpty(value!),
            ),

            // Button
            const SizedBox(height: 20),
            FormButton(
              childs: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 18)),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  debugPrint("Validated");
                }
              },
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
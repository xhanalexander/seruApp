import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seruapp/constant/const.dart';
import 'package:seruapp/view/components/form.dart';
import 'package:seruapp/view/components/button.dart'; 
import 'package:dropdown_search/dropdown_search.dart';
import 'package:seruapp/view_models/wilayah_view_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late SharedPreferences prefs;
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final bioDataController = TextEditingController();
  String? selectedProvinsi = "ACEH";
  String? selectedKota = "KOTA JAKARTA PUSAT";
  String? selectedKecamatan = "TANAH ABANG";

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

  void submit() async {
    if (formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      
      prefs.setString('first', firstNameController.text);
      prefs.setString('last', lastNameController.text);
      prefs.setString('bio', bioDataController.text);
      prefs.setString('provinsi', selectedProvinsi!);
      prefs.setString('kota', selectedKota!);
      prefs.setString('kecamatan', selectedKecamatan!);

      Map<String, dynamic> formdata = {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "bio_data": bioDataController.text,
        "provinsi": selectedProvinsi,
        "kota": selectedKota,
        "kecamatan": selectedKecamatan,
      };
      debugPrint(formdata.toString());
    }
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

            const Align(
              alignment: Alignment.center,
              child: LabelForm(
                labels: 'Please fill out the form below',
              ),
            ),
            
            const LabelForm(
              labels: 'First Name',
            ),
            NameForm(
              hintTextName: 'John',
              controllerNames: firstNameController,
              validator: (value) => FormValidation().validateFirstName(value!),
              onChanged: (value) {},
            ),

            const SizedBox(height: 20),
            const LabelForm(
              labels: 'Last Name',
            ),
            NameForm(
              hintTextName: 'Smith',
              controllerNames: lastNameController,
              validator: (value) => FormValidation().validateLastName(value!),
              onChanged: (value) {},
            ),

            // Provinces
            const SizedBox(height: 20),
            const LabelForm(labels: "Provinces"),
            DropdownSearch(
              popupProps: const PopupProps.menu(
                showSearchBox: true,
              ),
              onChanged: (value) => setState(() {
                selectedProvinsi = value;
              }),
              selectedItem: selectedProvinsi,
              asyncItems: (String value) => Future.delayed(
                const Duration(milliseconds: 500),
                () => props.provinsi.map((e) => e.name!).toList(),
              ),
            ),

            // City
            const SizedBox(height: 20),
            const LabelForm(labels: "City"),
            DropdownSearch(
              popupProps: const PopupProps.menu(
                showSearchBox: true,
              ),
              
              onChanged: (value) => setState(() {
                selectedKota = value;
              }),
              selectedItem: selectedKota,
              asyncItems: (String value) => Future.delayed(
                const Duration(milliseconds: 500),
                () => props.kota.map((e) => e.name!).toList(),
              ),
            ),

            // Address
            const SizedBox(height: 20),
            const LabelForm(labels: "Address"),
            DropdownSearch(
              popupProps: const PopupProps.menu(
                showSearchBox: true,
              ),
              onChanged: (value) => setState(() {
                selectedKecamatan = value;
              }),
              selectedItem: selectedKecamatan,
              asyncItems: (String value) => Future.delayed(
                const Duration(milliseconds: 500),
                () => props.kecamatan.map((e) => e.name!).toList(),
              ),
            ),

            // Biodata
            const SizedBox(height: 20),
            const LabelForm(labels: "Biodata"),
            TextAreaForm(
              textController: bioDataController,
              validator: (value) => FormValidation().validateEmpty(value!),
            ),

            // Button
            const SizedBox(height: 20),
            FormButton(
              childs: const Text("Save", style: TextStyle(color: Colors.white, fontSize: 18)),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  submit();
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
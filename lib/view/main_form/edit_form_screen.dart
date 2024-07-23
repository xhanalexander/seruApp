import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seruapp/helper/db.dart';
import 'package:seruapp/view/components/button.dart';
import 'package:seruapp/view/components/form.dart';
import 'package:seruapp/view_models/wilayah_view_models.dart';

class EditFormScreen extends StatefulWidget {
  final String? provinsi;
  final String? kota;
  final String? kecamatan;

  const EditFormScreen({
    super.key,
    this.provinsi,
    this.kota,
    this.kecamatan,
  });

  @override
  State<EditFormScreen> createState() => _EditFormScreenState();
}

class _EditFormScreenState extends State<EditFormScreen> {
  // late SharedPreferences prefs;
  final formKeyUpdate = GlobalKey<FormState>();
  String? selectedProvinsi = "ACEH";
  String? selectedKota = "";
  String? selectedKecamatan = "";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WilayahViewModels>(context, listen: false).getProvinsis();
      Provider.of<WilayahViewModels>(context, listen: false).getKotas("");
      Provider.of<WilayahViewModels>(context, listen: false).getKecamatans("");
    });
  }

  void submitEdit() async {
    if (formKeyUpdate.currentState!.validate() || selectedProvinsi != null || selectedKota != null || selectedKecamatan != null) {

      Map<String, dynamic> formdata = {
        "provinsi": selectedProvinsi,
        "kota": selectedKota,
        "kecamatan": selectedKecamatan,
      };

      await DatabaseHelper().updateFormData(formdata);

      debugPrint(formdata.toString());
    }
  }
  

  @override
  Widget build(BuildContext context) {
    final props = Provider.of<WilayahViewModels>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Form"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKeyUpdate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  // Provinces
                  const SizedBox(height: 20),
                  const LabelForm(labels: "Provinces"),
                  DropdownSearch(
                    popupProps: const PopupProps.menu(
                      showSearchBox: true,
                    ),
                    onChanged: (value) => setState(() {
                      selectedProvinsi = value;
                      selectedKota = null;
                      selectedKecamatan = null;
                      if (value != null) {
                        final provinsi = props.provinsi.firstWhere((provinsi) => provinsi.name == value).id;
                        props.getKotas(provinsi!);
                      }
                    }),
                    selectedItem: selectedProvinsi,
                    asyncItems: (String value) => Future.delayed(
                      const Duration(milliseconds: 500),
                      () => props.provinsi.map((e) => e.name!).toList(),
                    ),
                  ),
          
                  // City Selection
                  const SizedBox(height: 20),
                  const LabelForm(labels: "City"),
                  DropdownSearch(
                    popupProps: const PopupProps.menu(
                      showSearchBox: true,
                    ),
                    
                    onChanged: (value) => setState(() {
                      selectedKota = value;
                      selectedKecamatan = null;
                      if (value != null) {
                        final kota = props.kota.firstWhere((kota) => kota.name == value).id;
                        props.getKecamatans(kota!);
                      }
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
          
                  // Button
                  const SizedBox(height: 20),
                  FormButton(
                    childs: const Text("Save", style: TextStyle(color: Colors.white, fontSize: 18)),
                    onPressed: () {
                      if (formKeyUpdate.currentState!.validate()) {
                        submitEdit();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Success"),
                              content: const Text("Data has been updated"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
          
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
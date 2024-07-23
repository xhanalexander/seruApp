import 'package:flutter/material.dart';
import 'package:seruapp/helper/db.dart';
import 'package:seruapp/view/main_form/edit_form_screen.dart';
import 'package:seruapp/view/main_form/form_screen.dart';

class DasboardView extends StatefulWidget {
  const DasboardView({super.key});

  @override
  State<DasboardView> createState() => _DasboardViewState();
}

class _DasboardViewState extends State<DasboardView> {
  List<Map<String, dynamic>> formDataList = [];

  @override
  void initState() {
    super.initState();    
    getFormData();
  }

  void getFormData() async {
    final dataProvinsi = await DatabaseHelper().getFormData();
    setState(() => formDataList = dataProvinsi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CRUD Wilayah Indonesia'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => getFormData(),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
          
                formDataList.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: const Center(
                        child: Text('Tidak ada data yang ditampilkan')
                        ),
                      )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: formDataList.length,
                        itemBuilder: (context, index) {
                          final data = formDataList[index];
                          return Card(
                            child: ListTile(
                              title: Text(data['provinsi'], style: const TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data['kota']),
                                  Text(data['kecamatan']),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EditFormScreen()));
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Konfirmasi'),
                                            content: const Text('Apakah anda yakin ingin menghapus data ini?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  DatabaseHelper().deleteFormData(data['id']);
                                                  getFormData();
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Ya'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: const Text('Tidak'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          );
                        },
                      ),
                    ),
              ],
            )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FormScreen())),
        child: const Icon(Icons.add),
      )
    );
  }
}
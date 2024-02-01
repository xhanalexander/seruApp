import 'package:flutter/material.dart';
import 'package:seruapp/view/components/button.dart';
import 'package:seruapp/view/components/form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScreenThird extends StatefulWidget {
  const FormScreenThird({super.key});

  @override
  State<FormScreenThird> createState() => _FormScrenThiredState();
}

class _FormScrenThiredState extends State<FormScreenThird> {
  late SharedPreferences prefs;
  
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelForm(
            labels: 'Data Confirmation',
          ),

          FormButton(
            onPressed: () {},
            childs: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 18)),
          )
          
        ],
      ),
    );
  }
}
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

  late String firstName = '';
  late String lastName = '';
  late String bio = '';
  late String province = '';
  late String city = '';
  late String address = '';
  
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
          const Align(
            alignment: Alignment.center,
            child: LabelForm(
              labels: 'Data Confirmation',
            ),
          ),

          const SizedBox(height: 20),
          const LabelForm(
            labels: 'First Name',
          ),
          Text(
            firstName,
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),
          const LabelForm(
            labels: 'Last Name',
          ),
          Text(
            lastName,
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),
          const LabelForm(
            labels: 'Bio',
          ),
          Text(
            bio,
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),
          const LabelForm(
            labels: 'Province',
          ),
          Text(
            province,
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),
          const LabelForm(
            labels: 'City',
          ),
          Text(
            city,
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),
          const LabelForm(
            labels: 'Address',
          ),
          Text(
            address,
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),
          const LabelForm(
            labels: 'Picture',
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